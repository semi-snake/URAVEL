<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.dto.MemberDto"%>

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
	var executeType = "<%=executeType%>";

	window.onload = function() {
		alert(msg);
		if (executeType == 'failure') {
			history.back();
		} else {
			location.href = "${pageContext.request.contextPath}/ReviewController?command=list";
		}
	}
</script>



</head>
<body>
</body>
</html>