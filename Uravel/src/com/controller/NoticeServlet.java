package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.NoticeBiz;
import com.dto.MemberDto;
import com.dto.NoticeDto;

@WebServlet("/Notice")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[ command : " + command + " ]");

		MemberDto loginUser = (MemberDto) request.getSession().getAttribute("dto");

		NoticeBiz biz = new NoticeBiz();

		if (command.equals("noticelist")) {
			int page = 0;
			if (request.getParameter("page") == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}
			int begin = page * 20 - 19;
			int end = page * 20;

			int size = biz.count();
			List<NoticeDto> res = biz.list(begin, end);

			request.setAttribute("res", res);
			request.setAttribute("size", size);

			dispatch("notice/noticelist.jsp", request, response);

		} else if (command.equals("detail")) {
			int noticeno = Integer.parseInt(request.getParameter("noticeno"));
			NoticeDto res = biz.read(noticeno);

			request.setAttribute("res", res);

			dispatch("notice/noticedetail.jsp", request, response);

		} else if (command.equals("insertform")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				dispatch("Main?command=main", request, response);
				return;
			}
			response.sendRedirect("notice/insertform.jsp");

		} else if (command.equals("insert")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				dispatch("Main?command=main", request, response);
				return;
			}
			NoticeDto dto = new NoticeDto();
			dto.setTitle(request.getParameter("title"));
			dto.setContent(request.getParameter("content"));

			int res = biz.insert(dto);

			String msg = null;
			if (res > 0) {
				msg = "게시글이 작성되었습니다.";
			} else {
				msg = "게시글이 작성되지 않았습니다.";
			}

			request.setAttribute("msg", msg);
			dispatch("notice/executeresult.jsp", request, response);

		} else if (command.equals("updateform")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				dispatch("Main?command=main", request, response);
				return;
			}
			int noticeno = Integer.parseInt(request.getParameter("noticeno"));
			NoticeDto res = biz.read(noticeno);

			request.setAttribute("res", res);

			dispatch("notice/updateform.jsp", request, response);

		} else if (command.equals("update")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				dispatch("Main?command=main", request, response);
				return;
			}
			int noticeno = Integer.parseInt(request.getParameter("noticeno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			NoticeDto dto = new NoticeDto();

			dto.setNoticeno(noticeno);
			dto.setTitle(title);
			dto.setContent(content);

			int res = biz.update(dto);

			String msg = null;
			if (res > 0) {
				msg = "게시글이 수정되었습니다.";
			} else {
				msg = "게시글이 수정되지 않았습니다.";
			}

			request.setAttribute("msg", msg);
			dispatch("notice/executeresult.jsp", request, response);

		} else if (command.equals("delete")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				dispatch("Main?command=main", request, response);
				return;
			}
			int noticeno = Integer.parseInt(request.getParameter("noticeno"));

			int res = biz.delete(noticeno);

			String msg = null;
			if (res > 0) {
				msg = "게시글이 삭제되었습니다.";
			} else {
				msg = "게시글이 삭제되지 않았습니다.";
			}

			request.setAttribute("msg", msg);
			dispatch("notice/executeresult.jsp", request, response);

		} else if (command.equals("search")) {
			List<NoticeDto> res = biz.search(request.getParameter("keyword"));

			request.setAttribute("res", res);

			dispatch("notice/searchlist.jsp", request, response);

		}
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
