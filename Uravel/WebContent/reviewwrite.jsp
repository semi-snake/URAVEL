<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
footer {
			position: sticky;
			bottom: 0;
			width: 100%;
			height: 100px;
			background-color: white;
		}
		footer h5 {
			text-align: center;
		}
		</style>
    <link rel="stylesheet" href="./css/review.css">
	<link rel="stylesheet" href="./css/style.css">
	
	
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
    <br><br><br>
	<!-- 헤더 종료 -->
	<div class="review">
	<h1>후기 작성</h1>
	<form action="" method="">
		<input type="hidden" name="command" value="postReview">
		<table>
			<colgroup>
				<col width="30%">
				<col width="600px">
			
			</colgroup>
            <tr>
        <th><h3><b>제목</b></h3></th>
        <td><input type="text" name="title" placeholder="제목을 입력해주세요"></td>
        </tr>
        <tr>
			<th><h3><b>내용</b></h3></th>
			<td><textarea rows="10" cols="60" ></textarea></td>
		</tr>
        <tr>    
        <th><h3><b>파일추가</b></h3></th>
        <td><input type="file"></td>
		</tr>
		<tr>
            <td colspan="2" align="right">
				<ul>
					<li> <input type="submit" value="등록" onclick=""></li>
					<li><input type="button" value="목록" onclick=""></li>
				</ul>	
			</td> 
    </tr>
	</table>
	</form>
	</div>
    <footer>
		<h5>copyright &copy;구렁이담넘어가조. All rights reserved.</h5>
	</footer>
</body>
</html>
