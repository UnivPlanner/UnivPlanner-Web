<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<!-- Bootstrap CSS -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <style>
   body {
     min-height: 100th;
     background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#e3e3e3));
     background: -webkit-linear-gradient(bottom left, #e3e3e3 0%, #e3e3e3 100%);
     background: -moz-linear-gradient(bottom left, #e3e3e3 0%, #e3e3e3 100%);
     background: -o-linear-gradient(bottom left, #e3e3e3 0%, #e3e3e3 100%);
     background: linear-gradient(to top right, #e3e3e3 0%, #e3e3e3 100%);
   }
   .input-form {
     max-width: 680px;
     margin-top: 80px;
     padding: 32px;
     background: #fff;
     -webkit-border-radius: 10px;
     -moz-border-radius: 10px;
     border-radius: 10px;
     -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
     -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
     box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
   }
 </style>
<title>회원가입</title>
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
<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form method="post" action="joinAction.jsp" class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="id">아이디</label>
              <input type="text" class="form-control" name="userID" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" name="userPassword" placeholder="" value="" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="name">이름</label>
            <input type="text" class="form-control" name="userName" placeholder="이름" required>
            <div class="invalid-feedback">
              이름을 입력해주세요.
            </div>
          </div>
          <div class="mb-3">
            <label for="school">학교</label>
            <select class="custom-select d-block w-100" name="userSchool">
              <option value=""></option>
              <option>성신여자대학교</option>
              <option>한국외국어대학교</option>
              <option>서강대학교</option>
              <option>경북대학교</option>
              <option>건국대학교</option>
              <option>서울여자대학교</option>
            </select>
            <div class="invalid-feedback">
              학교를 선택해주세요.
            </div>
          </div>
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" style="background-color: #bb86fc; border:none;" type="submit" >가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 UnivPlanner</p>
    </footer>
  </div>
  <script>
  (function () {
	  'use strict'
	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.validation-form')
	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }
	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
  </script>
</body>