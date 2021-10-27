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
		<h1>관리자 ADMIN</h1>
		<ul class="admin-menu">
			<li><h3>여행지 정보 관리</h3>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/Controller?command=travellist">정보
							조회</a></li>
				</ul></li>
			<li><h3>사용자 정보 관리</h3>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/Controller?command=userlistAll">전체
							조회</a></li>
					<li><a
						href="${pageContext.request.contextPath}/Controller?command=userListEnabled">활성된
							회원만 조회</a></li>
				</ul></li>
		</ul>
	</div>
</body>
</html>