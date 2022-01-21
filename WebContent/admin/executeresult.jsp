<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String msg = (String) request.getAttribute("msg");
String executeType = (String) request.getAttribute("executeType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
		alert('<%=msg%>');
		<% if(executeType.equals("travel")) { %>
		location.href="Admin?command=travellist";
		<%} else {%>
		location.href="Admin?command=userlistAll";
		<%}%>
	}	
</script>
</head>
<body>
</body>
</html>