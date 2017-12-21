<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
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
<c:if test="${startMoeny != null }">
	<c:set var="startMoney" value="${startMoney }"></c:set>
</c:if>
<c:if test="${endMoney != null}">
	<c:set var="endMoeny" value="${endMoney }" ></c:set>
</c:if>
<section id="listForm">
	<c:if test="${cartList != null && cartList.size()>0}">
		<h2>장바구니</h2>
		<form method="post">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<tr id="select">
				<td colspan="6" align="right">
				<select id="startMoney" name="startMoney">
					<option value="0">=최하=</option>
					<c:choose>
						<c:when test="${startMoney==100000 }">
							<option selected="selected">100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==200000 }">
							<option>100000</option>
							<option selected="selected">200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==300000 }">
							<option>100000</option>
							<option>200000</option>
							<option selected="selected">300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==400000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option selected="selected">400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==500000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option selected="selected">500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==600000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option selected="selected">600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==700000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option selected="selected">700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==800000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option selected="selected">800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==900000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option selected="selected">900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==1000000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option selected="selected">1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${startMoney==1100000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option selected="selected">1100000</option>
						</c:when>
						<c:otherwise>
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:otherwise>
					</c:choose>
				</select> ~  
				<select id="endMoney" name="endMoney">
					<option value="1200000">=최고=</option>
					<c:choose>
						<c:when test="${endMoney==100000 }">
							<option selected="selected">100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==200000 }">
							<option>100000</option>
							<option selected="selected">200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==300000 }">
							<option>100000</option>
							<option>200000</option>
							<option selected="selected">300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==400000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option selected="selected">400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==500000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option selected="selected">500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==600000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option selected="selected">600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==700000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option selected="selected">700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==800000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option selected="selected">800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==900000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option selected="selected">900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==1000000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option selected="selected">1000000</option>
							<option>1100000</option>
						</c:when>
						<c:when test="${endMoney==1100000 }">
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option selected="selected">1100000</option>
						</c:when>
						<c:otherwise>
							<option>100000</option>
							<option>200000</option>
							<option>300000</option>
							<option>400000</option>
							<option>500000</option>
							<option>600000</option>
							<option>700000</option>
							<option>800000</option>
							<option>900000</option>
							<option>1000000</option>
							<option>1100000</option>
						</c:otherwise>
					</c:choose>
				</select>
				<input type="submit" value="검색" formaction="puppyCartSearch.pu"/>
				</td>
			</tr>
			<tr class="tr_top">
				<td><input type="checkbox" id="allCheck" name="allCheck"
				onclick="checkAll(this.form)"/></td>
				<td>번호</td>
				<td>상품 이미지</td>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
			</tr>
			<c:forEach var="cart" items="${cartList }" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" id="remove" name="check" value="${cart.pid }"/>
					</td>
					<td>
					${status.index+1 }<!-- 번호값 계산 -->
					</td>
					<td>
						<img src="images/${cart.image }" id="cartImage"/>
					</td>
					<td>
						${cart.kind }
					</td>
					<td>
						${cart.price }
					</td>
					<td>
					<a href="javascript:checkQtyUp('${cart.pid }',${cart.qty })">
					<img src="images/up.jpg" id="upImage" border="0"/>
					</a><br>
					${cart.qty}<br>
					<a href="javascript:checkQtyDown('${cart.pid }',${cart.qty })">
					<img src="images/down.jpg" id="downImage" border="0"/>
					</a>
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="6" style="text-align: center;">
						총 금액 : ${totalMoney }원
					</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align: center;">
						<input type="submit" value="주문" formaction="puppyBuyAdd.pu"/>
						<input type="submit" value="삭제" formaction="puppyCartRemove.pu"/>
					</td>
				</tr>
		</table>
		</form>
	</c:if>
	<c:if test="${cartList ==null }">
		<section class="div_empty">
			강아지 정보가 없습니다.
		</section>
	</c:if>
	<nav id="commandList">
		<a href="puppyList.pu">[쇼핑 계속하기]</a>
		<a href="puppyCartList.pu">[전체보기]</a>
		<a href="puppyBuyList.pu">[주문 목록보기]</a>
	</nav>
</section>
</body>
</html>