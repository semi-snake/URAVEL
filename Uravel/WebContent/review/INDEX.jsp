<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");%>
<%@ page import="com.dto.MemberDto" %>


<%
response.sendRedirect(request.getContextPath() + "/review/ReviewController?command=list");
%>
<%
String msg = (String)request.getAttribute("msg");
String executeType = (String)request.getAttribute("executeType");
MemberDto loginUser = (MemberDto)request.getSession().getAttribute("dto");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var msg = "<%=msg%>";
	window.onload = function(){
		alert("후기페이지입니다");
<%if (executeType.equals("")){%>
	location.href = "ReviewController?command=list";
<%} else if(executeType.equals("success") || executeType.equals("failure")) {%>
	location.href = "ReviewController?command=list";
<%}%>
	
	}		
	


</script>



</head>
<body>
</body>
</html>