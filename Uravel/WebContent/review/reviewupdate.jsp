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
		<div class="reviewupdate">
			<h1>후기 상세조회</h1>
			<form action="" method="" >
				<input type="hidden" name="command" value="postReview">
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
						<td><textarea rows="10" cols="60">내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........</textarea></td>
					</tr>
					<tr>
						<td><img width="300px" src="" alt="image"></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="button" value="수정"
							onclick=""> <input type="button" value="취소" onclick="">
							<input type="button" value="목록" onclick=""></td>
					</tr>
				</table>
				</form>
				</div>
	</main>
	
	<%@ include file="../common/footer.jsp"%>
</body>
</html>

