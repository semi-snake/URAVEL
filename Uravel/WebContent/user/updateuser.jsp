<%@page import="com.dto.UserLocalDto"%>
<%@page import="com.dto.UserThemeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@page import="java.util.ArrayList"%>    
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="com.dto.MemberDto" %>
<%@page import="com.dao.MemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/mypage.css">
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#updateform").submit(function(){
			var count = 0;
			$(".updateval").each(function(){
				if($(this).val()=="" || $(this).val()==null){
					alert($(this).parent().prev("th").text() + "입력하세요.");
					$(this).focus();
					count++;
					return;
				}	
			});
			if(count>0){
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
	MemberDto userupdate = (MemberDto)request.getAttribute("dto");
	
	MemberDao memberDao = new MemberDao();
	ArrayList themeInfoList = memberDao.getThemeInfoList();
	ArrayList locationInfoList = memberDao.getLocationInfoList();
	
	List<UserThemeDto> resultThemeList = (List<UserThemeDto>)request.getAttribute("resultUserThemeList"); 
	List<UserLocalDto> resultLocalList = (List<UserLocalDto>)request.getAttribute("resultUserLocalList");
%>
	<h1>내 정보 수정</h1>
	<form action="logincontroller.jsp" method="post" id="updateform">
		<input type="hidden" name="command" value="updateuser">
		<input type="hidden" name="userno" value="<%=dto.getUserno() %>">
		
		<table>
			<colgroup>
				<col width="30%">
				<col width="100px">
			</colgroup>
			<tr>
				<th>아이디</th>
				<td><%=dto.getUserid() %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" class="updateval" name="userpw" value="<%=dto.getUserpw()%>"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=dto.getUsername() %></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><%=dto.getBirth() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" class="updateval" name="email" value="<%=dto.getEmail()%>"></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input type="text" class="updateval" name="phone" value="<%=dto.getPhone()%>"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td><%=dto.getRole() %></td>
			</tr>
			<tr>
				<th>선호하는 테마</th>
				<td>
				<% 
					Boolean checkMytheme = false; 
					for(int i=0;i<themeInfoList.size();i++){ 
						checkMytheme = false; 
						Map tMap = new HashMap();
						tMap = (Map)themeInfoList.get(i);
						for(int j=0;j<resultThemeList.size();j++){
							int tempThemecode = resultThemeList.get(j).getThemecode();
							if(tempThemecode == (int)tMap.get("themeCode")){
								checkMytheme = true;
							}
						}
				%>
				<%		
						if(checkMytheme){	
				%>
					<label><input type="checkbox" checked="checked" name="thema" value="<%=tMap.get("themeCode")%>" ><%=tMap.get("themeName")%></label>			
				<%		}else{ %>
					<label><input type="checkbox" name="thema" value="<%=tMap.get("themeCode")%>" ><%=tMap.get("themeName")%></label>	
				<%		}
						
					}
					checkMytheme = false;
				%>
				</td>
			</tr>
			<tr>
				<th>선호하는 지역</th>
				<td>
				<% for(int i=0;i<locationInfoList.size();i++){ 
						checkMytheme = false; 
						Map tMap = new HashMap();
						tMap = (Map)locationInfoList.get(i);
						for(int j=0;j<resultLocalList.size();j++){
							int tempLocalCode = resultLocalList.get(j).getLocalcode();
							if(tempLocalCode == (int)tMap.get("localCode")){
								checkMytheme = true;
							}
						}
						if(checkMytheme){	
				%>
					<label><input type="checkbox" checked="checked" name="local" value="<%=tMap.get("localCode")%>"><%=tMap.get("localName")%></label>			
				<%		}else{  %>
					<label><input type="checkbox" name="local" value="<%=tMap.get("localCode")%>"><%=tMap.get("localName")%></label>	
				<% 		}
					}
				%>
				</td>
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