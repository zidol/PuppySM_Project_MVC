<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 등록 페이지</title>
<style type="text/css">
	#registForm{
		width: 500px;
		height: 600px;
		border: 1px solid red;
		margin: auto;
	}
	h2{
		text-align: center;
	}
	table{
		margin: auto;
		width: 450px;
	}
	.td_left{
		width: 150px;
		background: orange;
	}
	.td_right{
		width: 300px;
		background: skyblue;
	}
	#commandCell{
		text-align: center;
	}
</style>
</head>
<body>
<section id="registForm">
	<header>
		<h2>강아지 정보 등록</h2>
	</header>
	<form action="dogRegist.dog" method="post" name="writeForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td colspan="2">
					<a href="dogList.dog">목록보기</a>
				</td>
			</tr>
			<tr>
				<td class="td_left">
					<label for="kind">품종 : </label>
				</td>
				<td class="td_right">
					<input type="text" name="kind" id="kind" required>
				</td>
			</tr>
			
			<tr>
				<td class="td_left">
					<label for="country">원산지 : </label>
				</td>
				<td class="td_right">
					<input type="text" name="country" id="country" required>
				</td>
			</tr>
			
			<tr>
				<td class="td_left">
					<label for="price">가격 : </label>
				</td>
				<td class="td_right">
					<input type="text" name="price" id="price" required>
				</td>
			</tr>
			
			<tr>
				<td class="td_left">
					<label for="height">신장 : </label>
				</td>
				<td class="td_right">
					<input type="text" name="height" id="height" required>
				</td>
			</tr>
			
			<tr>
				<td class="td_left">
					<label for="weight">체중 : </label>
				</td>
				<td class="td_right">
					<input type="text" name="weight" id="weight" required>
				</td>
			</tr>
			
			<tr>
				<td class="td_left">
					<label for="content">글내용 : </label>
				</td>
				<td class="td_right">
					<textarea rows="13" cols="40" name="content" id="content" wrap="off"></textarea>
				</td>
			</tr>
			
			<tr>
				<td class="td_left">
					<label for="image">상품이미지 : </label>
				</td>
				<td class="td_right">
					<input type="file" name="image" id="image" required>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" id="commandCell">
					<input type="submit" value="강아지 등록"/>
					<input type="reset" value="다시 작성"/>
					<input type="button" value="강아지 목록" onclick="window.location.href='dogList.dog'"/>
				</td>
			</tr>			
		</table>
	</form>
</section>
</body>
</html>