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
			<form action="ReviewController" method="post">
				<input type="hidden" name="command" value="reviewwrite">
				<select name="themelist">
				<option value="theme">테마별</option>
				<option value="1">호캉스</option>
				<option value="2">산책</option>
				<option value="3">역사/문화</option>
				<option value="4">책방</option>
				<option value="5">야경</option>
				<option value="6">카페</option>
				<option value="7">공원</option>
				<option value="8">맛집</option>
				<option value="9">등산</option>
				<option value="10">캠핑</option>
			</select>&nbsp; <select name="locallist">
				<option value="gu">구별</option>
				<option value="1">강서구</option>
				<option value="2">강남구</option>
				<option value="3">강동구</option>
				<option value="4">강북구</option>
				<option value="5">관악구</option>
				<option value="6">광진구</option>
				<option value="7">구로구</option>
				<option value="8">금천구</option>
				<option value="9">노원구</option>
				<option value="10">도봉구</option>
				<option value="11">동대문구</option>
				<option value="12">동작구</option>
				<option value="13">마포구</option>
				<option value="14">서대문구</option>
				<option value="15">서초구</option>
				<option value="16">성동구</option>
				<option value="17">성북구</option>
				<option value="18">송파구</option>
				<option value="19">양천구</option>
				<option value="20">영등포구</option>
				<option value="21">용산구</option>
				<option value="22">은평구</option>
				<option value="23">종로구</option>
				<option value="24">중구</option>
				<option value="25">중랑구</option>
			</select>&nbsp;
		</div>
		<div>
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
						<th>작성자</th>
						<td><input type="number" name="userno"></td>
					</tr>
					<tr>
						<th><h3>
								<b>내용</b>
							</h3></th>
						<td><textarea rows="10" cols="60" name="content"></textarea></td>
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
								<li><input type="submit" value="등록"></li>
								<li><input type="button" value="목록" onclick="location.href='reviewlist.jsp'"></li>
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
