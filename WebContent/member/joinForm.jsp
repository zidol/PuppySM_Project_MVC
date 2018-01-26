<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin - Start Bootstrap Template</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form action="./memberJoinAction.me" name="joinform" method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="id">아이디</label>
                <input class="form-control" id="id" type="text" name="id" aria-describedby="nameHelp" placeholder="아이디를 입력하세요">
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-6">
                <label for="name">이름</label>
                <input class="form-control" id="name" type="text" name = "name" aria-describedby="nameHelp" placeholder="이름">
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-6">
                <label for="age">나이</label>
                <input class="form-control" id="age" type="text" name ="age" aria-describedby="nameHelp" placeholder="나이">
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-6">
                <label for="tel">전화번호</label>
                <input class="form-control" id="tel" type="text" name = "tel" aria-describedby="nameHelp" placeholder="전화번호">
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-6">
                <label for="addr">주소</label>
                <input class="form-control" id="addr" type="text" name="addr" aria-describedby="nameHelp" placeholder="주소">
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-6">
                <label for="gender">성별</label><br>
                <input type="radio" name="gender" value="남" checked="checked" id="gender"/>남자
				&nbsp;&nbsp;<input type="radio" name="gender" value="여" id="gender"/>여자
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="email">이메일</label>
            <input class="form-control" id="email" type="text" name="email"aria-describedby="emailHelp" placeholder="이메일 주소">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="pw">비밀번호</label>
                <input class="form-control" id="pw" type="password" name="pw" placeholder="Password">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">비밀번호 확인</label>
                <input class="form-control" id="pw1" type="password" name="pw1" placeholder="Confirm password">
              </div>
            </div>
          </div>
          <a class="btn btn-primary btn-block" href="javascript:joinform.submit()">회원가입</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="memberLogin.me">로그인</a>
          <a class="d-block small" href="puppyList.pu?kind=all">홈으로</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
