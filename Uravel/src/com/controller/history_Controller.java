package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class history_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int language = 0; // 0 한국어 1 영어 2 일본어 3 중국
		String command = request.getParameter("command");
		System.out.println("[command : "+command+"]");
		
		if(command.equals("history-search")) {
			System.out.println("keyword : "+request.getParameter("keyword"));
			dispatch("searchmain.jsp",request,response);
		}
		
		else if(command.equals("list")) {
			System.out.println("list : "+request.getParameter("list"));
			dispatch("history_list.jsp",request,response);
		}
		else if(command.equals("desc")) {
			System.out.println("desc : "+request.getParameter("desc"));
			dispatch("history_info.jsp",request,response);
			
		}
		
		else if(command.equals("write")) {
			System.out.println("write : "+request.getParameter("write"));
			dispatch("history_insertinfo.jsp",request,response);
		}
		
		else if(command.equals("update")) {
			System.out.println("update : "+request.getParameter("update"));
			dispatch("history_updateinfo.jsp",request,response);
		}
		
		else if(command.equals("language")) {
			
			
			//DB 정보 받아오기
			switch(language) {
			case 0 :
				//한국어 
				break;
			case 1:
				//영어
				break;
			case 2:
				//일본어
				break;
			case 3:
				//중국
				break;
			default:
				//오류 출력	
				break;
			}
		}
		
	
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
