<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역사/문화</title>
<link rel="stylesheet" href="./historyStyle.css">
<link rel="stylesheet" href="./header.css">
</head>
<body>
<%@ include file = "../common/header.jsp" %>

	<main>
		<!-- 사진에 색깔 씌우기 -->
	    <div class="bg-white"></div>
	    <!-- 상단 제목 및 사진 부분 -->
	    <div class="history-title">
	        <h1 class="history-title-text01">역사 그리고 문화</h1>
	        <p class="history-title-text02">서울에서 만날 수 있는 우리나라의 역사와 문화</p>
	    </div>
	    
	    <!-- 글 작성 FORM -->
	    <div class="history-write">
			<form action="controller" method="post" class="history-write-form">
				<input type="hidden" name="command" value="historywrite">
				<table class="history-table">
					<tr>
						<th>작성자</th>
						<td>구렁이</td>
					</tr>
					<tr>
						<th>글 제목</th>
						<td><input type="text" name="history-form-title" placeholder="제목을 입력하세요"></td>
					</tr>
					<tr>
						<th>사진 URL</th>
						<td><input type="text" name="history-form-url" placeholder="사진 URL을 입력하세요"></td>
					</tr>
					<tr>
						<th>글 내용</th>
						<td><textarea rows="10" cols="80" name="history-form-content"placeholder="내용을 입력하세요"></textarea></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<div class="history-write-buttons">
								<input type="submit" value="작성">
								<input type="button" value="취소" onclick="location.href='historyController?command=list'">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</main>

<%@ include file = "./footer.jsp" %>
</body>
</html>