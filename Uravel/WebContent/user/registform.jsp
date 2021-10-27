<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/register.css">

<script type="text/javascript">
	function idChk(){
		var doc = document.getElementsByName("userid")[0];
		if(doc.value.trim()=="" || doc.value==null){
			alert("아이디를 입력해 주세요.");
		}else{
			var target = "logincontroller.jsp?command=idchk&id="+doc.value.trim();
			open(target,"","width=200,height=200");
		}
	}
	
	function idChkConfirm(){
		var chk = document.getElementsByName("userid")[0].title;
		if(chk=="n"){
			alert("아이디 중복체크를 해주세요");
			document.getElementsByName("userid")[0].focus();
		}
	}
	
</script>

</head>
<body>
	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="command" value="insertuser">

	<div class="main-signup">
		<h1>URAVEL</h1>
		<h6>*는 필수사항입니다</h6>
		
		<!-- 회원가입 -->
		<section class="signup-wrap">
			<div>
				<h3>*아이디</h3>
				<span class="signup-input">
					<input id="signup-id" type="text" name="userid" title="n" placeholder="아이디를 입력하세요">
					<input type="button" value="중복체크" onclick="idChk();">
				</span>
				
				<h3>*비밀번호</h3>
				<span class="signup-input">
					<input id="signup-pw" type="password" name="userpw" onclick="idChkConfirm();">
					<span class="pw-lock"></span>
				</span>
			</div>
			
			<div style="margin-top: 20px;">
				<h3>*이름</h3>
				<span class="signup-input">
					<input id="signup-name" type="text" name="username" onclick="idChkConfirm();">
				</span>
				
				<h3>생년월일</h3>
				<span style="display:flex;">
					<span class="signup-input">
						<input id="signup-birth-yy" type="text" name="birth" placeholder="년(4자)" onclick="idChkConfirm();">
					</span>
					<span class="signup-input" style="margin-left: 10px;">
						<select id="signup-birth-mm" class="selectbox" name="Month" onchange="">
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
						<input id="signup-birth-dd" type="text" placeholder="일" onclick="idChkConfirm();">
					</span>
				</span>
				
				<span class="choice">
					<h3>*이메일</h3>
				</span>
				<span class="signup-input">
					<input type="email" name="email" placeholder="dmfkndf@naver.com" onclick="idChkConfirm();">
					<select name="kind">
						<option selected value="">직접입력</option>
						<option value="naver">naver.com</option>
						<option value="daum">daum.net</option>
						<option value="google">google.com</option>
					</select>
					<input type="button" value="전송" style="margin-left:130px;">
				</span>
			</div>
			
			<div style="margin-top:20px;">
				<h3>휴대전화</h3>
				<span class="signup-input">
					<select id="signup-country" class="selectbox" name="country" onclick="idChkConfirm();">
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
				<label><input type="checkbox" name="tema" value="hotell" >호캉스</label>
				<label><input type="checkbox" name="tema" value="culture">역사&문화</label>
				<label><input type="checkbox" name="tema" value="book">책방</label><br><br>
				<label><input type="checkbox" name="tema" value="night view">야경</label>
				<label><input type="checkbox" name="tema" value="cafe">카페</label>
				<label><input type="checkbox" name="tema" value="walk">산책</label><br><br>
				<label><input type="checkbox" name="tema" value="park">공원</label>
				<label><input type="checkbox" name="tema" value="food">맛집</label>
				<label><input type="checkbox" name="tema" value="hiking">등산</label>
				<label><input type="checkbox" name="tema" value="camping">캠핑</label><br><br>
				<label><input type="submit" value="저장" onclick="idChkConfirm();"></label>
				<label><input type="reset" value="취소"></label>
				</span>
			</div>
			
			<div style="margin-top:20px;">
				<h3>선호하는 여행 지역 설정</h3>
				<span class="signup-check">
				<label><input type="checkbox" name="local" value="강남구">강남구</label>
				<label><input type="checkbox" name="local" value="강동구">강동구</label>
				<label><input type="checkbox" name="local" value="강북구">강북구</label>
				<label><input type="checkbox" name="local" value="강서구">강서구</label>
				<label><input type="checkbox" name="local" value="괸악구">관악구</label>
				<label><input type="checkbox" name="local" value="광진구">광진구</label><br><br>
				<label><input type="checkbox" name="local" value="구로구">구로구</label>
				<label><input type="checkbox" name="local" value="금천구">금천구</label>
				<label><input type="checkbox" name="local" value="노원구">노원구</label>
				<label><input type="checkbox" name="local" value="도봉구">도봉구</label>
				<label><input type="checkbox" name="local" value="동대문구">동대문구</label>
				<label><input type="checkbox" name="local" value="동작구">동작구</label><br><br>
				<label><input type="checkbox" name="local" value="마포구">마포구</label>
				<label><input type="checkbox" name="local" value="서대문구">서대문구</label>
				<label><input type="checkbox" name="local" value="서초구">서초구</label>
				<label><input type="checkbox" name="local" value="성동구">성동구</label>
				<label><input type="checkbox" name="local" value="성북구">성북구</label>
				<label><input type="checkbox" name="local" value="송파구">송파구</label><br><br>
				<label><input type="checkbox" name="local" value="양천구">양천구</label>
				<label><input type="checkbox" name="local" value="영등포구">영등포구</label>
				<label><input type="checkbox" name="local" value="용산구">용산구</label>
				<label><input type="checkbox" name="local" value="은평구">은평구</label>
				<label><input type="checkbox" name="local" value="종로구">종로구</label>
				<label><input type="checkbox" name="local" value="중구">중구</label><br><br>
				<label><input type="checkbox" name="local" value="중랑구">중랑구</label><br><br>
				<label><input type="submit" value="저장" onclick="idChkConfirm();"></label>
				<label><input type="reset" value="취소"></label>
				</span>
			</div>
			
			<div>
				<div class="signup-btn-wrap">
					<input type="submit" value="가입하기">
				</div>
			</div>
		
		</section>
		
		</div>
		</form>
</body>
</html>