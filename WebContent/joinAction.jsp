<%@page import="java.io.PrintWriter"%>
<%@page import="lms.LmsDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="lms" class="lms.Lms" scope="page" />
<jsp:setProperty name="lms" property="userID" />
<jsp:setProperty name="lms" property="userPassword" />
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userSchool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS 로그인 상태</title>
</head>
<body>
	<%
		// 현재 세션 상태를 체크한다
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		// 이미 로그인했으면 다시 로그인을 할 수 없게 한다
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		LmsDAO lmsDAO = new LmsDAO();
		UserDAO userDAO = new UserDAO();
		String Id = request.getParameter("userID");
		String Password = request.getParameter("userPassword");
		int lmsResult = lmsDAO.join(Id, Password);
		if(lmsResult == 1){
			// 로그인에 성공하면 세션을 부여
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			session.setAttribute("userID", lms.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}else if(lmsResult == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('LMS 아이디와 비밀번호를 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(lmsResult == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>