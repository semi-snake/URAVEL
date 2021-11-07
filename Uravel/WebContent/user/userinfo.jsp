<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="com.dto.MemberDto"%>
<%@page import="com.dto.UserThemeDto"%>
<%@page import="com.dto.UserLocalDto"%>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/header.css">

<script type="text/javascript">
	function updateuser(userno){
		location.href="logincontroller.jsp?command=updateform&userno="+userno;
	}
	function deleteuser(userno){
		var returnValue = confirm("정말로 탈퇴하시겠습니까?");
		if(returnValue == true){
			location.href="logincontroller.jsp?command=deleteuser&userno="+userno;
		}
	}
</script>
</head>
<%
MemberDto userinfo = (MemberDto) request.getAttribute("dto");
List<UserThemeDto> resultThemeList = (List<UserThemeDto>) request.getAttribute("resultUserThemeList");
List<UserLocalDto> resultLocalList = (List<UserLocalDto>) request.getAttribute("resultUserLocalList");
%>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./usertitle.jsp"%>
		<div class="admin-main">
			<div class="travel-info">
				<h1>내 정보 관리</h1>
				<form action="logincontroller.jsp" method="post">
					<input type="hidden" name="command" value="userinfo"> <input
						type="hidden" name="travelno" value="1">
					<table>
						<colgroup>
							<col width="30%">
							<col width="800px">
						</colgroup>
						<tr>
							<th>아이디</th>
							<td><%=userinfo.getUserid()%></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=userinfo.getUsername()%></td>
						</tr>
						<%
						String birth = userInfo.getBirth();
						String birth_var;

						if (birth == null || birth.equals("null")) {
							birth_var = "";
						} else {
							birth_var = birth;
						}
						%>
						<tr>
							<th>생년월일</th>
							<td><%=birth_var%></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><%=userinfo.getEmail()%></td>
						</tr>
						<%
						String phone = userInfo.getPhone();
						String phone_var;

						if (phone == null || phone.equals("null")) {
							phone_var = "";
						} else {
							phone_var = phone;
						}
						%>
						<tr>
							<th>핸드폰</th>
							<td><%=phone_var%></td>
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
							<td>
								<%
								for (int i = 0; i < resultThemeList.size(); i++) {
								%> <%
 if (i != 0) {
 %>,<%
 }
 %> <%=resultThemeList.get(i).getThemename()%> <%
 }
 %>
							</td>
						</tr>
						<tr>
							<th>선호 지역</th>
							<td>
								<%
								for (int i = 0; i < resultLocalList.size(); i++) {
								%> <%
 if (i != 0) {
 %>,<%
 }
 %> <%=resultLocalList.get(i).getLocalname()%> <%
 }
 %>

							</td>

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