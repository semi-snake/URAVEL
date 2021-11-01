<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.dto.MemberDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
</head>
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");
				
	if(dto == null){
		pageContext.forward("index.jsp");
	}
%>
<body>
	<!-- 상단부 -->
	<header>
		<!-- 로고 : 메인페이지로 이동 -->
		<h1>
			<a href="${pageContext.request.contextPath}/Main?command=main"
				class="logo">URAVEL</a>
		</h1>
		<!-- 네비게이션 -->
		<nav>
			<!-- 네비게이션 : 메뉴 부분 -->
			<ul class="menu">
				<li><a href="#">여행지 추천</a> <!-- 하위 메뉴 -->
					<ul class="sub-menu">
						<li><a href="../travel/travelarea.jsp">지역별</a></li>
						<li><a href="../travel/traveltheme.jsp">테마별</a></li>
					</ul></li>
				<li><a href="#">역사 문화</a></li>
				<li><a href="#">후기</a></li>
				<li><a
					href="${pageContext.request.contextPath }/Notice?command=noticelist">공지사항</a></li>
				<li><a href="#">고객센터</a> <!-- 하위 메뉴 -->
					<ul class="sub-menu">
						<li><a href="#">FAQ</a></li>
						<li><a href="#">1:1문의</a></li>
					</ul></li>
				<li><a href="userinfo.jsp">마이페이지</a></li>
			</ul>
			<!-- 네비게이션 : 로그인 -->
			<ul class="login">
			
				<li><%=dto.getUsername() %>님</li>
				<li><a href="logincontroller.jsp?command=logout">로그아웃</a></li>
			</ul>
		</nav>
	</header>
	<!-- 헤더 종료 -->
	

</body>
</html>