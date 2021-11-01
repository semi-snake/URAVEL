package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.MainBiz;
import com.dto.HistoryDto;
import com.dto.MemberDto;
import com.dto.TravelDto;

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[ command : " + command + " ]");

		MainBiz biz = new MainBiz();

		/*
		 * 메인 페이지
		 */
		if (command.equals("main")) { // 메인 페이지로 이동
			MemberDto loginUser = (MemberDto) request.getSession().getAttribute("loginUser");
			
			if (loginUser != null) {
				request.setAttribute("mainPrefered", biz.list("pf", loginUser.getUserno()));
			}

			// 날씨 정보 설정
			request.setAttribute("w_dto", biz.forecast());

			// 인기 여행지 정보 설정
			request.setAttribute("mainPopular", biz.list("pp", 0));

			dispatch("main/main.jsp", request, response);

		} else if (command.equals("searchMain")) { // 메인 페이지에서 검색된 결과를 보여줌
			List<TravelDto> res = biz.search(request.getParameter("keyword"));
			List<HistoryDto> res_h = biz.search(request.getParameter("keyword"), null);

			request.setAttribute("res", res);
			request.setAttribute("res_h", res_h);

			dispatch("main/searchresult.jsp", request, response);
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
