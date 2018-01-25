<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
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
#registForm {
	width: 500px;
	height: 600px;
	border: 1px solid red;
	margin: auto;
}
h2, h4 {
	text-align: center;
}
table {
	margin: auto;
	width: 600px;
	border-collapse: collapse;
}
#tr_top {
	background-color: rgb(52,58,64);
	text-align: center;
	color: white;
}
#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
}
#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}
a {
	text-decoration: none;
}
</style>
</head>
<body>
<!-- 게시판 리스트 -->
<section id="listForm">
	<h2>Review게시판</h2>
	<h4><a href="boardWriteForm.bor">게시판 글쓰기</a></h4>
	<h4><a href="puppyList.pu?kind=all">메인으로</a></h4>
	<table>
<c:if test="${articleList != null && pageInfo.listCount > 0 }">
		<tr id="tr_top">
			<td align="center">번호</td>
			<td>제목</td>
			<td align="center">작성자</td>
			<td align="center">날짜</td>
			<td align="center">조회수</td>
		</tr>
		<c:forEach items="${articleList }" var="article">
		<tr>
			<td align="center">${article.BOARD_NUM }</td>
			<td>
				<c:choose>
				<c:when test="${article.BOARD_RE_LEV != 0}">
					<c:forEach begin="1" end="${article.BOARD_RE_LEV*2 }" step="1">
						&nbsp;
					</c:forEach>
					 ▶
				</c:when>
				<c:otherwise>
					 ▶ 
				</c:otherwise> 
				</c:choose>
				<a href="boardDetail.bor?board_num=${article.BOARD_NUM }&page=${pageInfo.page}">
					${article.BOARD_SUBJECT }</a>
			</td>
			<td align="center">${article.BOARD_NAME }</td>
			<td align="center">${article.BOARD_DATE }</td>
			<td align="center">${article.BOARD_READCOUNT }</td>
		</tr>
		</c:forEach>
	</table>
</section>

<section id="pageList">
	<c:choose>
	<c:when test="${pageInfo.page <=1 }">
		[이전]&nbsp;
	</c:when>
	<c:otherwise>
		<a href="boardList.bor?page=${pageInfo.page-1 }">[이전]</a>&nbsp;
	</c:otherwise>
	</c:choose>
	
	<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1" >
		<c:choose>
		<c:when test="${a == pageInfo.page }">
			[${a }]&nbsp;
		</c:when>
		<c:otherwise>
			<a href="boardList.bor?page=${a }">[${a}]</a>&nbsp;
		</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:choose>
	<c:when test="${pageInfo.page >= pageInfo.maxPage }">
		[다음]
	</c:when>
	<c:otherwise>
		<a href="boardList.bor?page=${pageInfo.page+1}">[다음]</a>
	</c:otherwise>
	</c:choose>
</section>
</c:if>
<c:if test="${articleList == null || pageInfo.listCount <= 0 }">
<section id="emptyArea">등록된 글이 없습니다.</section>
</c:if>
</body>
</html>