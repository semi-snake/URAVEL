package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ReviewDao;
import com.dto.ReviewDto;

public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String command = request.getParameter("command");
	System.out.println("[command:" + command+"]");
	
	ReviewDao dao = new ReviewDao();
	
	 if (command.equals("searchReview")) { 
		System.out.println("keyword : " + request.getParameter("keyword"));
		
        String title = request.getParameter("title");
        //String content = request.getParameter("content");
		List<ReviewDto> list = dao.searchReview(request.getParameter("keyword"));
		
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("review_searchresult.jsp");
		dis.forward(request, response);
	
    }else if(command.equals("list")) {
		List<ReviewDto> list = dao.selectAll();
		
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("reviewlist.jsp");
		disp.forward(request, response);
	
	}else if(command.equals("detail")) {
		int postno = Integer.parseInt(request.getParameter("postno"));
		
		ReviewDto dto = dao.selectOne(postno);
		
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher("reviewdetail.jsp");
		dis.forward(request, response);
	
	}else if(command.equals("writeform")) {
		response.sendRedirect("review/reviewwrite.jsp");
		
	}else if(command.equals("reviewwrite")) {
		
		String title = request.getParameter("title");
	    int userno = Integer.parseInt(request.getParameter("userno"));
		String content = request.getParameter("content");
		
		ReviewDto dto = new ReviewDto();
		
		dto.setTitle(title);
		dto.setUserno(userno);
		dto.setContent(content);
		
		int res = dao.insert(dto);
		if(res>0) {
			dispatch("ReviewController?command=list", request, response);
		}else {
			dispatch("ReviewController?command=writeform", request, response);
		}
	
	}else if(command.equals("updateform")){
		int postno = Integer.parseInt(request.getParameter("postno"));
	
		ReviewDto dto = dao.selectOne(postno);
		request.setAttribute("dto", dto);
		dispatch("reviewupdate.jsp", request, response);
	
	}else if(command.equals("reviewupdate")) {
		int postno = Integer.parseInt(request.getParameter("postno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		ReviewDto dto = new ReviewDto();
		
		dto.setTitle(title);
		dto.setContent(content);
		
		int res = dao.update(dto);
		
		if(res>0) {
			dispatch("ReviewController?command=list", request, response);
			
		}else {
			dispatch("ReviewController?command=detail&postno="+postno, request, response );
		}
		
	}else if(command.equals("delete")) {
		int postno = Integer.parseInt(request.getParameter("postno"));
		int res = dao.delete(postno);
		
		if(res>0) {
			dispatch("reviewcontroller?command=list",request, response);
		}else {
			dispatch("reviewcontroller?command=detail&postno="+postno, request, response);
		}
	}
		
	}

	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
