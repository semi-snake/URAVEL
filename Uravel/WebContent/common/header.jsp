<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<%@ page import="com.dto.MemberDto"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

* {
	font-family: "Noto Sans KR", sans-serif !important;
}
</style>
</head>
<%
MemberDto dto = (MemberDto) request.getSession().getAttribute("userInfo");

String currentUrl = request.getRequestURI();
if(currentUrl.indexOf("/main.jsp") < 0){
	if(dto == null){
		pageContext.forward("../user/index.jsp");
	}
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
						<li><a
							href="${pageContext.request.contextPath}/travel/travelarea.jsp">지역별</a></li>
						<li><a
							href="${pageContext.request.contextPath}/travel/traveltheme.jsp">테마별</a></li>
					</ul></li>
				<li><a
					href="${pageContext.request.contextPath}/history/history_Controller?command=list">역사
						문화</a></li>
				<li><a
					href="${pageContext.request.contextPath }/ReviewController?command=list">후기</a></li>
				<li><a
					href="${pageContext.request.contextPath }/Notice?command=noticelist">공지사항</a></li>
				<li><a href="#">고객센터</a> <!-- 하위 메뉴 -->
					<ul class="sub-menu">
						<li><a
							href="${pageContext.request.contextPath }/FAQ?command=faqlist">FAQ</a></li>
						<li><a
							href="${pageContext.request.contextPath }/Inquiry?command=inqlist">1:1문의</a></li>
					</ul></li>
			</ul>
			<!-- 네비게이션 : 로그인 -->
			<ul class="login">

				<%
				if (dto != null) {
				%>
				<li><a id="username"><%=dto.getUsername()%>님! 안녕하세요!</a></li>

				<%
				if (!dto.getRole().equals("ADMIN")) {
				%>
				<li><a
					href="${pageContext.request.contextPath}/user/logincontroller.jsp?command=userinfo">마이페이지</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/logincontroller.jsp?command=logout">로그아웃</a></li>
				<%
				} else {
				%>
				<li><a
					href="${pageContext.request.contextPath}/Admin?command=travellist">관리자
						페이지</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/logincontroller.jsp?command=logout">로그아웃</a></li>
				<%
				}
				} else {
				%>
				<li><a
					href="${pageContext.request.contextPath}/user/logincontroller.jsp?command=login">로그인</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/logincontroller.jsp?command=registform">회원가입</a></li>
				<%
				}
				%>
			</ul>
		</nav>
	</header>
	<!-- 헤더 종료 -->
</body>
</html>