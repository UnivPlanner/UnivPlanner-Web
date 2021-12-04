<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인</title>
</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
<nav class="navbar navbar-inverse navbar-main">
  <div class="container-fluid">
    <div class="row">
      <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand visible-xs" href="main.jsp">UnivPlanner</a>
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse text-center" id="bs-example-navbar-collapse-1">
     <div>
      <ul class="nav navbar-nav navbar-left" style="padding-left: 250px; padding-right:20px;">
	        <li class="active"><a href="main.jsp">Home<span class="sr-only">(current)</span></a></li>
	        <li><a href="lmsLogin.jsp">LMS 로그인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
      </ul>
     </div>
     <div class="navbar-brand hidden-xs">
        <a class="white-circle" href="main.jsp" style="position:absolute; left: 47%;">
          <img class="logo img-circle" src="logo.png" alt="Logo" >
        </a>
     </div>
     <div >
      <ul class="nav navbar-nav navbar-right" style="padding-left: 20px; padding-right:150px;">
        <li><a href="https://lms.sungshin.ac.kr/ilos/main/main_form.acl">교육시스템</a></li>
		<li><a href="https://portal.sungshin.ac.kr/sso/login.jsp?destination=/portal/ssu/stuMain">포탈시스템</a></li>
		<li><a href="https://lib.sungshin.ac.kr/">중앙도서관</a></li>
			<%
				// 로그인 하지 않았을 때 보여지는 화면
				if(userID == null){
			%>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역 -->	
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				// 로그인이 되어 있는 상태에서 보여주는 화면
				}else{
			%>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역 -->	
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
			</ul>
    </div>
    <!-- /.navbar-collapse -->
    </div>
  </div>
  </div>
  <!-- /.container-fluid -->
</nav>
<br>
<br>
<br>
<br>	
<br>
<br>
	<!-- 로그인 양식 -->
	<div class="container">		<!-- 하나의 영역 생성 -->
		<div class="col-lg-4">	<!-- 영역 크기 -->
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>	
	</div>
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>