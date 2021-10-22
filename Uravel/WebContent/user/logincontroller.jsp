<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.util.List" %>
<%@ page import="com.dao.MemberDao" %>
<%@ page import="com.dto.MemberDto" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String command = request.getParameter("command");
	System.out.println("[command: " + command + "]");
	
	MemberDao dao = new MemberDao();
	
	if(command.equals("login")){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDto dto = dao.login(id,pw);
		
		if(dto.getUserid() != null){
			
			session.setAttribute("dto", dto);
			session.setMaxInactiveInterval(60*60);
			
			response.sendRedirect("main_index.jsp");
			
			
		}else{
%>
		<script type="text/javascript">
			alert("login 실패");
			location.href="index.jsp";
		</script>
<%			
		}
	
	}


%>






</body>
</html>