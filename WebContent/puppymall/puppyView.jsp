<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 상세보기</title>
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
	#listForm{
		width: 640px;
		height: auto;
		border: 1px solid black;
		margin: auto;
	}
	h2{
		text-align: center;
	}
	img{
		width: 280px;
		height: 280px;
		border: none;
	}
	#content_main{
		height: auto;
	}
	#content_left{
		width: 300px;
		float:left;
	}
	#content_right{
		width: 340px;
		float: left;	
	}
	#commandList{
		text-align: center;
	}
	#desc{
		height: auto;
		
	}
</style>
</head>
<body>
<section id="listForm">
	<h2>${puppy.kind }의 상세 정보</h2>
	
	<section id="content_main">
		<section id="content_left">
			<img src="images/${puppy.image }">
		</section>
		<section id="content_right">
			<b>품종 : </b> ${puppy.kind }<br>
			<b>가격 : </b> ${puppy.price }<br>
			<b>신장 : </b> ${puppy.height }<br>
			<b>체중 : </b> ${puppy.weight }<br>
			<b>원산지 : </b> ${puppy.country }<br>
			<p id="desc">
			<b>내용 : </b> ${puppy.content }<br>
			</p>
		</section>
		<div style="clear:both"></div>
		<nav id="commandList">
			<a href="puppyList.pu?kind=all">쇼핑계속하기</a>
			<a href="puppyCartAdd.pu?id=${puppy.id }">장바구니에 담기</a>
		</nav>	
	</section>
</section>
</body>
</html>