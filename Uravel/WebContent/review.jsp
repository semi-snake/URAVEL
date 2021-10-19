<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/review.css">
	<link rel="stylesheet" href="./css/style.css">
	<style>
	div{
		text-align: center;
	}
	</style>
</head>
<body>
  	<!-- 상단부 -->
	<header>
		<!-- 로고 : 메인페이지로 이동 -->
		<h1>
			<a href="./main.jsp" class="logo">URAVEL</a>
		</h1>
		<!-- 네비게이션 -->
		<nav>
			<!-- 네비게이션 : 메뉴 부분 -->
			<ul class="menu">
				<li><a href="main.jsp">여행지 추천</a> <!-- 하위 메뉴 -->
					<ul class="sub-menu">
						<li><a href="#">지역별</a></li>
						<li><a href="#">테마별</a></li>
					</ul></li>
				<li><a href="#">역사 문화</a></li>
				<li><a href="#">후기</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">고객센터</a> <!-- 하위 메뉴 -->
					<ul class="sub-menu">
						<li><a href="#">FAQ</a></li>
						<li><a href="#">1:1문의</a></li>
					</ul></li>
			</ul>
			<!-- 네비게이션 : 로그인 -->
			<ul class="login">
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		</nav>
	</header>
	<!-- 헤더 종료 --> 
	<div class="reviewlist">
		<h1>후기 게시판</h1>
		<select name="themelist">
			<option value="theme">테마별</option>
			<option value="1">호캉스</option>
			<option value="2">산책</option>
			<option value="3">역사/문화</option>
			<option value="4">책방</option>
			<option value="5">야경</option>
			<option value="6">카페</option>
			<option value="7">공원</option>
			<option value="8">맛집</option>
			<option value="9">등산</option>
			<option value="10">캠핑</option>
		</select>&nbsp;
		<select name="locallist">
			<option value="gu">구별</option>
			<option value="1">강서구</option>
			<option value="2">강남구</option>
			<option value="3">강동구</option>
			<option value="4">강북구</option>
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
		</select>&nbsp;
		<select name="orderlist">
			<option value="1">최신순</option>
			<option value="2">좋아요순</option>
			<option value="3"></option>
			<option value="4"></option>
			<option value="5"></option>
		</select>
		</div>
		<br><br>
		<div id="search-box">
            <form action="Controller" method="post">
                <input type="hidden" name="command" value="searchMain">
                <input type="text" name="keyword" placeholder="내용을 입력해주세요">
                <input type="submit" value="검색">
			</div>
            </form>
		
		<br>
		
	
		<table>
			<colgroup>
				<col width="100"><col width="300"><col width="300"><col width="100">				
			</colgroup>
				<thead style="background-color: grey;">
				<th>No.</th>
				<th>Title</th>
				<th>Writer</th>
				<th>Date</th>
				</thead>
			<tbody>
				<tr>
					
				<td>1</td>
				<td><a href="boarddetatil.jsp/">후기 게시글 1</a></td>
				<td>작성자1</td>
				<td>2021-10-15</td>
			</tr>
			<tr>
				<td>2</td>
				<td><a href="boarddetail.jsp">후기 게시글 2</a></td>
				<td>작성자2</td>
				<td>2021-10-15</td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="등록" onclick="location.href='answer.do?command=boardwrite'">
					
				 </td>   
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
		</div>
		<footer>
			<h5>copyright &copy;구렁이담넘어가조. All rights reserved.</h5>
		</footer>
</body>
</html>