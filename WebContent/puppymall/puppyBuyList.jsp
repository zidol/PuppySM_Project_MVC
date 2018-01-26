<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>
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
		/* border: 1px red solid; */
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
	
	#buyImage{
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
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
						<input type="checkbox" id="remove" name=check value="${buy.buy_id }"/>
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
				<tr align="center">
					<td colspan="8" style="text-align: right;">
						총 금액 : ${totalMoney }원
					</td>
				</tr>
				<tr>
					<td colspan="8" style="text-align: center;">
						<input type="submit" value="삭제" formaction="puppyBuyRemove.pu"/>
					</td>
				</tr>
		</table>
		</form>
	</c:if>
	<c:if test="${buyList == null }">
		<section class="div_empty">
			주문 정보가 없습니다.
		</section>
	</c:if>
	<nav id="commandList">
		<a href="puppyList.pu?kind=all">[강아지 계속보기]</a>&nbsp;&nbsp;&nbsp;
		<a href="puppyCartList.pu">[강아지 찜 목록]</a>
	</nav>
</section>
</body>
</html>