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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/travelboard.css"> 
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