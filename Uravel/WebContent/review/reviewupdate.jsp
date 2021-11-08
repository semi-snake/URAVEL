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
<%@ page import="com.dto.TravelDto"%>
<%@ page import="com.dto.LocationDto"%>
<%@ page import="com.dto.ThemeDto"%>
<%@ page import="com.dao.ReviewDao"%>
<%@ page import="java.util.Enumeration"%>

<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정</title>
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
<%
List<TravelDto> travel_list = (List<TravelDto>) request.getAttribute("travel_list");
List<LocationDto> locallist = (List<LocationDto>) request.getAttribute("locallist");
List<ThemeDto> themelist = (List<ThemeDto>) request.getAttribute("themelist");
%>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./reviewtitle.jsp"%>
		<div class="notice-info">
			<h1>후기 수정하기</h1>
			<div>
				<form action="File" encType="multipart/form-data" method="POST">
					<input type="hidden" name="userno"
						value="<%=userInfo.getUserno()%>"> <input type="hidden"
						name="postno" value="${dto.postno }"> <input type="hidden"
						name="command" value="reviewupdate"> <input type="hidden"
						name="filename" value="${dto.filename }" /> <input type="hidden"
						name="filesize" value="${dto.filesize }" />
					<table>
						<colgroup>
							<col width="400px">
							<col width="400px">
						</colgroup>
						<tr>
							<th>제목</th>
							<td><h3>
									<textarea rows="1" cols="60" name="title">${dto.title }</textarea>
								</h3></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${dto.postdate }</td>
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
							<th>내용</th>
							<td><textarea rows="10" cols="60" name="content">${dto.content }</textarea></td>
						</tr>

						<tr>
							<th>파일 첨부</th>
							<td><input type="file" name="file[0]"></td>
						</tr>
						<%
						String filename = ((ReviewDto) request.getAttribute("dto")).getFilename();
						if (filename != null) {
						%><tr>
							<th>기존 파일</th>
							<td><img alt="${dto.filename }" width="200px" height="auto"
								src="${pageContext.request.contextPath }/img/${dto.filename}">
							</td>
						</tr>
						<%
						}
						%>
						<tr>
							<td colspan="2" align="right"><input type="submit"
								value="수정"> <input type="button" value="취소"
								onclick="location.href='${pageContext.request.contextPath }/ReviewController?command=detail&postno=${dto.postno }'">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>

</body>
</html>

