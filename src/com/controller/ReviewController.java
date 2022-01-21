package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MemberDao;
import com.dao.ReviewDao;
import com.dto.LocationDto;
import com.dto.MemberDto;
import com.dto.ReviewDto;
import com.dto.ThemeDto;
import com.dto.TravelDto;

public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getContextPath());
		String command;

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		ReviewDao dao = new ReviewDao();

		MemberDto loginUser = (MemberDto) request.getSession().getAttribute("userInfo");
		command = request.getParameter("command");

		System.out.println("[command:" + command + "]");

		if (command.equals("searchReview")) {
			System.out.println("keyword : " + request.getParameter("keyword"));

			List<ReviewDto> list = dao.searchReview(request.getParameter("keyword"));

			request.setAttribute("list", list);
			RequestDispatcher dis = request.getRequestDispatcher("review/review_searchresult.jsp");
			dis.forward(request, response);

		} else if (command.equals("findReview")) {
			List<ReviewDto> list = dao.findReview(request.getParameter("localname"), request.getParameter("themename"));

			request.setAttribute("list", list);
			RequestDispatcher dis = request.getRequestDispatcher("review/review_findresult.jsp");
			dis.forward(request, response);

		} else if (command.equals("list")) {
			List<ReviewDto> list = dao.selectAll();

			request.setAttribute("list", list);
			RequestDispatcher disp = request.getRequestDispatcher("review/reviewlist.jsp");
			disp.forward(request, response);

		} else if (command.equals("detail")) {
			int postno = Integer.parseInt(request.getParameter("postno"));

			ReviewDto dto = dao.selectOne(postno);
			dto.setTravelname(dao.getTravelname(dto.getTravelno()));

			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("review/reviewdetail.jsp");
			dis.forward(request, response);

		} else if (command.equals("writeform")) {
			if (loginUser == null) {
				String msg = "회원 전용 기능입니다";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("review/executeresult.jsp", request, response);

				return;

			}

			List<TravelDto> travel_list = dao.selectTravel();

			request.setAttribute("travel_list", travel_list);
			RequestDispatcher dis = request.getRequestDispatcher("review/reviewwrite.jsp");
			dis.forward(request, response);

		} else if (command.equals("updateform")) {
			int postno = Integer.parseInt(request.getParameter("postno"));

			ReviewDto res = dao.selectOne(postno);

			if (loginUser == null || res.getUserno() != loginUser.getUserno()) {
				String msg = "다른 사용자의 후기는 수정할 수 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("review/executeresult.jsp", request, response);

				return;
			}

			List<TravelDto> travel_list = dao.selectTravel();
			List<LocationDto> locallist = dao.selectLocation();
			List<ThemeDto> themelist = dao.selectTheme();

			request.setAttribute("travel_list", travel_list);
			request.setAttribute("locallist", locallist);
			request.setAttribute("themelist", themelist);

			ReviewDto dto = dao.selectOne(postno);

			request.setAttribute("dto", dto);

			dispatch("review/reviewupdate.jsp", request, response);

		} else if (command.equals("delete")) {
			int postno = Integer.parseInt(request.getParameter("postno"));

			ReviewDto res = dao.selectOne(postno);

			if (loginUser == null || res.getUserno() != loginUser.getUserno()) {
				if (!loginUser.getRole().equals("ADMIN")) {
					String msg = "다른 사용자의 후기는 삭제할 수 없습니다.";
					String executeType = "failure";

					request.setAttribute("msg", msg);
					request.setAttribute("executeType", executeType);

					dispatch("review/executeresult.jsp", request, response);

					return;
				}
			}

			int res1 = dao.delete(postno);

			if (res1 > 0) {
				dispatch("ReviewController?command=list", request, response);
			} else {
				dispatch("ReviewController?command=detail&postno=" + postno, request, response);
			}
		}
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
