<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
         <style>
        table {
            text-align: center;
        }
    </style>
    <link rel="stylesheet" href="./css/header.css">
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
	<!-- 헤더 종료 -->
    <div class="reviewupdate">
    <h1>후기 상세조회</h1>
    <form action="" method="">
		<input type="hidden" name="command" value="postReview">
    <table>
        <colgroup>
            <col width="400px">
            <col width="400px">
        </colgroup>
        <tr>
            <th><h3>후기게시글1</h3></th>
            <th>작성자1</th>
        </tr>
        <tr>
            <td>2021-10-15</td>
        </tr>
        <tr>    
            <td><textarea rows="10" cols="60" >내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........
                내용내용내용.........</textarea>
            </td>
        </tr>
        <tr>
            <td><img width="300px" 
                src=""
                alt="image"></td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input type="button" value="수정" onclick="">
                <input type="button" value="취소" onclick="">
                <input type="button" value="목록" onclick="">
             </td>   
        </tr>
    </table>
    </div>
</body>
</html>
</body>
</html>
