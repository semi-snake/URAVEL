<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dto.ReviewDto"%>
<%@ page import="com.dto.LocationDto"%>
<%@ page import="com.dto.ThemeDto"%>
<%@ page import="com.dao.ReviewDao"%>
<%@ page import="com.dto.TravelDto"%>

<%@ page import="java.util.Enumeration"%>

<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세보기</title>
<script type="text/javascript">
	
</script>
<style>
table {
	text-align: center;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./reviewtitle.jsp"%>
		<div class="notice-info">
			<h1>후기 상세조회</h1>
			<div>
				<table>
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr>
						<td colspan="4"><h3>${dto.title }</h3></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${dto.username }</td>
						<th>작성일</th>
						<td>${dto.postdate }</td>
					</tr>
					<tr>
						<th>테마</th>
						<td>${dto.themename }</td>
						<th>지역구</th>
						<td>${dto.localname }</td>
					</tr>
					<tr>
						<th>여행지</th>
						<td colspan="3">${dto.travelname }</td>
					</tr>
					<tr>
						<td colspan="4"><hr></td>
					</tr>
					<tr>
						<%
						String filename = ((ReviewDto) request.getAttribute("dto")).getFilename();
						if (filename != null) {
						%>
						<td colspan="2"><img alt="<%=filename%>"
							src="${pageContext.request.contextPath }/img/<%=filename%>"
							width="500px"></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td colspan="4">${dto.content }</td>
					</tr>
					<tr>
						<td colspan="4"><hr></td>
					</tr>
					<tr>
						<td colspan="4" align="right">
							<%
							if (userInfo != null && (((ReviewDto) request.getAttribute("dto")).getUserno() == userInfo.getUserno()
									|| userInfo.getRole().equals("ADMIN"))) {
							%> <input type="button" value="수정"
							onclick="location.href='ReviewController?command=updateform&postno=${dto.postno}'">
							<input type="button" value="삭제"
							onclick="location.href='ReviewController?command=delete&postno=${dto.postno}'">
							<%
							}
							%> <input type="button" value="목록"
							onclick="location.href='ReviewController?command=list'">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>