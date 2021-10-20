<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역사/문화</title>
<link rel="stylesheet" href="./historyStyle.css">
<link rel="stylesheet" href="./header.css">

</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!-- 사진에 색깔 씌우기 -->
		<div class="bg-white"></div>
		<!-- 상단 제목 및 사진 부분 -->
		<div class="history-title">
			<!-- 번역 언어 선택 -->
			<select class="choose-lang"
				onchange="location.href='historyController?command=language">
				<option value="ko">한국어</option>
				<option value="en">English</option>
				<option value="ja">日本語</option>
				<option value="zh-CN">中文</option>
			</select>
			<h1 class="history-title-text01">역사 그리고 문화</h1>
			<p class="history-title-text02">서울에서 만날 수 있는 우리나라의 역사와 문화</p>
		</div>

		<article class="history-desc">
			<h2 class="history-desc-title">경복궁</h2>
			<hr class="history-desc-under01">

			<div class="history-desc-content">
				<div class="history-desc-content-img">
					<img
						src="http://www.heritage.go.kr/unisearch/images/national_treasure/2021062917265903.jpg">
					<br> <img
						src="http://www.heritage.go.kr/unisearch/images/national_treasure/1611714.jpg">
				</div>

				<p class="history-desc-content-text">
					경복궁은 조선 왕조 제일의 법궁이다. 북으로 북악산을 기대어 자리 잡았고 정문인 광화문 앞으로는 넓은 육조거리(지금의
					세종로)가 펼쳐져, 왕도인 한양(서울) 도시 계획의 중심이기도 하다. 1395년 태조 이성계가 창건하였고, 1592년
					임진 왜란으로 불타 없어졌다가, 고종 때인 1867년 중건 되었다. 흥선대원군이 주도한 중건 경복궁은 500여 동의
					건물들이 미로같이 빼곡히 들어선 웅장한 모습 이었다. <br>
					<br> 궁궐 안에는 왕과 관리들의 정무 시설, 왕족들의 생활 공간, 휴식을 위한 후원 공간이 조성되었다. 또한
					왕비의 중궁, 세자의 동궁, 고종이 만든 건청궁 등 궁궐안에 다시 여러 작은 궁들이 복잡하게 모인 곳이기도 하다. 그러나
					일제 강점기에 거의 대부분의 건물들을 철거하여 근정전 등 극히 일부 중심 건물만 남았고, 조선 총독부 청사를 지어 궁궐
					자체를 가려버렸다. 다행히 1990년부터 본격적인 복원 사업이 추진되어 총독부 건물을 철거하고 흥례문 일원을
					복원하였으며, 왕과 왕비의 침전, 동궁, 건청궁, 태원전 일원의 모습을 되찾고 있다. <br>
					<br> 광화문 - 흥례문 - 근정문 - 근정전 - 사정전 - 강녕전 - 교태전을 잇는 중심 부분은 궁궐의 핵심
					공간이며, 기하학적 질서에 따라 대칭적으로 건축 되었다. 그러나 중심부를 제외한 건축물들은 비대칭적으로 배치되어 변화와
					통일의 아름다움을 함께 갖추었다. 수도 서울의 중심이고 조선의 으뜸 궁궐인 경복궁에서 격조 높고 품위 있는 왕실 문화의
					진수를 느껴보자. <br>
					<br> 경복궁의 명칭 : 경복궁은 조선 왕조가 세워지고 3년 지난 후 완공되었다. 완공된 지 며칠 후에
					개국공신 정도전은 태조의명에 따라 경복궁이라는 궁궐 이름을 비롯해 강녕전, 교태전, 연생전, 경성전, 사정전, 근정전 등
					주요 전각의 이름을 지었다. 경복궁이라는 이름에는 ‘새 왕조가 큰 복을 누려 번영할 것’이라는 의미가 담겨 있다.
				</p>


			</div>

			<hr class="history-desc-under02">
			<div class="history-desc-buttons">
				<input type="button" value="수정"
					onclick="location.href='historyController?command=update'">
				<input type="button" value="삭제" onclick=""> <input
					type="button" value="글쓰기"
					onclick="location.href='historyController?command=write'">
				<input type="button" value="목록"
					onclick="location.href='historyController?command=list'">
			</div>
		</article>


	</main>
	<%@ include file="./footer.jsp"%>
</body>
</html>