<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.util.List" %>
<%@ page import="com.dao.MemberDao" %>
<%@ page import="com.dto.MemberDto" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String command = request.getParameter("command");
	System.out.println("[command: " + command + "]");
	
	MemberDao dao = new MemberDao();
	
	if(command.equals("login")){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDto dto = dao.login(id,pw);
		
		if(dto.getUserid() != null){
			
			session.setAttribute("dto", dto);
			session.setMaxInactiveInterval(60*60);
			
			response.sendRedirect("main_index.jsp");
			
			
		}else{
%>
		<script type="text/javascript">
			alert("login 실패");
			location.href="index.jsp";
		</script>
<%			
		}
	
	}else if(command.equals("registform")){
		response.sendRedirect("registform.jsp");
		
	}else if(command.equals("idchk")){
		String userid = request.getParameter("id");
		String res = dao.idChk(userid);
		
		boolean idnotused = true;
		if(res != null){
			idnotused = false;
		}
		
		response.sendRedirect("idchk.jsp?idnotused="+idnotused);
	}else if(command.equals("insertuser")){
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String username = request.getParameter("username");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		MemberDto dto = new MemberDto();
		dto.setUserid(userid);
		dto.setUserpw(userpw);
		dto.setUsername(username);
		dto.setBirth(birth);
		dto.setEmail(email);
		dto.setPhone(phone);
		
		int res = dao.insertuser(dto);
		
		if(res>0){
%>
		<script type="text/javascript">
			alert("회원가입성공");
			location.href="main_index.jsp";
		</script>
<%
		}else{
%>
		<script type="text/javascript">
			alert("회원가입실패");
			location.href="logincontroller.jsp?command=registform";
		</script>

<%			
		}
	}else if(command.equals("logout")){
		session.invalidate();
		response.sendRedirect("index.jsp");
		
	}else if(command.equals("userinfo")){
		int userno = Integer.parseInt(request.getParameter("userno"));
		MemberDto dto = dao.selectUser(userno);
		request.setAttribute("dto", dto);
		pageContext.forward("userinfo.jsp");
		
	}else if(command.equals("updateform")){
		int userno = Integer.parseInt(request.getParameter("userno"));
		MemberDto dto = dao.selectUser(userno);
		
		request.setAttribute("dto", dto);
		pageContext.forward("updateuser.jsp");
		
	}else if(command.equals("updateuser")){
		
		String userpw = request.getParameter("userpw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int userno = Integer.parseInt(request.getParameter("userno"));
		
		MemberDto dto = new MemberDto();
		dto.setUserpw(userpw);
		dto.setEmail(email);
		dto.setPhone(phone);
		dto.setUserno(userno);
		
		boolean res = dao.updateUser(dto);
		
		if(res){
%>
		<script type="text/javascript">
			alert("수정 완료");
			location.href="logincontroller.jsp?command=userinfo&userno=<%=userno%>";
		</script>

<%			
		}else{
%>
		<script type="text/javascript">
			alert("수정 실패");
			location.href="logincontroller.jsp?command=userinfo&userno=<%=userno%>";
		</script>
<%			
		}
		
	}else if(command.equals("deleteuser")){
		int userno = Integer.parseInt(request.getParameter("userno"));
		boolean res = dao.deleteUser(userno);
		
		if(res){
%>
		<script type="text/javascript">
			alert("탈퇴 성공");
			location.href="logincontroller.jsp?command=logout";
		</script>
<%			
		}else{
%>
		<script type="text/javascript">
			alert("탈퇴 실패");
			location.href="logincontroller.jsp?command=userinfo&userno=<%=userno%>";
		</script>
<%		
			
		}
	}


%>














</body>
</html>