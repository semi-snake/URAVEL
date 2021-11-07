<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="../css/loginstyle.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript">
	function registForm() {
		location.href = "logincontroller.jsp?command=registform"
	}
</script>

</head>
<body>
	<div>
		<div class="content">
			<header>URAVEL</header>
			<form action="logincontroller.jsp" method="post">
				<input type="hidden" name="command" value="login">
				<div class="field">
					<span class="fa fa-user"></span> <input type="text"
						placeholder="ID" name="id">
				</div>
				<div class="field space">
					<span class="fa fa-lock"></span> <input type="password"
						placeholder="Password" name="pw">
				</div>
				<div class="field">
					<input type="submit" value="LOGIN">
				</div>
				<div class="field space">
					<input type="button" value="회원가입" onclick="registForm();">
				</div>
				<div class="login">Or login with</div>

				<div class="kakaotalk"></div>
				<div class="naver"></div>

				<%@ include file="./kakaoAPI.jsp"%>
			</form>
		</div>
	</div>
</body>
</html>