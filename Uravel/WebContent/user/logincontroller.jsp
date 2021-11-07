<%@page import="com.dto.UserThemeDto"%>
<%@page import="com.dao.UserLocalDao"%>
<%@page import="com.dao.UserThemeDao"%>
<%@page import="com.dto.ThemeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<%@ page import="java.util.List"%>
<%@ page import="com.dao.MemberDao"%>
<%@ page import="com.dto.MemberDto"%>
<%@ page import="com.dto.LocationDto"%>

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

	if (command.equals("login")) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDto dto = dao.login(id, pw);

		if (dto.getUserid() != null) {

			request.getSession().setAttribute("userInfo", dto);
			session.setMaxInactiveInterval(60 * 60);

			response.sendRedirect("../Main?command=main");

		} else {
	%>
	<script type="text/javascript">
			alert("login 실패");
			location.href="index.jsp";
		</script>
	<%
	}

	} else if (command.equals("loginform")) {
	response.sendRedirect("index.jsp");
	} else if (command.equals("registform")) {
	response.sendRedirect("registform.jsp");
	} else if (command.equals("idchk")) {
	String userid = request.getParameter("id");
	String res = dao.idChk(userid);

	boolean idnotused = true;
	if (res != null) {
	idnotused = false;
	}

	response.sendRedirect("idchk.jsp?idnotused=" + idnotused);
	} else if (command.equals("insertuser")) {
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String username = request.getParameter("username");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	String[] thema = request.getParameterValues("thema");
	String[] local = request.getParameterValues("local");

	MemberDto dto = new MemberDto();
	dto.setUserid(userid);
	dto.setUserpw(userpw);
	dto.setUsername(username);
	dto.setBirth(birth);
	dto.setEmail(email);
	dto.setPhone(phone);

	int res = dao.insertuser(dto);

	if (thema != null) {
	UserThemeDao userThemeDao = new UserThemeDao();
	for (int i = 0; i < thema.length; i++) {
		res = userThemeDao.insertTheme(userid, thema[i]);
	}
	}

	if (local != null) {
	UserLocalDao userLocalDao = new UserLocalDao();
	for (int i = 0; i < local.length; i++) {
		res = userLocalDao.insertLocal(userid, local[i]);
	}
	}

	if (res > 0) {
	%>
	<script type="text/javascript">
			alert("회원가입성공");
			location.href="../Main?command=main";
		</script>
	<%
	} else {
	%>
	<script type="text/javascript">
			alert("회원가입실패");
			location.href="logincontroller.jsp?command=registform";
		</script>
	<%
	}
	} else if (command.equals("logout")) {
		session.invalidate();
	%>
	<script>
		alert("로그아웃 되었습니다!");
		location.href="../Main?command=main";
	</script>
	<%
	} else if (command.equals("userinfo")) {
	MemberDto memberDto = (MemberDto) request.getSession().getAttribute("userInfo");
	if (memberDto == null) {
		pageContext.forward("index.jsp");
	}
	request.setAttribute("dto", memberDto);

	UserThemeDao userThemeDao = new UserThemeDao();
	request.setAttribute("resultUserThemeList", userThemeDao.selectUserTheme(memberDto.getUserid()));

	UserLocalDao userLocalDao = new UserLocalDao();
	request.setAttribute("resultUserLocalList", userLocalDao.selectUserLocal(memberDto.getUserid()));

	pageContext.forward("userinfo.jsp");

	} else if (command.equals("updateform")) {
	int userno = Integer.parseInt(request.getParameter("userno"));
	MemberDto dto = dao.selectUser(userno);

	UserThemeDao userThemeDao = new UserThemeDao();
	request.setAttribute("resultUserThemeList", userThemeDao.selectUserTheme(dto.getUserid()));

	UserLocalDao userLocalDao = new UserLocalDao();
	request.setAttribute("resultUserLocalList", userLocalDao.selectUserLocal(dto.getUserid()));

	request.setAttribute("dto", dto);
	pageContext.forward("updateuser.jsp");

	} else if (command.equals("updateuser")) {

	MemberDto memberDto = (MemberDto) request.getSession().getAttribute("userInfo");

	String userpw = request.getParameter("userpw");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	int userno = Integer.parseInt(request.getParameter("userno"));

	String[] thema = request.getParameterValues("thema");
	String[] local = request.getParameterValues("local");

	memberDto.setUserpw(userpw);
	memberDto.setEmail(email);
	memberDto.setPhone(phone);
	memberDto.setUserno(userno);
	memberDto.setBirth(birth);

	boolean res = dao.updateUser(memberDto);

	if (res) {
		UserLocalDao lDao = new UserLocalDao();
		lDao.deleteUserLocal(memberDto.getUserid());
		for (int i = 0; i < local.length; i++) {
			lDao.insertLocal(memberDto.getUserid(), local[i]);
		}

		UserThemeDao tDao = new UserThemeDao();
		tDao.deleteUserTheme(memberDto.getUserid());
		for (int i = 0; i < thema.length; i++) {
			tDao.insertTheme(memberDto.getUserid(), thema[i]);
		}

		request.getSession().setAttribute("userInfo", memberDto);
	%>
	<script type="text/javascript">
			alert("수정 완료");
			location.href="logincontroller.jsp?command=userinfo&userno=<%=userno%>";
		</script>

	<%
	} else {
	%>
	<script type="text/javascript">
			alert("수정 실패");
			location.href="logincontroller.jsp?command=userinfo&userno=<%=userno%>";
		</script>
	<%
	}

	} else if (command.equals("deleteuser")) {
	int userno = Integer.parseInt(request.getParameter("userno"));
	boolean res = dao.deleteUser(userno);

	if (res) {
	%>
	<script type="text/javascript">
			alert("탈퇴 성공");
			location.href="logincontroller.jsp?command=logout";
		</script>
	<%
	} else {
	%>
	<script type="text/javascript">
			alert("탈퇴 실패");
			location.href="logincontroller.jsp?command=userinfo&userno=<%=userno%>
		";
	</script>
	<%
	}
	}
	%>












</body>
</html>