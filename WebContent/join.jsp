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
 <link rel="stylesheet" href="css/custom.css">
<script type="text/javascript" src="script.js"></script>
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
<title>회원가입</title>
</head>
<body>
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
<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto" style="background-color:#ededed;">
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
          <button class="btn btn-primary btn-lg btn-block" style="background-color: #000000; border:none;" type="submit" onclick="validTest()" >가입</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 UnivPlanner</p>
    </footer>
  </div>
  
<!-- Bootstrap javascript -->

</body>