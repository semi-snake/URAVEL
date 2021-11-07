<%@page import="com.dto.LocationDto"%>
<%@page import="com.dto.ThemeDto"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div></div>
	<div class="review-search-section">
		<table>
			<tr>
				<th>유형별 검색</th>
				<td>
					<form action="ReviewController" method="post">
						<input type="hidden" name="command" value="findReview"> <select
							name="themename">
							<%
							ReviewDao dao = new ReviewDao();
							List<ThemeDto> themelist = dao.selectTheme();
							for (int i = 0; i < themelist.size(); i++) {
							%>
							<option value="<%=themelist.get(i).getThemename()%>"><%=themelist.get(i).getThemename()%></option>
							<%
							}
							%>
						</select>&nbsp; <select name="localname">
							<%
							List<LocationDto> locallist = dao.selectLocation();
							for (int i = 0; i < locallist.size(); i++) {
							%>
							<option value="<%=locallist.get(i).getLocalname()%>"><%=locallist.get(i).getLocalname()%></option>
							<%
							}
							%>
						</select>&nbsp;&nbsp;&nbsp;<input type="submit" value="찾기">
					</form>
				</td>
			</tr>
			<tr>
				<th>키워드 검색</th>
				<td id="search-box">
					<form action="ReviewController" method="post">
						<input type="hidden" name="command" value="searchReview">
						<input type="text" name="keyword" placeholder="내용을 입력해주세요">
						&nbsp;&nbsp;&nbsp;<input type="submit" value="검색">
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>