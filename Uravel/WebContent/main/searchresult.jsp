<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<%@ page import="com.dto.TravelDto"%>
<%@ page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet" href="css/error.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function clickArticle(travelno){
		window.location.href="Main?command=traveldetail&travelno=" + travelno;
	}
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!--검색 결과 표시-->
		<div id="search-result">
			<h1>
				'<%=request.getParameter("keyword")%>' 키워드에 대한 검색 결과입니다.
			</h1>
			<br>
			<h2>사이트 내 검색</h2>
			<div class="result-list">
				<c:choose>
					<c:when test="${empty res }">
						<div class="prefered-list-not-found">
							<img alt="마스코트 이미지"
								src="https://drive.google.com/uc?export=view&id=1DbmvxdfNU4x0xbOuHwBwwGNCrtAf2bCC">
							<br> <br> <span>검색된 데이터가 없습니다.</span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${res }">
							<article onclick="clickArticle(${dto.travelno})">
								<section>
									<img src="${dto.pic_arr[0]}" alt="${dto.travelname }">
								</section>
								<section>
									<span class="result-list-title">${dto.travelname }</span> <span
										class="result-list-content">${dto.address }</span> <span
										class="result-list-content">${dto.description }</span>
								</section>
							</article>
						</c:forEach>

					</c:otherwise>
				</c:choose>
			</div>
			<h2>외부 사이트 리뷰</h2>
			<br>
			<div class="review-list">
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>