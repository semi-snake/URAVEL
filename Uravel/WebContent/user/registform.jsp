<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>    
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="com.dao.MemberDao" %>

<%
	MemberDao dao = new MemberDao();
	ArrayList themeInfoList = dao.getThemeInfoList();
	ArrayList locationInfoList = dao.getLocationInfoList();
%>
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
	function typeChk(){
		var msg = "테마 선택 완료.\n";
		var chk = document.getElementsByName("tema");
		
		for(var i=0; i<chk.length; i++){
			if(chk[i].checked){
				msg += (" " + chk[i].value + "\n");
			}
		}
		alert(msg);
	}
	function localChk(){
		var msg = "지역 선택 완료.\n";
		var chk = document.getElementsByName("local");
		
		for(var i=0; i<chk.length; i++){
			if(chk[i].checked){
				msg += (" " + chk[i].value + "\n");
			}
		}
		alert(msg);
	}
	
</script>

</head>
<body>
	<form action="logincontroller.jsp" method="post">
		<input type="hidden" name="command" value="insertuser">
		<input type="hidden" name="command" value="insertlocal">

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
						<input id="signup-birth-yy" type="date" name="birth" onclick="idChkConfirm();">
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
					<input type="button" value="인증" style="margin-left:130px;" onclick="emailSend()">
				</span>
			</div>
			
			<div style="margin-top:20px;">
				<h3>휴대전화</h3>
				<span class="signup-input" style="width:100%; margin:10px 0px 0px 0px">
					<input type="text" name="phone" placeholder="010-****-****" onclick="idChkConfirm();">
				</span>
			</div>
			
			<div style="margin-top:20px;">
				<h3>선호하는 여행 타입 설정</h3>
				<span class="signup-check">
				<% for(int i=0;i<themeInfoList.size();i++){ 
						Map tMap = new HashMap();
						tMap = (Map)themeInfoList.get(i);
				%>
					<label><input type="checkbox" name="thema" value="<%=tMap.get("themeCode")%>" ><%=tMap.get("themeName")%></label>			
				<%	}  %>

				</span>
			</div>
			
			<div style="margin-top:20px;">
				<h3>선호하는 여행 지역 설정</h3>
				<span class="signup-check">
				<% for(int i=0;i<locationInfoList.size();i++){ 
						Map tMap = new HashMap();
						tMap = (Map)locationInfoList.get(i);
				%>
					<label><input type="checkbox" name="local" value="<%=tMap.get("localCode")%>"><%=tMap.get("localName")%></label>			
				<%	}  %>
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