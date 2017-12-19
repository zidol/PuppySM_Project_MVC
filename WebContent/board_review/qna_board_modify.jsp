<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#registForm{
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table{
		margin: auto;
		width:450px;
	}
	.td_left{
		width: 150px;
		background: orange;
	}
	.td_right {
		width:150px;
		background: skyblue;
	}
	#commandCell{
		text-align: center;
	}
</style>
</head>
<body>
<section id="writeForm">
	<h2>게시판 글수정</h2>
	<form action="boardModifyPro.bor" method="post" name="modifyform">
	<input type="hidden" name="page" value="${page }"/>
	<input type="hidden" name="BOARD_NUM" value="${article.BOARD_NUM }">
	<table>
		<tr>
			<td class="td_left">
				<label for="BOARD_NAME">글쓴이</label>
			</td>
			<td class="td_right">
				<input type="text" name="BOARD_NAME" id="BOARD_NAME" value="${article.BOARD_NAME }"/>
			</td>
		</tr>
		<tr>
			<td class="td_left">
				<label for="BOARD_PASS">비밀번호</label>
			</td>
			<td class="td_right">
				<input name="BOARD_PASS" type="password" id="BOARD_PASS" value="${article.BOARD_PASS }" />
			</td>
		</tr>
		<tr>
			<td class="td_left">
				<label for="BOARD_SUBJECT">제목</label>
			</td>
			<td class="td_right">
				<input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" value="${article.BOARD_SUBJECT }"/>
			</td>
		</tr>
		<tr>
			<td class="td_left">
				<label for="BOARD_CONTENT">내용</label>
			</td>
			<td>
				<textarea rows="15" cols="50" id="BOARD_CONTENT" name="BOARD_CONTENT">${article.BOARD_CONTENT }</textarea>
			</td>
		</tr>			
	</table>
		<section id="commandCell">
			<a href="javascript:modifyform.submit()">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.back()">[뒤로]</a>
		</section>
	</form>
</section>
</body>
</html>