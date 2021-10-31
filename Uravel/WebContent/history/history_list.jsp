<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.util.List" %>
<%@ page import="com.dto.HistoryDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% List<HistoryDto> list = (List<HistoryDto>)request.getAttribute("list"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역사/문화</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/historyStyle.css">
<script type="text/javascript">
function language(clsSelect){
	
	var url = "history_Controller?command=list&language=";
	for(var i=0; i<clsSelect.options.length;i++){
		if(clsSelect.options[i].selected){
			url += clsSelect.options[i].value;
		}
	}
	
	document.location=url;
}
</script>
</head>

<body>
<%@ include file = "../common/header.jsp" %>
	<main>
		<!-- 사진에 색깔 씌우기 -->
	    <div class="bg-white"></div>
	    <!-- 상단 제목 및 사진 부분 -->
	    <div class="history-title">
	    	<!-- 번역 언어 선택 -->
	        <select class="choose-lang" name="language" onchange="language(this);">
	            <option value="ko">한국어</option>
	            <option value="en">English</option>
	            <option value="ja">日本語</option>
	            <option value="zh-CN">中文
	        </select>
	        <h1 class="history-title-text01">역사 그리고 문화</h1>
	        <p class="history-title-text02">서울에서 만날 수 있는 우리나라의 역사와 문화</p>
	    </div>
	    
	    <!-- 검색창 -->
        <div id="search-box-history">
            <form action="controller.do" method="post">
                <input type="hidden" name="command" value="history-search">
                <input type="text" name="keyword">
                <input type="submit" value="검색">
                <input type="button" value="글쓰기" onclick="location.href='history_Controller?command=writeform'">
            </form>
        </div>
    
    	<!-- 목록 -->
    	<div id="history-list">
	        <ul class="image-list">
	        <c:choose>
	            <c:when test="${empty list}">
	                <li>글이 존재하지 않습니다.</li>
	            </c:when>
	            <c:otherwise>
		        	<c:forEach var="dto" items="${list}">
		        	<c:set var="historyno" value="${dto.historyno}" />
		            <li>
		                <a href="history_Controller?command=desc&historyno=${historyno}">
		                   <img src="${dto.url_pic1}">
		                   <span>${dto.travelname }</span>
		                </a>
		            </li>
		            </c:forEach>
		        </c:otherwise>
        	</c:choose>
	        </ul>
    	</div>
	</main>

<%@ include file = "../common/footer.jsp" %>
</body>
</html>