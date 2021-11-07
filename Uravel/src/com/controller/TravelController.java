package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDto;
import com.dto.TravelDto;
import com.travel.biz.TravelBiz;
import com.travel.dto.TravelDetailDto;
import com.travel.dto.TravelListDto;

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
			
			if(command.equals("list")) {
				// 지역 여행지 조회
				List<TravelListDto> travelList = travelBiz.selectTravelList(Integer.parseInt(request.getParameter("localcode")));
				request.setAttribute("travelList",travelList);
				
				
				String localName = travelBiz.selectLocalName(Integer.parseInt(request.getParameter("localcode")));
				request.setAttribute("localName",localName);

				
				dispatch("travel/travelboard.jsp", request, response);
				
			}

			
			else if(command.equals("areadetail")) {
				
				int travelno = Integer.parseInt(request.getParameter("travelno"));
				TravelDetailDto travelDetail = travelBiz.selectTravelDetail(travelno);
				request.setAttribute("travelDetail", travelDetail);
				//- TODO 리뷰리스트 구현
				
				MemberDto loginUser = (MemberDto) request.getSession().getAttribute("dto");
				
				//- 로그인상태
				if(loginUser != null) {
					//좋아요 확인 
					int like = travelBiz.selectLikeYn(travelno,loginUser.getUserno());
					// 좋아요 안누른상태
					if(like == 0) {
						request.setAttribute("likeYn", 0);
					} else {	//좋아요 누른상태
						request.setAttribute("likeYn", 1);
					}
				}
				else { // 로그인 안한상태
					request.setAttribute("likeYn", 0);
				}
				request.setAttribute("travelno", travelno);
				dispatch("travel/travelboard_detail.jsp", request, response);
			}
			
			else if(command.equals("themedetail")) {
				int travelno = Integer.parseInt(request.getParameter("travelno"));
				TravelDetailDto travelDetail = travelBiz.selectTravelDetail(travelno);
				request.setAttribute("travelDetail", travelDetail);
				
				MemberDto loginUser = (MemberDto) request.getSession().getAttribute("dto");
				
				//- 로그인상태
				if(loginUser != null) {
					//좋아요 확인 
					int like = travelBiz.selectLikeYn(travelno,loginUser.getUserno());
					// 좋아요 안누른상태
					if(like == 0) {
						request.setAttribute("likeYn", 0);
					} else {	//좋아요 누른상태
						request.setAttribute("likeYn", 1);
					}
				}
				else { // 로그인 안한상태
					request.setAttribute("likeYn", 0);
				}
				request.setAttribute("travelno", travelno);
				dispatch("travel/themeboard_detail.jsp", request, response);
			}
			
			else if(command.equals("theme")) {
				List<TravelListDto> themeList = travelBiz.selectThemeList(Integer.parseInt(request.getParameter("themecode")));
				request.setAttribute("themeList", themeList);
				
				String themeName = travelBiz.selectThemeName(Integer.parseInt(request.getParameter("themecode")));
				request.setAttribute("themeName",themeName);
				
				
				dispatch("travel/themeboard.jsp", request, response);
				
			}
			
			else if(command.equals("likeYn")) {
				if(Integer.parseInt(request.getParameter("likeYn"))==0) {
					int likeYn = travelBiz.insertLike(Integer.parseInt(request.getParameter("travelno")),(Integer.parseInt(request.getParameter("userno"))));
					PrintWriter out = response.getWriter();
					out.print(likeYn);
				}else {
					int likeYn = travelBiz.deleteLike(Integer.parseInt(request.getParameter("travelno")),(Integer.parseInt(request.getParameter("userno"))));
					PrintWriter out = response.getWriter();
					out.print(likeYn);
				}
			}
			
			else if(command.equals("themeLikeYn")) {
				if(Integer.parseInt(request.getParameter("likeYn"))==0) {
					int themeLikeYn = travelBiz.insertLike(Integer.parseInt(request.getParameter("travelno")),(Integer.parseInt(request.getParameter("userno"))));
					PrintWriter out = response.getWriter();
					out.print(themeLikeYn);
				}else {
					int themeLikeYn = travelBiz.deleteLike(Integer.parseInt(request.getParameter("travelno")),(Integer.parseInt(request.getParameter("userno"))));
					PrintWriter out = response.getWriter();
					out.print(themeLikeYn);
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
