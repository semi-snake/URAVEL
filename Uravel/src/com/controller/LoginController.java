package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.MainBiz;
import com.dao.MemberDao;
import com.dao.UserLocalDao;
import com.dao.UserThemeDao;
import com.dto.HistoryDto;
import com.dto.MemberDto;
import com.dto.TravelDto;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String command = request.getParameter("command");
		System.out.println("[command: " + command + "]");

		MemberDao dao = new MemberDao();

		if (command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			MemberDto dto = dao.login(id, pw);

			if (dto.getUserid() != null) {

				request.getSession().setAttribute("userInfo", dto);
				request.getSession().setMaxInactiveInterval(60 * 60);

				response.sendRedirect("/Uravel/Main?command=main");

			} else {
				dispatch("/user/index.jsp", request, response);
			}
		}

		else if (command.equals("loginform")) {
			response.sendRedirect("index.jsp");
		} else if (command.equals("registform")) {
			response.sendRedirect("registform.jsp");
		} else if (command.equals("idchk")) {
			String userid = request.getParameter("id");
			String res = dao.idChk(userid);

			boolean idnotused = true;
			if (res != null) {
				idnotused = false;
			}

			response.sendRedirect("idchk.jsp?idnotused=" + idnotused);
		} else if (command.equals("insertuser")) {
			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");
			String username = request.getParameter("username");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");

			String[] thema = request.getParameterValues("thema");
			String[] local = request.getParameterValues("local");

			MemberDto dto = new MemberDto();
			dto.setUserid(userid);
			dto.setUserpw(userpw);
			dto.setUsername(username);
			dto.setBirth(birth);
			dto.setEmail(email);
			dto.setPhone(phone);

			int res = dao.insertuser(dto);

			if (thema != null) {
				UserThemeDao userThemeDao = new UserThemeDao();
				for (int i = 0; i < thema.length; i++) {
					res = userThemeDao.insertTheme(userid, thema[i]);
				}
			}

			if (local != null) {
				UserLocalDao userLocalDao = new UserLocalDao();
				for (int i = 0; i < local.length; i++) {
					res = userLocalDao.insertLocal(userid, local[i]);
				}
			}
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