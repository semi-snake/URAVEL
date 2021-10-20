<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
		<!-- 상단부 -->
	<header>
		<!-- 로고 : 메인페이지로 이동 -->
		<h1>
			<a href="${pageContext.request.contextPath}/UC?command=main" class="logo">URAVEL</a>
		</h1>
		<!-- 네비게이션 -->
		<nav>
			<!-- 네비게이션 : 메뉴 부분 -->
			<ul class="menu">
				<li><a href="#">여행지 추천</a> <!-- 하위 메뉴 -->
					<ul class="sub-menu">
						<li><a href="#">지역별</a></li>
						<li><a href="#">테마별</a></li>
					</ul></li>
				<li><a href="#">역사 문화</a></li>
				<li><a href="#">후기</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">고객센터</a> <!-- 하위 메뉴 -->
					<ul class="sub-menu">
						<li><a href="#">FAQ</a></li>
						<li><a href="#">1:1문의</a></li>
					</ul></li>
			</ul>
			<!-- 네비게이션 : 로그인 -->
			<ul class="login">
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		</nav>
	</header>
	<!-- 헤더 종료 -->
</body>
</html>