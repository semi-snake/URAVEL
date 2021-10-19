<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<th><h3>후기게시글1</h3></th>
					<th>작성자1</th>
				</tr>
				<tr>
					<td>2021-10-15</td>
				</tr>
				<tr>
					<td>내용내용내용......... 내용내용내용......... 내용내용내용.........
						내용내용내용......... 내용내용내용......... 내용내용내용......... 내용내용내용.........
						내용내용내용......... 내용내용내용......... 내용내용내용......... 내용내용내용.........
						내용내용내용......... 내용내용내용.........</td>
				</tr>
				<tr>
					<td><img width="300px" src="" alt="image"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="button" value="수정"
						onclick=""> <input type="button" value="삭제" onclick="">
						<input type="button" value="목록" onclick=""></td>
				</tr>
			</table>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>