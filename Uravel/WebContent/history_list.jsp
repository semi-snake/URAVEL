<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역사/문화</title>
<link rel="stylesheet" href="./css/historyStyle.css">
</head>

<body>
<%@ include file = "./header.jsp" %>
	<main>
		<!-- 사진에 색깔 씌우기 -->
	    <div class="bg-white"></div>
	    <!-- 상단 제목 및 사진 부분 -->
	    <div class="history-title">
	    	<!-- 번역 언어 선택 -->
	        <select class="choose-lang" onchange="location.href='historyController?command=language">
	            <option value="ko">한국어</option>
	            <option value="en">English</option>
	            <option value="ja">日本語</option>
	            <option value="zh-CN">中文</option>
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
                <input type="button" value="글쓰기" onclick="location.href='historyController?command=write'">
            </form>
        </div>
    
    	<!-- 목록 -->
    	<div id="history-list">
	        <ul class="image-list">
	            <li>
	                <a href="historyController?command=desc">
	                    <img src="http://www.heritage.go.kr/unisearch/images/national_treasure/2021062917265903.jpg" alt="">
	                    <span>경복궁</span>
	                </a>
	            </li>
	            <li>
	                <a href="historyController?command=desc">
	                    <img src="http://www.heritage.go.kr/unisearch/images/national_treasure/1611760.jpg" alt="">
	                    <span>창경궁</span>
	                </a>
	            </li>
	            <li>
	                <a href="historyController?command=desc">
	                    <img src="http://www.heritage.go.kr/unisearch/images/history_site/2021070809303201.jpg" alt="">
	                    <span>덕수궁</span>
	                </a>
	            </li>
	            <li>
	                <a href="historyController?command=desc">
	                    <img src="http://www.heritage.go.kr/unisearch/images/history_site/2021071211001301.jpg" alt="">
	                    <span>선정릉(선릉과 정릉)</span>
	                </a>
	            </li>
	            <li>
	                <a href="historyController?command=desc">
	                    <img src="http://www.heritage.go.kr/unisearch/images/history_site/1624838.jpg" alt="">
	                    <span>백제고분군</span>
	                </a>
	            </li>
	            <li>
	                <a href="historyController?command=desc">
	                    <img src="https://cdn.ilyoseoul.co.kr/news/photo/202108/456307_375351_4051.jpg" alt="">
	                    <span>길상사</span>
	                </a>
	            </li>
	            <li>
	                <a href="historyController?command=desc">
	                    <img src="http://www.heritage.go.kr/unisearch/images/national_treasure/2021063016361203.jpg" alt="">
	                    <span>종묘</span>
	                </a>
	            </li>
	            <li>
	                <a href="historyController?command=desc">
	                    <img src="http://www.heritage.go.kr/unisearch/images/national_treasure/2021092813404100.jpg" alt="">
	                    <span>국립중앙박물관</span>
	                </a>
	            </li>
	        </ul>
	        <div class="page-list">
	            <a href="#">●</a>
	            <a href="#">●</a>
	            <a href="#">●</a>
	            <a href="#">●</a>
	        </div>
    	</div>
    
    
	</main>

<%@ include file = "./footer.jsp" %>
</body>
</html>