<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.dto.MemberDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/mypage.css">
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#updateform").submit(function() {
			var count = 0;
			$(".updateval").each(function() {
				if ($(this).val() == "" || $(this).val() == null) {
					alert($(this).parent().prev("th").text() + "입력하세요.");
					$(this).focus();
					count++;
					return;
				}
			});
			if (count > 0) {
				return false;
			}
		});
	});
</script>

<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./user_side.jsp"%>
		<%
		MemberDto userupdate = (MemberDto) request.getAttribute("dto");
		%>
		<h1>내 정보 수정</h1>
		<form action="logincontroller.jsp" method="post" id="updateform">
			<input type="hidden" name="command" value="updateuser"> <input
				type="hidden" name="userno" value="<%=dto.getUserno()%>">

			<table>
				<colgroup>
					<col width="30%">
					<col width="100px">
				</colgroup>
				<tr>
					<th>아이디</th>
					<td><%=dto.getUserid()%></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" class="updateval" name="userpw"
						value="<%=dto.getUserpw()%>"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=dto.getUsername()%></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><%=dto.getBirth()%></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" class="updateval" name="email"
						value="<%=dto.getEmail()%>"></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><input type="text" class="updateval" name="phone"
						value="<%=dto.getPhone()%>"></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><%=dto.getRole()%></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="완료"></td>
				</tr>

			</table>
		</form>
	</main>
	<%@ include file="../common/footer.jsp"%>

</body>
</html>