<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="java.util.List" %>
<%@ page import="com.dto.ReviewDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 검색어 검색결과</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/style.css">
<style>
div {
	text-align: center;
}
</style>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	
	
	
	

</script>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<div class="reviewlist">
			<h1>후기 게시판</h1><select name="themename">
				<option value="theme">테마별</option>
				<option value="1">공원</option>
				<option value="2">등산</option>
				<option value="3">맛집</option>
				<option value="4">산책</option>
				<option value="5">야경</option>
				<option value="6">역사/문화</option>
				<option value="7">책방</option>
				<option value="8">카페</option>
				<option value="9">캠핑</option>
				<option value="10">호캉스</option>
			</select>&nbsp; <select name="localname">
				<option value="gu">구별</option>
				<option value="1">강남구</option>
				<option value="2">강동구</option>
				<option value="3">강북구</option>
				<option value="4">강서구</option>
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
			</select>&nbsp;  &nbsp;&nbsp;<input type="submit" value="찾기">
		</div>
		
		
			<h3>
				'<%=request.getParameter("keyword")%>' 에 대한 후기 검색결과입니다.
			</h3>
		
	<table id="review-table">
			<colgroup>
				<col width="100">
				<col width="300">
				<col width="100">
				<col width="100">
			</colgroup>
			<thead style="background-color: grey;">
				<th>No.</th>
				<th>Title</th>
				<th>Writer</th>
				<th>Date</th>
			</thead>
			<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4">=============================작성된 글이 없습니다.==================================</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
				<tr>		
					<td>${dto.postno }</td>
					<td><a href="ReviewController?command=detail&postno=${dto.postno}">${dto.title }</a></td>
					<td>${dto.username }</td>
					<td>${dto.postdate }</td>
				</tr>
			   </c:forEach>
			</c:otherwise>
		</c:choose>
				<tr>
					<td colspan="4" align="right"><input type="button" value="등록"
						onclick="location.href='${pageContext.request.contextPath}/ReviewController?command=writeform'"></td>
				</tr>
			</tbody>
		</table>
		<ul class="pagenation">
			<li><a href="#">이전</a></li>
			<li class="page-selected"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">다음</a></li>
		</ul>
		
	</main>
	<%@ include file="../common/footer.jsp"%>



</body>
</html>