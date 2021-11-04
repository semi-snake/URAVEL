package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.TravelBiz;
import com.dto.TravelDetailDto;
import com.dto.TravelListDto;

// 지역명, 지역 여행지 리스트 서블릿
public class TravelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 지역구 코드별 입력
		String command = request.getParameter("command");

		// 상세보기 페이지의 필요한 여행지번호 파라미터

		// 지역구 해당 게시판 리스트 실행
		TravelBiz travelBiz = new TravelBiz();

		if (command.equals("list")) {
			// 지역 여행지 조회
			List<TravelListDto> travelList = travelBiz
					.selectTravelList(Integer.parseInt(request.getParameter("localcode")));
			request.setAttribute("travelList", travelList);

			String localName = travelBiz.selectLocalName(Integer.parseInt(request.getParameter("localcode")));
			request.setAttribute("localName", localName);

			dispatch("travel/travelboard.jsp", request, response);

		}

		else if (command.equals("detail")) {
			TravelDetailDto travelDetail = travelBiz
					.selectTravelDetail(Integer.parseInt(request.getParameter("travelno")));
			request.setAttribute("travelDetail", travelDetail);

			dispatch("travel/travelboard_detail.jsp", request, response);
		}

		else if (command.equals("theme")) {
			List<TravelListDto> themeList = travelBiz
					.selectThemeList(Integer.parseInt(request.getParameter("themecode")));
			request.setAttribute("themeList", themeList);

			dispatch("travel/travelThemeBoard.jsp", request, response);

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
