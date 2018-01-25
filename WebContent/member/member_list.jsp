<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>회원관리 시스템  관리자모드(회원목록 보기)</title>
<style type="text/css">
	#memberListArea{
		width: 400px;
		border: 1px solid gray;
		margin: auto;
	}
	table{
		width: 380px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>
<section id="memberListArea">
	<table>
		<tr>
			<td colspan="2"><h1>회원목록</h1></td>
		</tr>
		<c:forEach var="member" items="${memberList }">
			<tr>
				<td>
					<a href="memberViewAction.me?id=${member.id}">${member.id }</a>
				</td>
				<td>
					<a href="memberDeleteAction.me?id=${member.id }">삭제</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2">
				<a href="puppyList.pu?kind=all">메인으로 돌아가기</a>
			</td>
		</tr>	
	</table>
</section>
</body>
</html>