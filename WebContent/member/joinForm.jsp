<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
 <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
   	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	  <!-- Custom fonts for this template-->
	  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	  <!-- Page level plugin CSS-->
	  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	  <!-- Custom styles for this template-->
	  <link href="css/sb-admin.css" rel="stylesheet">
<style type="text/css">
	#joinformArea{
		width: 400px;
		margin: auto;
		border : 1px solid gray;
	}
	table{
		width: 380px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>
<section id="joinformArea">
	<form action="./memberJoinAction.me" name="joinform" method="post">
		<table>
			<tr>
				<td colspan="2">
					<h1>회원 가입 페이지</h1>
				</td>
			</tr>
			<tr>
				<td><label for="id">아이디 : </label></td>
				<td><input type="text" name="id" id = "id"/></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호 : </label></td>
				<td><input type="password" name="pw" id = "pw"/></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id = "name"/></td>
			</tr>
			<tr>
				<td><label for="age">나이 : </label></td>
				<td><input type="text" name="age" id = "age"/></td>
			</tr>
			<tr>
				<td><label for="gender">성별 : </label></td>
				<td>
					<input type="radio" name="gender" value="남" checked="checked"
					id="gender"/>남자
					<input type="radio" name="gender" value="여" id="gender"/>여자
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일 : </label></td>
				<td><input type="text" name="email" id = "email"/></td>
			</tr>
			<tr>
				<td><label for="tel">전화번호 : </label></td>
				<td><input type="text" name="tel" id = "tel"/></td>
			</tr>
			<tr>
				<td><label for="addr">주소 : </label></td>
				<td><input type="text" name="addr" id = "addr"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
					<a href="javascript:joinform.reset()">다시작성</a>&nbsp;&nbsp;
					<a href="puppyList.pu">홈으로..</a>
				 </td>
			</tr>
		</table>
	</form>
</section>
</body>
</html>