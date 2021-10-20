<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/register.css">
</head>
<body>
	<form action="#" method="post">

	<div class="main-signup">
		<h1>URAVEL</h1>
		<h6>*는 필수사항입니다</h6>
		
		<!-- 회원가입 -->
		<section class="signup-wrap">
			<div>
				<h3>*아이디</h3>
				<span class="signup-input">
					<input id="signup-id" type="text" placeholder="아이디를 입력하세요">
					<input type="button" value="중복체크">
				</span>
				
				<h3>*비밀번호</h3>
				<span class="signup-input">
					<input id="signup-pw" type="password">
					<span class="pw-lock"></span>
				</span>
			</div>
			
			<div style="margin-top: 20px;">
				<h3>*이름</h3>
				<span class="signup-input">
					<input id="signup-name" type="text">
				</span>
				
				<h3>닉네임</h3>
				<span class="signup-input">
					<input id="signup-name" type="text">
				</span>
				
				<h3>생년월일</h3>
				<span style="display:flex;">
					<span class="signup-input">
						<input id="signup-birth-yy" type="text" placeholder="년(4자)">
					</span>
					<span class="signup-input" style="margin-left: 10px;">
						<select id="signup-birth-mm" class="selectbox" name="month" onchange="">
							<option value="month">월</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</span>
					<span class="signup-input" style="margin-left:10px;">
						<input id="signup-birth-dd" type="text" placeholder="일">
					</span>
				</span>
				
				<span class="choice">
					<h3>*이메일</h3>
				</span>
				<span class="signup-input">
					<input type="email" name="userEmail" placeholder="dmfkndf@naver.com">
					<input type="button" value="전송">
				</span>
			</div>
			
			<div style="margin-top:20px;">
				<h3>휴대전화</h3>
				<span class="signup-input">
					<select id="signup-country" class="selectbox" name="country" onchange="">
						<option value="ko">대한민국 +82</option>
					</select>
				</span>
				<div style="display:flex;">
					<span class="signup-input" style="width:100%; margin:10px 0px 0px 0px">
						<input id="signup-phone" type="text" placeholder="전화번호 입력">
					</span>
				</div>
			</div>
			
			<div style="margin-top:20px;">
				<h3>선호하는 여행 타입 설정</h3>
				<span class="signup-check">
				<label><input type="checkbox" name="Tema" value="hotell">호캉스</label>
				<label><input type="checkbox" name="Tema" value="culture">역사&문화</label>
				<label><input type="checkbox" name="Tema" value="book">책방</label><br><br>
				<label><input type="checkbox" name="Tema" value="night view">야경</label>
				<label><input type="checkbox" name="Tema" value="cafe">카페</label>
				<label><input type="checkbox" name="Tema" value="walk">산책</label><br><br>
				<label><input type="checkbox" name="Tema" value="park">공원</label>
				<label><input type="checkbox" name="Tema" value="food">맛집</label>
				<label><input type="checkbox" name="Tema" value="hiking">등산</label>
				<label><input type="checkbox" name="Tema" value="camping">캠핑</label><br><br>
				<label><input type="submit" value="Submit"></label>
				<label><input type="reset" value="Reset"></label>
				
					
				</span>
			</div>
			
			<div>
				<div class="signup-btn-wrap">
					<button id="signup-btn">가입하기</button>
				</div>
			</div>
		
		</section>
		
		</div>
		</form>
</body>
</html>