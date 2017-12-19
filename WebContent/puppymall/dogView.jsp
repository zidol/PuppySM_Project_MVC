<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 상세보기</title>
<style type="text/css">
	#listForm{
		width: 640px;
		height: auto;
		border: 1px solid red;
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
		background: skyblue;
	}
</style>
</head>
<body>
<section id="listForm">
	<h2>${dog.kind }의 상세 정보</h2>
	
	<section id="content_main">
		<section id="content_left">
			<img src="images/${dog.image }">
		</section>
		<section id="content_right">
			<b>품종 : </b> ${dog.kind }<br>
			<b>가격 : </b> ${dog.price }<br>
			<b>신장 : </b> ${dog.height }<br>
			<b>체중 : </b> ${dog.weight }<br>
			<b>원산지 : </b> ${dog.country }<br>
			<p id="desc">
			<b>내용 : </b> ${dog.content }<br>
			</p>
		</section>
		<div style="clear:both"></div>
		<nav id="commandList">
			<a href="dogList.dog">쇼핑계속하기</a>
			<a href="dogCartAdd.dog?id=${dog.id }">장바구니에 담기</a>
		</nav>	
	</section>
</section>
</body>
</html>