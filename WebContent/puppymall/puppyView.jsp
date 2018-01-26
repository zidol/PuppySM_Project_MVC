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
	  <!-- Custom styles for this template -->
    <link href="css/portfolio-item.css" rel="stylesheet">
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
		width: 700px;
		height: 550px;
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
<body id="page-top">
<!-- <section id="listForm"> -->
	<%-- <h2>${puppy.kind }의 상세 정보</h2> --%>
	
	<!-- <section id="content_main"> -->
		<%-- <section id="content_left">
			<img src="images/${puppy.image }" align="middle">
		</section> --%>
		<!-- <section id="content_right"> -->
			<%-- <b>품종 : </b> ${puppy.kind }<br>
			<b>가격 : </b> ${puppy.price }<br>
			<b>신장 : </b> ${puppy.height }<br>
			<b>체중 : </b> ${puppy.weight }<br>
			<b>원산지 : </b> ${puppy.country }<br>
			<p id="desc">
			<b>내용 : </b> ${puppy.content }<br>
			</p> --%>
		<!-- Page Content -->
<!--   <div id="main-header">
  	<h1 id="main_title">Puppy Love Mall</h1>
  </div> -->
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="puppyList.pu?kind=all">Puppy Love Mall</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
            <!-- 아이디가 널일때 -->
              <c:if test="${sessionScope.id == null}">
	              <a class="nav-link" href="memberLogin.me">Login</a>
              </c:if>
              <!-- 아이디가 널 아닐떄 -->
              <c:if test="${sessionScope.id != null}">
	              <a class="nav-link" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-fw fa-sign-out"></i>Logout</a>
              </c:if>
            </li>
            <!-- admin(관리자)일 때  -->
            <c:if test="${sessionScope.id == 'admin' }">
	            <li class="nav-item">
	              <a class="nav-link" href="memberListAction.me">Member List</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="puppyRegistForm.pu">Puppy Registration</a>
	            </li>
            </c:if>
            <!-- 아이디가 널일 때 -->
            <c:if test="${sessionScope.id == null }">
            <li class="nav-item">
              <a class="nav-link" href="memberJoin.me">Join</a>
            </li>
            </c:if>
           <!--  <li class="nav-item">
              <a class="nav-link" href="puppyCartList.pu">Cart</a>
            </li> -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
              <span class="nav-link-text">MyPage</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              	<a class="dropdown-item" href="puppyCartList.pu">장바구니</a>
              	<a class="dropdown-item" href="puppyBuyList.pu">주문배송 조회</a>
              	<a class="dropdown-item" href="memberInfoViewAction.me?id=${id}">가입정보 확인</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Wish List</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Notice</a>
            </li>
            <li class="nav-item dropdown">
             <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
              <span class="nav-link-text">Board</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              	<a class="dropdown-item" href="boardList.boq">Q&A</a>
              	<a class="dropdown-item" href="boardList.bor">Review</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container">

      <!-- Portfolio Item Heading -->
      <h1 class="my-4">${puppy.kind }의 상세 정보</h1>

      <!-- Portfolio Item Row -->
      <div class="row">

        <div class="col-md-8">
          <img src="images/${puppy.image }" alt="" >
        </div>

        <div class="col-md-4">
          <h3 class="my-3">강아지 상태</h3>
          <p> ${puppy.content }</p>
          <h3 class="my-3">Project Details</h3>
          <ul>
            <li>품종 : ${puppy.kind }</li>
            <li>가격 : ${puppy.price }원</li>
            <li>신장 : ${puppy.height }cm</li>
            <li>체중 : ${puppy.weight }kg</li>
            <li>원산지 : ${puppy.country }</li>
          </ul>
          	<a href="puppyList.pu?kind=all">강아지 계속보기</a>
			<a href="puppyCartAdd.pu?id=${puppy.id }">강아지 찜하기</a>
        </div>		
      </div>
     
      <!-- /.row -->

      <!-- Related Projects Row -->
     <!--  <h3 class="my-4">Related Projects</h3>

      <div class="row">

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
        </div>

      </div> -->
      <!-- /.row -->

    </div>

	<footer class="py-5 bg-dark fixed-bottom" >
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>
</body>
</html>