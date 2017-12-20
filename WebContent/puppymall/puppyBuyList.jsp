<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>
<style type="text/css">
	#listForm{
		width: 640px;
		border: 1px red solid;
		margin: auto;
	}
	
	h2{
		text-align: center;
	}
	
	table{
		width: 550px;
		margin: auto;
		text-align: center;
	}
	
	.tr_top{
		background-color: rgb(52,58,64);
		color: white;
	}
	
	.div_empty{
		text-align: center;
	}
	
	.td_command {
		text-align: right;
	}
	
	#todayImageList{
		text-align: center;
	}
	
	#productImage{
		width: 150px;
		height: 150px;
		border: none;
	}
	
	#cartImage{
		width: 70px;
		height: 70px;
		border: none;
	}
	
	#select{
		text-align: center;
	}
	
	#commandList{
		text-align: center;
	}
	
	#upImage{
		width: 15px;
	}
	
	#downImage{
		width: 15px;
	}
	a{
		text-decoration: none;
	}
</style>
<script type="text/javascript">
function checkAll(theForm){
	if(theForm.remove.length == undefined){
		theForm.remove.checked = theForm.allCheck.checked;
	} else {
		for(var i=0; i<theForm.remove.length; i++){
			theForm.remove[i].checked = theForm.allCheck.checked;
		}
	}
}
function checkQtyDown(pid, qty) {
	if(qty > 1){
		location.href="puppyCartQtyDown.pu?pid="+encodeURIComponent(pid);
	}
}
function checkQtyUp(pid, qty) {
	if(qty > 0){
		location.href="puppyCartQtyUp.pu?pid="+encodeURIComponent(pid);
	}
}
</script>
</head>
<body>
<section id="listForm">
	<c:if test="${buyList != null && buyList.size()>0}">
		<h2>구매목록</h2>
		<form method="post">
		<table>
			<tr class="tr_top">
				<td><input type="checkbox" id="allCheck" name="allCheck"
				onclick="checkAll(this.form)"/></td>
				<td>구매번호</td>
				<td>상품 이미지</td>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>주문일</td>
				<td>주문상태</td>
			</tr>
			<c:forEach var="buy" items="${buyList }" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" id="remove" name="remove" value="${buy.buy_id }"/>
					</td>
					<td>${buy.buy_id }</td>
					<td><img src="images/${buy.image }" id="buyImage"/></td>
					<td>${buy.kind }</td>
					<td>${buy.price }</td>
					<td>${buy.qty}</td>
					<td>${buy.buy_date }</td>
					<td>${buy.buy_state }</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="6" style="text-align: center;">
						총 금액 : ${totalMoney }원
					</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align: center;">
						<input type="submit" value="주문" formaction="puppyBuyList.pu"/>
						<input type="submit" value="삭제" formaction="puppyCartRemove.pu"/>
					</td>
				</tr>
		</table>
		</form>
	</c:if>
	<c:if test="${buyList ==null }">
		<section class="div_empty">
			주문 정보가 없습니다.
		</section>
	</c:if>
	<nav id="commandList">
		<a href="puppyList.pu">[계속 둘러보기]</a>
	</nav>
</section>
</body>
</html>