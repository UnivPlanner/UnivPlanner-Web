<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link rel="stylesheet" href="css/custom.css">
 <style>
   body {
     min-height: 100th;
     background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#ffffff));
     background: -webkit-linear-gradient(bottom left, #ffffff 0%, #ffffff 100%);
     background: -moz-linear-gradient(bottom left, #ffffff 0%, #ffffff 100%);
     background: -o-linear-gradient(bottom left, #ffffff 0%, #ffffff 100%);
     background: linear-gradient(to top right, #ffffff 0%, #ffffff 100%);
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
<title>LMS 로그인 화면</title>
</head>
<body>  
	<!-- 로그인 양식 -->
	<br>
	<div class="container">
		<a class="white-circle" href="main.jsp" style="position:absolute; left: 45%;">
          <img class="logo img-circle" src="logo2.PNG" alt="Logo" style="width:180px; height:150px;">
        </a>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="container">		<!-- 하나의 영역 생성 -->
		<div class="input-form-backgroud row">
      		<div class="input-form col-md-12 mx-auto"  style="background-color:#ededed;">
      		<h4 class="mb-3">LMS 로그인</h4>
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<br>
			<form method="post" action="lmsLoginAction.jsp">
					<div class="mb-3">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<br>
					<div class="mb-3">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<br>
					<br>
					<br>
					<input type="submit" class="btn btn-primary form-control" value="로그인" style="background-color: #000000; border:none;">
			</form>
			</div>
		</div>	
	</div>
    
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>