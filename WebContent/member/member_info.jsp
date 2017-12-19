<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원정보 보기)</title>
<style type="text/css">
	#memberInfoArea{
		width: 400px;
		margin: auto;
		border: 1px solid gray;
	}
	table{
		width: 380px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>
<section id="memberInfoArea">
	<table>
		<tr>
			<td>아이디 : </td>
			<td>${member.id}</td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td>${member.pw}</td>
		</tr>
		<tr>
			<td>이름 : </td>
			<td>${member.name }</td>
		</tr>
		<tr>
			<td>나이 : </td>
			<td>${member.age }</td>
		</tr>
		<tr>
			<td>성별 : </td>
			<td>${member.gender }</td>
		</tr>
		<tr>
			<td>이메일 : </td>
			<td>${member.email }</td>
		</tr>
		<tr>
			<td>전화번호 : </td>
			<td>${member.tel }</td>
		</tr>
		<tr>
			<td>주소 : </td>
			<td>${member.addr }</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="memberListAction.me">리스트로 돌아가기</a>
			</td>
		</tr>
	</table>
</section>
</body>
</html>