package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.InquiryBiz;
import com.dto.InquiryDto;
import com.dto.MemberDto;

@WebServlet("/Inquiry")
public class InquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		MemberDto loginUser = (MemberDto) request.getSession().getAttribute("dto");

		InquiryBiz biz = new InquiryBiz();

		/*
		 * 로그인 전용 기능 ( 비로그인 사용자는 사용 불가능 )
		 */
		if (loginUser == null) {
			String msg = "로그인 후 이용 가능합니다.";
			String executeType = "logoutUser";

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", executeType);

			dispatch("inquiry/executeresult.jsp", request, response);
			return;
		}

		String command = request.getParameter("command");
		System.out.println("[ command : " + command + " ]");

		if (command.equals("inqlist")) {
			int page = 0;
			if (request.getParameter("page") == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}
			int begin = page * 20 - 19;
			int end = page * 20;

			int size = biz.count();
			List<InquiryDto> res = biz.list(begin, end);

			request.setAttribute("res", res);
			request.setAttribute("size", size);

			dispatch("inquiry/inqlist.jsp", request, response);

		} else if (command.equals("insertform")) {
			response.sendRedirect("inquiry/insertform.jsp");

		} else if (command.equals("insert")) {
			InquiryDto dto = new InquiryDto();

			dto.setUserno(loginUser.getUserno());
			dto.setTitle(request.getParameter("title"));
			dto.setContent(request.getParameter("content").replace("\n", "<br>"));
			dto.setQue_type(request.getParameter("que_type"));

			int res = biz.write(dto);

			String msg = null;
			String executeType = null;

			if (res > 0) {
				msg = "문의가 접수되었습니다.";
				executeType = "success";
			} else {
				msg = "문의가 접수되지않았습니다.";
				executeType = "failure";
			}

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", executeType);

			dispatch("inquiry/executeresult.jsp", request, response);

		} else if (command.equals("detail")) {
			int inqno = Integer.parseInt(request.getParameter("inqno"));

			List<InquiryDto> res = biz.readList(inqno);

			boolean flag = false;

			for (int i = 0; i < res.size(); i++) {
				InquiryDto tmp = res.get(i);

				if (tmp.getUserno() == loginUser.getUserno()) {
					flag = true;
				}
			}

			if (!flag) {
				if (!(loginUser.getRole().equals("ADMIN"))) {
					String msg = "다른 사용자의 게시글은 읽을 수 없습니다.";
					String executeType = "failure";

					request.setAttribute("msg", msg);
					request.setAttribute("executeType", executeType);

					dispatch("inquiry/executeresult.jsp", request, response);

					return;
				}
			}

			request.setAttribute("res", res);

			dispatch("inquiry/inqdetail.jsp", request, response);

		} else if (command.equals("updateform")) {
			int inqno = Integer.parseInt(request.getParameter("inqno"));

			InquiryDto res = biz.read(inqno);

			if (res.getUserno() != loginUser.getUserno()) {
				String msg = "다른 사용자의 게시글은 수정할 수 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			} else if (res.getStatus().equals("답변완료")) {
				String msg = "답변이 작성된 게시글은 수정할 수 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			}

			request.setAttribute("res", res);

			dispatch("inquiry/updateform.jsp", request, response);

		} else if (command.equals("update")) {
			int inqno = Integer.parseInt(request.getParameter("inqno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String que_type = request.getParameter("que_type");

			InquiryDto current_data = biz.read(inqno);
			int userno = current_data.getUserno();
			String status = current_data.getStatus();

			if (userno != loginUser.getUserno()) {
				String msg = "다른 사용자의 게시글은 수정할 수 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			} else if (status.equals("답변완료")) {
				String msg = "답변이 작성된 게시글은 수정할 수 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			} else if (status.equals("삭제")) {
				String msg = "삭제된 게시글은 수정할 수 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			}

			InquiryDto insert_data = new InquiryDto();
			insert_data.setInqno(inqno);
			insert_data.setTitle(title);
			insert_data.setContent(content);
			insert_data.setQue_type(que_type);

			int res = biz.modify(insert_data);

			String msg;
			String executeType;

			if (res > 0) {
				msg = "문의가 수정되었습니다.";
				executeType = "success";
			} else {
				msg = "문의가 수정되지않았습니다.";
				executeType = "failure";
			}

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", executeType);

			dispatch("inquiry/executeresult.jsp", request, response);

		} else if (command.equals("replyform")) {
			int inqno = Integer.parseInt(request.getParameter("inqno"));

			InquiryDto current_data = biz.read(inqno);
			int userno = current_data.getUserno();
			String status = current_data.getStatus();

			if (userno != loginUser.getUserno()) {
				if (!(loginUser.getRole().equals("ADMIN"))) {
					String msg = "작성 권한이 없습니다.";
					String executeType = "failure";

					request.setAttribute("msg", msg);
					request.setAttribute("executeType", executeType);

					dispatch("inquiry/executeresult.jsp", request, response);

					return;
				}

			} else if (status.equals("답변완료") || status.equals("COMPLETE")) {
				String msg = "답변이 완료된 게시글입니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			} else if (status.equals("삭제") || status.equals("DISCARD")) {
				String msg = "삭제된 게시글입니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			}

			current_data.setTitle("	RE: " + current_data.getTitle());

			request.setAttribute("current_data", current_data);

			dispatch("inquiry/replyform.jsp", request, response);

		} else if (command.equals("reply")) {
			int inqno = Integer.parseInt(request.getParameter("inqno"));

			InquiryDto current_data = biz.read(inqno);
			String status = current_data.getStatus();

			if (!(loginUser.getRole().equals("ADMIN"))) {
				String msg = "작성 권한이 없습니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			} else if (status.equals("답변완료") || status.equals("COMPLETE")) {
				String msg = "답변이 완료된 게시글입니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			} else if (status.equals("삭제") || status.equals("DISCARD")) {
				String msg = "삭제된 게시글입니다.";
				String executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			}

			String title = "　RE: " + current_data.getTitle();
			String content = request.getParameter("content").replace("\n", "<br>");
			String que_type = current_data.getQue_type();
			int groupno = current_data.getGroupno();

			InquiryDto dto = new InquiryDto();
			dto.setUserno(loginUser.getUserno());
			dto.setTitle(title);
			dto.setContent(content);
			dto.setQue_type(que_type);
			dto.setGroupno(groupno);

			int res = biz.reply(dto);

			String msg;
			String executeType;

			if (res > 0) {
				msg = "답변이 작성되었습니다.";
				executeType = "success";
			} else {
				msg = "답변이 작성되지않았습니다.";
				executeType = "failure";
			}

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", executeType);

			dispatch("inquiry/executeresult.jsp", request, response);
		} else if (command.equals("delete")) {
			int inqno = Integer.parseInt(request.getParameter("inqno"));

			InquiryDto current_data = biz.read(inqno);
			int userno = current_data.getUserno();
			String status = current_data.getStatus();

			String msg;
			String executeType;

			if (userno != loginUser.getUserno()) {
				msg = "삭제 권한이 없습니다.";
				executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			} else if (status.equals("삭제") || status.equals("DISCARD")) {
				msg = "삭제된 게시글입니다.";
				executeType = "failure";

				request.setAttribute("msg", msg);
				request.setAttribute("executeType", executeType);

				dispatch("inquiry/executeresult.jsp", request, response);

				return;

			}

			int res = biz.discard(current_data.getGroupno());

			if (res > 0) {
				msg = "글이 삭제되었습니다.";
				executeType = "failure";
			} else {
				msg = "글이 삭제되지 않았습니다.";
				executeType = "failure";
			}

			request.setAttribute("msg", msg);
			request.setAttribute("executeType", executeType);

			dispatch("inquiry/executeresult.jsp", request, response);
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
