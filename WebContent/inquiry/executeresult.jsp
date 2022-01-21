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
	var msg = "<%=msg%>";
	window.onload = function() {
		alert(msg);
<%if (executeType.equals("logoutUser")) {%>
	location.href = "Main?command=main";
<%} else if (executeType.equals("success") || executeType.equals("failure")) {%>
	location.href = "Inquiry?command=inqlist";
<%}%>
	}
</script>
</head>
<body>
</body>
</html>