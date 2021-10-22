package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AdminDao;
import com.dao.MainDao;
import com.dao.WeatherDao;
import com.dto.TravelDto;

public class UravelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[ command : " + command + " ]");

		AdminDao a_dao = new AdminDao();
		WeatherDao w_dao = new WeatherDao();
		MainDao m_dao = new MainDao();

		/*
		 * 메인 페이지
		 */
		if (command.equals("main")) { // 메인 페이지로 이동
			request.setAttribute("w_dto", w_dao.forecast());
			dispatch("main/main_index.jsp", request, response);
		} else if (command.equals("searchMain")) { // 메인 페이지에서 검색된 결과를 보여줌
			List<TravelDto> res = m_dao.search(request.getParameter("keyword"));
			System.out.println("res : " + res.size());
			request.setAttribute("res", res);
			dispatch("main/main_searchresult.jsp", request, response);
		}
		/*
		 * 관리자 페이지 - 여행지 정보 관리
		 */
		else if (command.equals("travellist")) { // 여행지 정보 리스팅
			int page = 0;
			if (request.getParameter("page") == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}
			int begin = page * 15 - 14;
			int end = page * 15;

			int size = a_dao.countTravel();
			List<TravelDto> res = a_dao.selectTravel(begin, end);

			request.setAttribute("res", res);
			request.setAttribute("size", size);

			dispatch("admin/admin_travellist.jsp", request, response);
		} else if (command.equals("travelinfo")) { // 여행지 정보 상세 보기
			int travelno = Integer.parseInt(request.getParameter("travelno"));

			TravelDto res = a_dao.selectInfo(travelno);
			request.setAttribute("res", res);

			dispatch("admin/admin_travelinfo.jsp", request, response);

		} else if (command.equals("insertTravel")) { // 여행지 정보 등록 페이지로 이동
			dispatch("admin/admin_insertinfo.jsp", request, response);

		} else if (command.equals("updateTravel")) { // 여행지 정보 수정 페이지로 이동
			int travelno = Integer.parseInt(request.getParameter("travelno"));

			TravelDto res = a_dao.selectInfo(travelno);
			request.setAttribute("res", res);

			dispatch("admin/admin_updateinfo.jsp", request, response);

		} else if (command.equals("deleteTravel")) { // 여행지 정보 삭제하기
			int travelno = Integer.parseInt(request.getParameter("travelno"));
			System.out.println("travelno : " + travelno);
		} else if (command.equals("updateInfo")) { // request 객체에 담긴 정보를 토대로 update
			int travelno = Integer.parseInt(request.getParameter("travelno"));
			System.out.println("travelno : " + travelno);

		} else if (command.equals("insertInfo")) { // request 객체에 담긴 정보를 토대로 insert
			int travelno = Integer.parseInt(request.getParameter("travelno"));
			System.out.println("travelno : " + travelno);
		}
		/*
		 * 관리자 페이지 - 사용자 정보 관리
		 */
		else if (command.equals("userlistAll")) {
			dispatch("admin/admin_userlistAll.jsp", request, response);
		} else if (command.equals("userListEnabled")) {
			dispatch("admin/admin_userlistEnabled.jsp", request, response);
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
