package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.FileInfo;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.dao.MemberDao;
import com.dao.ReviewDao;
import com.dto.LocationDto;
import com.dto.MemberDto;
import com.dto.ReviewDto;
import com.dto.ThemeDto;
import com.dto.TravelDto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_PATH = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getContextPath());
		String command;

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		ReviewDao dao = new ReviewDao();
		MemberDao m_dao = new MemberDao();

		MemberDto loginUser = (MemberDto) request.getSession().getAttribute("dto");
		command = request.getParameter("command");

		System.out.println("[command:" + command + "]");

		if (command.equals("searchReview")) {
			System.out.println("keyword : " + request.getParameter("keyword"));

			String title = request.getParameter("title");
			// String content = request.getParameter("content");
			List<ReviewDto> list = dao.searchReview(request.getParameter("keyword"));

			request.setAttribute("list", list);
			RequestDispatcher dis = request.getRequestDispatcher("review_searchresult.jsp");
			dis.forward(request, response);

		} else if (command.equals("findReview")) {
			String title = request.getParameter("title");
			List<ReviewDto> list = dao.findReview(request.getParameter("localname"), request.getParameter("themename"));

			request.setAttribute("list", list);
			RequestDispatcher dis = request.getRequestDispatcher("review_findresult.jsp");
			dis.forward(request, response);

		} else if (command.equals("list")) {
			List<ReviewDto> list = dao.selectAll();

			request.setAttribute("list", list);
			RequestDispatcher disp = request.getRequestDispatcher("reviewlist.jsp");
			disp.forward(request, response);

		} else if (command.equals("detail")) {
			List<TravelDto> travel_list = dao.selectTravel();
			List<LocationDto> locallist = dao.selectLocation();
			List<ThemeDto> themelist = dao.selectTheme();
			int postno = Integer.parseInt(request.getParameter("postno"));

			ReviewDto dto = dao.selectOne(postno);
			dto.setTravelname(dao.getTravelname(dto.getTravelno()));

			request.setAttribute("locallist", locallist);
			request.setAttribute("themelist", themelist);

			request.setAttribute("travel_list", travel_list);

			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("reviewdetail.jsp");
			dis.forward(request, response);
		} else if (loginUser == null) {
			String msg = "로그인 후 이용 가능합니다.";
			String executeType = "logoutUser";

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", executeType);

			dispatch("/user/main_index.jsp", request, response);
			return;
		} else if (command.equals("writeform")) {
			List<TravelDto> travel_list = dao.selectTravel();
			List<LocationDto> locallist = dao.selectLocation();
			List<ThemeDto> themelist = dao.selectTheme();

			request.setAttribute("locallist", locallist);
			request.setAttribute("themelist", themelist);
			request.setAttribute("travel_list", travel_list);
			// request.setAttribute("themelist", themelist);)
			RequestDispatcher dis = request.getRequestDispatcher("review/reviewwrite.jsp");
			dis.forward(request, response);

		} else if (command.equals("updateform")) {
			int postno = Integer.parseInt(request.getParameter("postno"));
			List<TravelDto> travel_list = dao.selectTravel();
			List<LocationDto> locallist = dao.selectLocation();
			List<ThemeDto> themelist = dao.selectTheme();

			ReviewDto res = dao.selectOne(postno);

			if (res.getUserno() != loginUser.getUserno()) {
				String msg = "다른 사용자의 후기는 수정할 수 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("/review/ReviewController?command=list", request, response);

				return;
			} else {

				// int postno = Integer.parseInt(request.getParameter("postno"));
				request.setAttribute("travel_list", travel_list);
				request.setAttribute("locallist", locallist);
				request.setAttribute("themelist", themelist);
				ReviewDto dto = dao.selectOne(postno);
				request.setAttribute("dto", dto);
				dispatch("reviewupdate.jsp", request, response);
			}
		} else if (command.equals("delete")) {
			int postno = Integer.parseInt(request.getParameter("postno"));

			ReviewDto res = dao.selectOne(postno);

			if (res.getUserno() != loginUser.getUserno()) {
				String msg = "다른 사용자의 후기는 삭제할 수 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("/review/ReviewController?command=list", request, response);

				return;
			} else {

				// int postno = Integer.parseInt(request.getParameter("postno"));
				int res1 = dao.delete(postno);

				if (res1 > 0) {
					dispatch("ReviewController?command=list", request, response);
				} else {
					dispatch("ReviewController?command=detail&postno=" + postno, request, response);
				}

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
