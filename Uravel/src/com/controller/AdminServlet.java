package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.AdminBiz;
import com.dto.MemberDto;
import com.dto.TravelDto;

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		MemberDto loginUser = (MemberDto) request.getSession().getAttribute("userInfo");
		if (loginUser == null || loginUser.getRole().equals("USER")) {
			dispatch("main/main.jsp", request, response);
			return;
		}

		String command = request.getParameter("command");
		System.out.println("[ command : " + command + " ]");

		AdminBiz biz = new AdminBiz();
		/*
		 * 관리자 페이지 - 여행지 정보 관리
		 */
		if (command.equals("travellist")) {
			int page = 0;
			if (request.getParameter("page") == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}
			int begin = page * 20 - 19;
			int end = page * 20;

			int size = biz.count();
			List<TravelDto> res = (List<TravelDto>) biz.list(begin, end);

			request.setAttribute("res", res);
			request.setAttribute("size", size);

			dispatch("admin/t_travellist.jsp", request, response);

		} else if (command.equals("travelinfo")) {
			int travelno = Integer.parseInt(request.getParameter("travelno"));

			TravelDto res = biz.read(travelno);
			request.setAttribute("res", res);

			dispatch("admin/t_travelinfo.jsp", request, response);

		} else if (command.equals("insertTravel")) {
			dispatch("admin/t_insertinfo.jsp", request, response);

		} else if (command.equals("updateTravel")) {
			int travelno = Integer.parseInt(request.getParameter("travelno"));

			TravelDto res = biz.read(travelno);
			request.setAttribute("res", res);

			dispatch("admin/t_updateinfo.jsp", request, response);

		} else if (command.equals("deleteTravel")) {
			int travelno = Integer.parseInt(request.getParameter("travelno"));

			int res = biz.delete(travelno);

			String msg = null;
			if (res > 0) {
				msg = "데이터가 삭제되었습니다.";
			} else {
				msg = "데이터가 삭제되지 않았습니다.";
			}

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", "travel");
			dispatch("admin/executeresult.jsp", request, response);

		} else if (command.equals("updateInfo")) {
			TravelDto dto = new TravelDto();

			dto.setTravelno(Integer.parseInt(request.getParameter("travelno")));
			dto.setTravelname(request.getParameter("travelname"));
			dto.setLocalcode(Integer.parseInt(request.getParameter("localcode")));
			dto.setThemecode(Integer.parseInt(request.getParameter("themecode")));
			dto.setAddress(request.getParameter("address"));
			dto.setDescription(request.getParameter("description"));
			dto.setUrl_pic(request.getParameter("url_pic"));

			int res = biz.update(dto);

			String msg = null;
			if (res > 0) {
				msg = "데이터가 수정되었습니다.";
			} else {
				msg = "데이터가 수정되지 않았습니다.";
			}

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", "travel");
			dispatch("admin/executeresult.jsp", request, response);

		} else if (command.equals("insertInfo")) {
			TravelDto dto = new TravelDto();

			dto.setTravelname(request.getParameter("travelname"));
			dto.setLocalcode(Integer.parseInt(request.getParameter("localcode")));
			dto.setThemecode(Integer.parseInt(request.getParameter("themecode")));
			dto.setAddress(request.getParameter("address"));
			dto.setDescription(request.getParameter("description"));
			dto.setUrl_pic(request.getParameter("url_pic"));

			int res = biz.insert(dto);

			String msg = null;
			if (res > 0) {
				msg = "데이터가 추가되었습니다.";
			} else {
				msg = "데이터가 추가되지 않았습니다.";
			}

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", "travel");
			dispatch("admin/executeresult.jsp", request, response);

		} else if (command.equals("search")) {
			List<TravelDto> res = biz.search(request.getParameter("keyword"));
			request.setAttribute("res", res);
			dispatch("admin/t_searchlist.jsp", request, response);

		} else if (command.equals("locallist")) {
			int page = 0;

			if (request.getParameter("page") == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}

			int localcode = 1;
			if (request.getParameter("localcode") != null) {
				localcode = Integer.parseInt(request.getParameter("localcode"));
			}

			int begin = page * 20 - 19;
			int end = page * 20;

			int size = biz.count(1, localcode);
			List<TravelDto> res = (List<TravelDto>) biz.list(1, localcode, begin, end);

			request.setAttribute("res", res);
			request.setAttribute("size", size);
			request.setAttribute("localcode", localcode);

			dispatch("admin/t_locallist.jsp", request, response);

		} else if (command.equals("themelist")) {
			int page = 0;

			if (request.getParameter("page") == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}

			int themecode = 1;
			if (request.getParameter("themecode") != null) {
				themecode = Integer.parseInt(request.getParameter("themecode"));
			}

			int begin = page * 20 - 19;
			int end = page * 20;

			int size = biz.count(2, themecode);
			List<TravelDto> res = (List<TravelDto>) biz.list(2, themecode, begin, end);

			request.setAttribute("res", res);
			request.setAttribute("size", size);
			request.setAttribute("themecode", themecode);

			dispatch("admin/t_themelist.jsp", request, response);

		}
		/*
		 * 관리자 페이지 - 사용자 정보 관리
		 */
		else if (command.equals("userlistAll")) {
			int page = 0;
			if (request.getParameter("page") == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}
			int begin = page * 20 - 19;
			int end = page * 20;

			String type = "ma";

			int size = biz.count(type);
			List<MemberDto> res = (List<MemberDto>) biz.list(type, begin, end);

			request.setAttribute("res", res);
			request.setAttribute("size", size);

			dispatch("admin/m_userlistAll.jsp", request, response);

		} else if (command.equals("userListEnabled")) {
			int page = 0;
			if (request.getParameter("page") == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}
			int begin = page * 20 - 19;
			int end = page * 20;

			String type = "me";

			int size = biz.count(type);
			List<MemberDto> res = (List<MemberDto>) biz.list(type, begin, end);

			request.setAttribute("res", res);
			request.setAttribute("size", size);

			dispatch("admin/m_userlistEnabled.jsp", request, response);

		} else if (command.equals("disableUser")) {
			String[] userArray = request.getParameterValues("userno");

			int[] res = biz.disable(userArray);

			String msg = null;
			if (res.length == userArray.length) {
				msg = "회원 정보가 비활성화 되었습니다.";
			} else {
				msg = "회원 정보가 비활성화 되지 않았습니다.";
			}

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", "user");

			dispatch("admin/executeresult.jsp", request, response);
		} else if (command.equals("searchUser")) {
			List<MemberDto> res = biz.search(request.getParameter("keyword"), null);
			request.setAttribute("res", res);
			dispatch("admin/m_searchuser.jsp", request, response);
		}
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
