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
<script type="text/javascript" >
/*	번역  */
function language(clsSelect){
	
	var url = "FAQ?command=faqlist&language=";
	for(var i=0; i<clsSelect.options.length;i++){
		if(clsSelect.options[i].selected){
			url += clsSelect.options[i].value;
		}
	}
	
	document.location=url;
}
</script>
<script type="text/javascript" defer src="${pageContext.request.contextPath}/js/faq.js"></script>
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
<%				if(dto != null && dto.getRole().equals("ADMIN")){ 
%>
						<input type="button" value="글쓰기" onclick="location.href='FAQ?command=faqinsertform'">
<%
				}
%>
					</form>					
				</div>
				
				<!-- 번역 언어 선택 -->
		        <select class="choose-lang" name="language" onchange="language(this);">
		            <option value="ko">한국어</option>
		            <option value="en">English</option>
		            <option value="ja">日本語</option>
		            <option value="zh-CN">中文
		        </select>
		        
				<!-- FAQ : LIST -->				
				<section class="faqpost-list">
					<c:choose>
					    <c:when test="${empty list }">
								<hr class="hr-line">
					      <div class="faqs">
					        <div class="faq-message">------글이 존재하지 않습니다------</div>
					      </div>
								<hr class="hr-line">
					    </c:when>
					    <c:otherwise>
		              		<c:forEach var="dto" items="${list}">
								<!-- 질문 부분 -->
								<div class="faq-content-question">
									<p>${dto.faqno}.&nbsp;&nbsp;&nbsp;<span>${dto.title}</span></p>
								</div>	
								
								<!-- 답변 부분 -->
								<div class="faq-content-answer">
									<p>${dto.content}</p>
<%							if(dto != null && dto.getRole().equals("ADMIN")){ 
%>
									<div class="faq-content-buttons">
										<input type="button" value="수정" onclick="location.href='FAQ?command=faqupdateform&faqno=${dto.faqno}'">
										<input type="button" value="삭제" onclick="location.href='FAQ?command=faqdelete&faqno=${dto.faqno}'">
									</div>
<%
							}
%>
								</div>
								<hr class="hr-line">
							</c:forEach>
				      	</c:otherwise>
			   	 	</c:choose>
				</section>

			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>