<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.dto.TravelDto"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css">

<%
List<TravelDto> travel_list = (List<TravelDto>) request.getAttribute("travel_list");
%>


</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<div class="review">
			<h1>후기 작성</h1>
			<input type="hidden" name="command" value="reviewwrite">
		</div>
		<div>
			<form action="ReviewController" method="post">
				<!-- value 속성에 들어가는 dto : session에 로그인 중인 계정 (로그인 하지 않으면 오류남) -->
				<input type="hidden" name="userno" value="<%=dto.getUserno()%>">
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
						<td><%=dto.getUsername()%></td>
					</tr>
					<tr>
						<th>여행지</th>
						<td><select name="travelno">
								<%
								for (int i = 0; i < travel_list.size(); i++) {
								%>
								<option value="<%=travel_list.get(i).getTravelno()%>"><%=travel_list.get(i).getTravelname()%></option>
								<%
								}
								%>
						</select></td>
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
								<li><input type="button" value="목록"
									onclick="location.href='reviewlist.jsp'"></li>
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
