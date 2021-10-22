package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.HistoryBizImpl;
import com.dto.HistoryDto;

//@WebServlet("/historyController")
public class history_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command : "+command+"]");
		
		HistoryBizImpl biz = new HistoryBizImpl();
		
		if(command.equals("history-search")) {
			System.out.println("keyword : "+request.getParameter("keyword"));
			dispatch("searchmain.jsp",request,response);
		}
		
		else if(command.equals("list")) {
			List<HistoryDto> list = biz.selectAll();
			
			System.out.println("list : "+request.getParameter("list"));
			request.setAttribute("list", list);
			
			dispatch("history_list.jsp",request,response);
			
		}
		else if(command.equals("desc")) {
			int historyno = Integer.parseInt(request.getParameter("historyno"));
			
			HistoryDto dto = biz.selectOne(historyno);
			
			request.setAttribute("dto", dto);
			
			System.out.println("desc : "+request.getParameter("desc"));
			dispatch("history_info.jsp",request,response);
			
		}
		
		else if(command.equals("writeform")) {
			response.sendRedirect("history_insertinfo.jsp");
		}
		else if(command.equals("write")) {
			
			String writer = request.getParameter("admin"); //로그인한 사용자 이름이 와야 함...
			String travelname = request.getParameter("travelname");
			String url_pic1 = request.getParameter("url_pic1");
			String url_pic2 = request.getParameter("url_pic2");
			String description = request.getParameter("description");
			
			HistoryDto dto = new HistoryDto(writer,travelname,url_pic1,url_pic2,description);
			
			boolean res = biz.insert(dto);
			
//			if(res) {
//				jsResponse("글 작성 성공","history_Controller?command=list",response);
//			}
			System.out.println("write : "+request.getParameter("write"));
			
			
			
			
		}
		
		else if(command.equals("update")) {
			System.out.println("update : "+request.getParameter("update"));
			dispatch("history_updateinfo.jsp",request,response);
		}
		
		else if(command.equals("language")) {
			
			
			//DB 정보 받아오기
//			switch() {
//			case 0 :
//				//한국어 
//				break;
//			case 1:
//				//영어
//				break;
//			case 2:
//				//일본어
//				break;
//			case 3:
//				//중국
//				break;
//			default:
//				//오류 출력	
//				break;
//			}
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
