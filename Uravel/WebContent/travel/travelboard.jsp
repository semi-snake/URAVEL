<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강서구</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
footer {
	position: sticky;
	bottom: 0;
	width: 100%;
	height: 100px;
	background-color: white;
}

footer h5 {
	text-align: center;
}

header {
	position: sticky;
	top: 0;
	margin: 0;
	padding: 0;
	overflow: hidden;
	width: 100%;
	height: auto;
	font-size: large;
	background: white;
	z-index: 1;
	text-align: center;
}

.logo, .menu, .login, li {
	display: inline-block;
}

header li {
	margin-inline: 30px;
}

.logo {
	float: left;
	margin: 0;
	font-weight: bold;
	margin-inline-start: 60px;
}

.menu {
	float: none;
	font-weight: bold;
}

.login {
	float: right;
	font-weight: bold;
}

header a {
	text-decoration: none;
	color: black;
	vertical-align: middle;
}

header a:hover {
	font-weight: bold;
	background: linear-gradient(to top, skyblue 10%, transparent 10%);
}

.sub-menu {
	display: none;
	margin: 0;
	padding: 0;
	background-color: white;
	text-align: center;
	font-weight: normal;
}

.menu li:hover .sub-menu {
	display: table;
}

.sub-menu li {
	display: block;
	margin: 0;
}

.sub-menu li:hover {
	font-weight: bold;
}

@media ( max-width :768px) {
	header {
		position: relative;
		display: inline-block;
	}
}

.page_list {
	position: sticky;
	margin-left: 42%;
	padding: 0;
	overflow: hidden;
	display: inline-block;
}

.page_list a {
	float: left;
	display: block;
	color: gray;
	text-align: center;
	padding: 16px;
	text-decoration: none;
	transition: 0.5s;
}

.page_list a:hover {
	transform: scale(1.5);
	color: gray;
	transition: 0.5s;
}

.image-list img {
	width: 240px;
	height: 160px;
	margin: 0;
}

.thumnail {
	width: 15%;
	text-align: center;
}

.number {
	width: 9%;
	text-align: center;
}

.tag {
	width: 9%;
	text-align: center;
}

.title {
	width: 49%;
	text-align: center;
}

.date {
	width: 14%;
	text-align: center;
}

.recommend {
	width: 9%;
	text-align: center;
}

.board_list {
	padding: 50px 250px;
}

.post_area {
	float: right;
	margin-right: 20%;
}

.search_box {
	float: left;
	margin-left: 45%;
	text-align: center;
}
</style>
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<h1 style="text-align: center; margin-top: 100px;">강서구</h1>
		<form name="board_list">
			<div class="board_list">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; margin-left: 10%;">

					<colgroup>
						<col class="thumnail">
						<col class="number">
						<col class="tag">
						<col class="title">
						<col class="date">
						<col class="recommend">
					</colgroup>
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">이미지</th>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">태그</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							<th style="background-color: #eeeeee; text-align: center;">좋아요</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="thumnail1"><img src="" alt="테스트"></td>
							<td class="number1">0001</td>
							<td class="tag1">호캉스</td>
							<td class="title1"><a href="#">테스트용</a></td>
							<td class="date1">21-10-15</td>
							<td class="recommend1">34</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="post_area">
				<input type="button" value="글쓰기" onclick="">
			</div>
		</form>
		<div class="search_box">
			<form action="Controller" method="post">
				<input type="hidden" name="command" value="searchMain"> <input
					type="text" name="keyword"> <input type="submit" value="검색">
		</div>
		<div class="page_list">
			<a href="#">prev</a> <a href="#">●</a> <a href="#">●</a> <a href="#">●</a>
			<a href="#">●</a> <a href="#">next</a>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>