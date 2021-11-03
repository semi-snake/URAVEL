<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.dto.FaqDto"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* $(function(){
	$('.faq-content-answer').hide();
	
	$(".faq-content-question").click(function(){
		$(".faq-content-question").css("background-color","#ffedd2");
		$(".faq-content-answer").toggle(300);
	});
});  */
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./faqtitle.jsp"%>
		<!-- FAQ 본문 -->
		<div class="faq-main">
			<div class="faq-info-list">
				
				<!-- FAQ : 검색-->
				<div class="search-box-faq" style="margin-bottom: 20px;">
					<form action="Faq" method="post">
						<input type="hidden" name="command" value="search"> 
						<input type="text" name="keyword" style="text-align:center;">
						<input type="submit" value="검색">
						<input type="button" value="글쓰기" onclick="location.href='FAQ?command=faqinsertform'">
					</form>					
				</div>
				
				<!-- FAQ : LIST -->
				<table class="faqpost-list">
					<colgroup>
						<col width="10%">
						<col width="70%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th colspan="3">FAQ</th>
						</tr>
					</thead>
					<tbody>
					
					<!-- 질문 부분 -->
					<c:choose>
				    	<c:when test="${empty list }">
				        	<tr>
				            	<td colspan="3">------글이 존재하지 않습니다------</td>
				            </tr>
				        </c:when>
				        <c:otherwise>
                			<c:forEach var="dto" items="${list}">
								<tr class="faq-content-question">
									<td style="text-align:center;"><span>${dto.faqno}</span></td>
									<td colspan="3"><span>${dto.title }</span></td>
									<!-- 답변 부분 -->
									<tr class="faq-content-answer">
										<td></td><td colspan="2"><p>${dto.content }</p></td>
										<td>
											<input type="button" value="수정" onclick="location.href='FAQ?command=faqupdateform&faqno=${dto.faqno}'">
											<input type="button" value="삭제" onclick="location.href='FAQ?command=faqdelete&faqno=${dto.faqno}'">
										</td>
									</tr>
								</tr>
								
							</c:forEach>
			            </c:otherwise>
			        </c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>