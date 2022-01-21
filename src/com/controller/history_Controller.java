package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.HistoryBizImpl;
import com.dto.HistoryDto;
import com.dto.MemberDto;
import com.dto.TravelDto;

public class history_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		MemberDto loginUser = (MemberDto) request.getSession().getAttribute("userInfo");
		System.out.println(loginUser);

		String command = request.getParameter("command");
		System.out.println("[command : " + command + "]");

		HistoryBizImpl biz = new HistoryBizImpl();

		if (command.equals("history-search")) {
			System.out.println("keyword : " + request.getParameter("keyword"));
			dispatch("searchmain.jsp", request, response);
		}

		else if (command.equals("list")) {
			String language = request.getParameter("language");
			System.out.println(language);
			List<HistoryDto> list = biz.selectAll(language);

			System.out.println("list : " + request.getParameter("list"));
			request.setAttribute("list", list);

			dispatch("history_list.jsp", request, response);

		} else if (command.equals("desc")) {
			int historyno = Integer.parseInt(request.getParameter("historyno"));

			String language = request.getParameter("language");
			System.out.println(language);

			HistoryDto dto = biz.selectOne(historyno, language);

			// language 선택한 것을 parameter로 받아오기

			request.setAttribute("dto", dto);

			System.out.println("desc : " + request.getParameter("desc"));
			dispatch("history_info.jsp", request, response);

		}

		/*
		 * 관리자 기능
		 */
		else if (command.equals("writeform")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				jsResponse("작성 권한이 없습니다.", "history_Controller?command=list", response);
			} else {
				response.sendRedirect("history_insertinfo.jsp");
			}
		} else if (command.equals("write")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				jsResponse("작성 권한이 없습니다.", "history_Controller?command=list", response);
			} else { // INSERT INTO
				// TRAVEL(TRAVELNO,TRAVELNAME,LOCALCODE,THEMECODE,ADDRESS,DESCRIPTION,URL_PIC)
				// VALUES(TRAVELSEQ.NEXTVAL,?,?,6,?,?,?)
				String travelname = request.getParameter("history-form-title");
				int localcode = Integer.parseInt(request.getParameter("localcode"));
				String address = request.getParameter("address");
				String url_pic1 = request.getParameter("history-form-url1");
				String url_pic2 = request.getParameter("history-form-url2");
				String description = request.getParameter("history-form-content");
				String url_pic = url_pic1 + "," + url_pic2;
				String source = request.getParameter("history-form-source");
				System.out.println(url_pic);
				System.out.println(description);
				System.out.println(localcode);

				TravelDto tdto = new TravelDto();
				tdto.setTravelname(travelname);
				tdto.setLocalcode(localcode);
				tdto.setAddress(address);
				tdto.setDescription(description);
				tdto.setUrl_pic(url_pic);

				HistoryDto dto = new HistoryDto();
				dto.setTravelname(travelname);
				dto.setUrl_pic1(url_pic1);
				dto.setUrl_pic2(url_pic2);
				dto.setDescription(description);
				dto.setSource(source);

				boolean res = biz.insert(dto, tdto);

				if (res) {
					jsResponse("글 작성 성공", "history_Controller?command=list", response);
				} else {
					jsResponse("글 작성 실패", "history_Controller?command=writeform", response);
				}

			}
		}

		else if (command.equals("updateform")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				jsResponse("수정 권한이 없습니다.", "history_Controller?command=list", response);
			} else {
				int historyno = Integer.parseInt(request.getParameter("historyno"));

				String language = null;

				HistoryDto dto = biz.selectOne(historyno, language);

				request.setAttribute("dto", dto);
				dispatch("history_updateinfo.jsp", request, response);
			}
		}

		else if (command.equals("update")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				jsResponse("수정 권한이 없습니다.", "history_Controller?command=list", response);
			} else {
				String travelname = request.getParameter("history-form-title");
				String url_pic1 = request.getParameter("history-form-url1");
				String url_pic2 = request.getParameter("history-form-url2");
				String description = request.getParameter("history-form-content");
				String source = request.getParameter("history-form-source");
				int historyno = Integer.parseInt(request.getParameter("historyno").trim());

				HistoryDto dto = new HistoryDto();
				dto.setTravelname(travelname);
				dto.setUrl_pic1(url_pic1);
				dto.setUrl_pic2(url_pic2);
				dto.setDescription(description);
				dto.setSource(source);
				dto.setHistoryno(historyno);

				boolean res = biz.update(dto);

				if (res) {
					jsResponse("글 수정 성공", "history_Controller?command=desc&historyno=" + historyno, response);
				} else {
					jsResponse("글 수정 실패", "history_Controller?command=update&historyno=" + historyno, response);
				}
			}
		}

		else if (command.equals("delete")) {
			if (loginUser == null || !(loginUser.getRole().equals("ADMIN"))) {
				jsResponse("삭제 권한이 없습니다.", "history_Controller?command=list", response);
			} else {
				int historyno = Integer.parseInt(request.getParameter("historyno"));
				boolean res = biz.delete(historyno);

				if (res) {
					jsResponse("글 삭제 성공", "history_Controller?command=list", response);
				} else {
					jsResponse("글 삭제 실패", "history_Controller?command=desc&historyno=" + historyno, response);
				}
			}
		}

		/*
		 * 관리자 기능 끝
		 */
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
