<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.dto.TravelDto"%>
<%@ page import="com.dto.LocationDto"%>
<%@ page import="com.dto.ThemeDto"%>
<%@ page import="com.dao.ReviewDao"%>
<%@ page import="com.dto.ReviewDto"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="java.util.Enumeration"%>

<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<style>
body h1 {
	text-align: center;
}

select {
	position: center;
}

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
int travelno = 0;
if (request.getParameter("travelno") != null) {
	travelno = Integer.parseInt(request.getParameter("travelno"));
}
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	window.onload = function() {
		$("select[name=travelno] option[value="+ <%=travelno%> +"]").attr("selected", "selected");
	}
</script>

</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./reviewtitle.jsp"%>
		<div class="notice-info">
			<div>
				<form action="File" encType="multipart/form-data" method="POST">
					<input type="hidden" name="postno" value=""> <input
						type="hidden" name="command" value="reviewwrite"> <input
						type="hidden" name="userno" value="<%=userInfo.getUserno()%>">
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
							<td><%=userInfo.getUsername()%></td>
						</tr>
						<tr>
							<th>여행지</th>
							<td><select name="travelno">
									<%
									//ReviewDao dao = new ReviewDao();
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
									<b>파일 첨부</b>
								</h3></th>
							<td><input type="file" name="file[0]" multiple></td>
						</tr>

						<tr>
							<td colspan="2" align="right">
								<ul>
									<li><input type="submit" value="등록"></li>
									<li><input type="button" value="목록"
										onclick="location.href='${pageContext.request.contextPath }/ReviewController?command=list'"></li>
								</ul>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
