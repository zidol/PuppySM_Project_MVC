<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dog Shop</title>
<style type="text/css">
	#listForm{
		width: 1000px;
		height: auto;
		border: 1px solid red;
		margin: auto;
	}
	h2,h3{
		text-align: center;
	}
	
	table{
		margin: auto;
		width: 550px;
	}
	.div_empty{
		background-color: red;
		width: 100%;
		height: 100%;
		text-align: center;
	}
	#todayImageList{
		text-align: center;
	}
	
	#productImage{
		width: 180px;
		height: 180px;
		border: none;
		margin-right: 10px;
		
	}
	#todayImage{
		width: 100px;
		height: 100px;
		border: none;
	}
 	#productImage:hover, #todayImage:hover{
		
		border: none;
		box-shadow: 0px 0px 20px 1px rgba(0, 0, 0, 1);
	}
</style>
</head>
<body>
<section id="listForm">
	<c:if test="${dogList != null}">
	<h2>강아지 목록</h2>
	<h3> <a href="dogRegistForm.dog">강아지 등록</a></h3>
	<table>
		<tr>
			<c:forEach var="dog" items="${dogList }" varStatus="status">
			<td>
				<a href="dogView.dog?id=${dog.id }">
				<img src="images/${dog.image }" id="productImage">
				</a><br>
				품종 : ${dog.kind }<br>
				가격 : ${dog.price }<br><br>
			</td>
			<c:if test="${((status.index+1) mod 5)==0}">
		</tr>
		<tr>
			</c:if>
			</c:forEach>
		</tr>
	</table>
	</c:if>
	<c:if test="${dogList==null }">
		<div class="div_empty">
		등록된 강아지가 없습니다. 분양불가
		</div>
	</c:if>
	<c:if test="${todayImageList != null }">
	
	<div id="todayImageList">
		<h2>오늘 본 강아지 목록</h2>
		<table>
			<tr>
				<c:forEach var="todayImage" items="${todayImageList }" varStatus="status"> 
					<td>
						<a href="dogView.dog?id=${dog.id }">
						<img src="images/${todayImage }" id="todayImage"/>
						</a>
					</td>
				<c:if test="${((status.index+1) mod 5)==0 }">
			</tr>
			<tr>
				</c:if>
				</c:forEach>
			</tr>
		</table>
	</div>
	</c:if>
</section>
</body>
</html>