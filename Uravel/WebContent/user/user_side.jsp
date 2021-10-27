<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 관리자 페이지에서 보이는 사이드 메뉴 -->
	<div class="admin-side">
		<h1>마이페이지</h1>
		<ul class="admin-menu">
			<li><h3><a href="logincontroller.jsp?command=userinfo">내 정보 관리</a></h3></li>
	
			<li><h3><a href="Controller?command=myfavorite">좋아하는 여행지</a></h3></li>

			<li><h3><a href="Controller?command=mypost">게시글 관리</a></h3></li>
		</ul>
	</div>
</body>
</html>