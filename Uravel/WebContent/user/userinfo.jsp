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
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/mypage.css">

<script type="text/javascript">
	function updateuser(userno){
		location.href="logincontroller.jsp?command=updateform&userno="+userno;
	}
	function deleteuser(userno){
		location.href="logincontroller.jsp?command=deleteuser&userno="+userno;
	}
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>

		<%@ include file="./user_side.jsp"%>
		<%
		MemberDto userinfo = (MemberDto) request.getAttribute("dto");
		%>

		<div class="admin-main">
			<div class="travel-info">
				<h1>내 정보 관리</h1>
				<form action="logincontroller.jsp" method="post">
					<input type="hidden" name="command" value="userinfo"> <input
						type="hidden" name="travelno" value="1">
					<table>
						<colgroup>
							<col width="30%">
							<col width="100px">
						</colgroup>
						<tr>
							<th>아이디</th>
							<td><%=userinfo.getUserid()%></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><%=userinfo.getUserpw()%></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=userinfo.getUsername()%></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><%=userinfo.getBirth()%></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><%=userinfo.getEmail()%></td>
						</tr>
						<tr>
							<th>핸드폰</th>
							<td><%=userinfo.getPhone()%></td>
						</tr>
						<tr>
							<th>등급</th>
							<td><%=userinfo.getRole()%></td>
						</tr>
						<tr>
							<th>계정활성화</th>
							<td><%=userinfo.getEnabled()%></td>
						</tr>
						<tr>
							<th>선호 테마</th>
							<td></td>
						</tr>
						<tr>
							<th>선호 지역</th>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<ul>
									<li><input type="button" value="수정"
										onclick="updateuser(<%=userinfo.getUserno()%>);"></li>
									<li><input type="button" value="회원탈퇴"
										onclick="deleteuser(<%=userinfo.getUserno()%>);"></li>
								</ul>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>