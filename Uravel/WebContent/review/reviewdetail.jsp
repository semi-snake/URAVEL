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
table {
	text-align: center;
}
</style>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<div class="reviewdetail">
			<h1>후기 상세조회</h1>

			<table>
				<colgroup>
					<col width="400px">
					<col width="400px">
				</colgroup>
				<tr>
					<th><h3>${dto.title }</h3></th>
					<th>${dto.userno }</th>
				</tr>
				<tr>
					<td>${dto.postdate }</td>
				</tr>
				<tr>
					<td>${dto.content }</td>
				</tr>
				<tr>
					<td><img width="300px" src="" alt="image"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="button" value="수정"
						onclick="location.href='ReviewController?command=updateform&postno=${dto.postno}'"> 
						<input type="button" value="삭제" onclick="location.href='ReviewController?command=delete&postno=${dto.postno}'">
						<input type="button" value="목록" onclick="location.href='ReviewController?command=list'"></td>
				</tr>
			</table>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>