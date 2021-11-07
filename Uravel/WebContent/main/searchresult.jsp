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
<script src="${pageContext.request.contextPath }/js/main.js"></script>
<script>
$(function(){
	var keyword = '<%=request.getParameter("keyword")%>';
	search(keyword);
});
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!--검색 결과 표시-->
		<div id="search-result">
			<div>
				<h1>
					'<%=request.getParameter("keyword")%>' 키워드에 대한 검색 결과입니다.
				</h1>
			</div>
			<!--통합 검색창-->
			<div id="search-box">
				<form action="Main" method="post" onsubmit="return checkEmpty();">
					<input type="hidden" name="command" value="searchMain"> <input
						type="text" name="keyword"> <input type="submit"
						value="검색">
				</form>
			</div>
			<br>
			<h2>사이트 내 검색</h2>
			<div class="result-list">
				<h3>여행지 게시글 검색 결과</h3>
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
			<div class="result-list">
				<h3>역사문화 게시글 검색 결과</h3>
				<c:choose>
					<c:when test="${empty res_h }">
						<div class="prefered-list-not-found">
							<img alt="마스코트 이미지"
								src="https://drive.google.com/uc?export=view&id=1DbmvxdfNU4x0xbOuHwBwwGNCrtAf2bCC">
							<br> <br> <span>검색된 데이터가 없습니다.</span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${res_h }">
							<article onclick="clickHistory(${dto.historyno})">
								<section>
									<img src="${dto.url_pic1}" alt="${dto.travelname }">
								</section>
								<section>
									<span class="result-list-title">${dto.travelname }</span><span
										class="result-list-content">${dto.description }</span>
								</section>
							</article>
						</c:forEach>

					</c:otherwise>
				</c:choose>
			</div>
			<div class="result-list" id="naver_review">
				<h2>외부 사이트 리뷰</h2>
				<h4>* 네이버 블로그를 기준으로 검색된 결과입니다.</h4>
				<c:forEach var="dto" items="${naverReview }">
					<article onclick="clickBlogData(${dto.url})">
						<section>
							<img src="${dto.thumbnail}" alt="${dto.title }">
						</section>
						<section>
							<span class="result-list-title">${dto.title }</span><span
								class="result-list-content">${dto.contents }</span>
						</section>
					</article>
				</c:forEach>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>