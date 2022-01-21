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
		location.href = "Notice?command=noticelist";
	}
</script>
</head>
<body>
</body>
</html>