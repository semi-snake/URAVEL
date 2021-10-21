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

<%
List<TravelDto> res = (List<TravelDto>) request.getAttribute("res");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/search.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function clickArticle(travelno){
		window.location.href="Controller?command=traveldetail&travelno=" + travelno;
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
						<span>검색된 데이터가 없습니다.</span>
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
				<article>
					<section>
						<a href="#"> <img
							src="https://live.staticflickr.com/5598/15354504160_f0997ae50f_b.jpg"
							alt="리뷰1"> <span class="review-list-title">1번 리뷰</span> <span
							class="review-list-content">1번 리뷰입니다.</span>
						</a>
					</section>
					<section>
						<a href="#"> <img
							src="https://live.staticflickr.com/5598/15354504160_f0997ae50f_b.jpg"
							alt="리뷰1"> <span>1번 리뷰</span> <span>1번 리뷰입니다.</span>
						</a>
					</section>
					<section>
						<a href="#"> <img
							src="https://live.staticflickr.com/5598/15354504160_f0997ae50f_b.jpg"
							alt="리뷰1"> <span>1번 리뷰</span> <span>1번 리뷰입니다.</span>
						</a>
					</section>
				</article>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>