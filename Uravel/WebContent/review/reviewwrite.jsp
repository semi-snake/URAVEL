<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/style.css">


</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<div class="review">
			<h1>후기 작성</h1>
			<form action="" method="">
				<input type="hidden" name="command" value="postReview">
				<table>
					<colgroup>
						<col width="30%">
						<col width="600px">

					</colgroup>
					<tr>
						<th><h3>
								<b>제목</b>
							</h3></th>
						<td><input type="text" name="title" placeholder="제목을 입력해주세요"></td>
					</tr>
					<tr>
						<th><h3>
								<b>내용</b>
							</h3></th>
						<td><textarea rows="10" cols="60"></textarea></td>
					</tr>
					<tr>
						<th><h3>
								<b>파일추가</b>
							</h3></th>
						<td><input type="file"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<ul>
								<li><input type="submit" value="등록" onclick=""></li>
								<li><input type="button" value="목록" onclick=""></li>
							</ul>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
