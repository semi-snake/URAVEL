<%@page import="com.dto.UserLocalDto"%>
<%@page import="com.dto.UserThemeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="com.dto.MemberDto"%>
<%@page import="com.dao.MemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/header.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#updateform").submit(function() {
			var count = 0;
			$(".updateval").each(function() {
				if ($(this).attr("id") !== "checkPhone") {
					if ($(this).val() == "" || $(this).val() == null) {
						alert($(this).parent().prev("th").text() + "입력하세요.");
						$(this).focus();
						count++;
						return;
					}
				}
			});
			if (count > 0) {
				return false;
			}
		});
	});
</script>
</head>
<%
MemberDto userupdate = (MemberDto) request.getAttribute("dto");

MemberDao memberDao = new MemberDao();
ArrayList themeInfoList = memberDao.getThemeInfoList();
ArrayList locationInfoList = memberDao.getLocationInfoList();

List<UserThemeDto> resultThemeList = (List<UserThemeDto>) request.getAttribute("resultUserThemeList");
List<UserLocalDto> resultLocalList = (List<UserLocalDto>) request.getAttribute("resultUserLocalList");
%>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./usertitle.jsp"%>
		<div class="admin-main">
			<div class="travel-info">
				<h1>내 정보 수정</h1>
				<form action="logincontroller.jsp" method="post" id="updateform">
					<input type="hidden" name="command" value="updateuser"> <input
						type="hidden" name="userno" value="<%=userInfo.getUserno()%>">

					<table>
						<colgroup>
							<col width="30%">
							<col width="800px">
						</colgroup>

						<tr>
							<th>아이디</th>
							<td><%=userInfo.getUserid()%></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class="updateval" name="userpw"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=userInfo.getUsername()%></td>
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
							<td><input type="email" class="updateval" name="email"
								value="<%=userInfo.getEmail()%>"></td>
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
							<td><input type="tel" class="updateval" name="phone"
								id="checkPhone" value="<%=phone_var%>"></td>
						</tr>
						<tr>
							<th>등급</th>
							<td><%=userInfo.getRole()%></td>
						</tr>
						<tr>
							<th>선호하는 테마</th>
							<td>
								<%
								Boolean checkMytheme = false;
								for (int i = 0; i < themeInfoList.size(); i++) {
									checkMytheme = false;
									Map tMap = new HashMap();
									tMap = (Map) themeInfoList.get(i);
									for (int j = 0; j < resultThemeList.size(); j++) {
										int tempThemecode = resultThemeList.get(j).getThemecode();
										if (tempThemecode == (int) tMap.get("themeCode")) {
									checkMytheme = true;
										}
									}
								%> <%
 if (checkMytheme) {
 %> <label><input type="checkbox" checked="checked" name="thema"
									value="<%=tMap.get("themeCode")%>"><%=tMap.get("themeName")%></label>
								<%
								} else {
								%> <label><input type="checkbox" name="thema"
									value="<%=tMap.get("themeCode")%>"><%=tMap.get("themeName")%></label>
								<%
								}

								}
								checkMytheme = false;
								%>
							</td>
						</tr>
						<tr>
							<th>선호하는 지역</th>
							<td>
								<%
								for (int i = 0; i < locationInfoList.size(); i++) {
									checkMytheme = false;
									Map tMap = new HashMap();
									tMap = (Map) locationInfoList.get(i);
									for (int j = 0; j < resultLocalList.size(); j++) {
										int tempLocalCode = resultLocalList.get(j).getLocalcode();
										if (tempLocalCode == (int) tMap.get("localCode")) {
									checkMytheme = true;
										}
									}
									if (checkMytheme) {
								%> <label><input type="checkbox" checked="checked"
									name="local" value="<%=tMap.get("localCode")%>"><%=tMap.get("localName")%></label>
								<%
								} else {
								%> <label><input type="checkbox" name="local"
									value="<%=tMap.get("localCode")%>"><%=tMap.get("localName")%></label>
								<%
								}
								}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="submit"
								value="완료"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>

</body>
</html>