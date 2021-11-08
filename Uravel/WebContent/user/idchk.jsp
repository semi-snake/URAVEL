<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	window.onload = function(){
		var id = opener.document.getElementsByName("userid")[0].value;
		
		document.getElementsByName("id")[0].value= id;
	}
	
	function confirm(bool){
		if(bool == "true"){
			opener.document.getElementsByName("userpw")[0].focus();
			opener.document.getElementsByName("userid")[0].title="y";
		}else{
			opener.document.getElementsByName("userid")[0].focus();
		}
		self.close();
	}
</script>

</head>
<%
	String idnotused = request.getParameter("idnotused");
%>
<body>
	<table border="1">
		<tr>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td><%=idnotused.equals("true")?"아이디 생성이 가능합니다.":"중복된 아이디가 존재합니다." %></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirm('<%=idnotused%>');">
			</td>
		</tr>
	</table>
</body>
</html>