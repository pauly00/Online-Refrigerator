<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="bodytool.css">
</head>
<body>
<br>
<center><h1>냉장고에 음식 추가하기</h1><br>
<%
	String food = request.getParameter("food");
%>
<form action = "database-insert-db.jsp" method = "post">
<% if(food == null) { %>
<!-- 사진제거 및 div클래스 추가 -->
<div class="user-container">
	<div class="row-container">
		<div class="user-info1">음식</div>
		<input type = "text" name = "food" class="insertfoodlist"> <br>
		</div>
	</div>
<% } else { %>
<div class="user-container">
	<div class="row-container">
		<div class="user-info1">음식</div>
		<input type = "text" name = "food" value="<%= food %>" class="insertfoodlist"><br>
	</div>
</div>
<% } %>

<div class="user-container">
	<div class="row-container">
		<div class="user-info1">가격</div>
		<input type = "text" name = "price" class="insertfoodlist"><br>
	</div>
</div>

<div class="user-container">
	<div class="row-container">
		<div class="user-info1">양</div>
		<input type = "text" name = "amount" class="insertfoodlist"><br>
	</div>
</div>

<div class="user-container">
	<div class="row-container">
		<div class="user-info1">유통기한</div>
		<input type = "text" name = "expiration" class="insertfoodlist"><br><br>
	</div>
</div>

<input type="submit" value = "등록하기">&nbsp;
<input type ="reset" value = "다시쓰기">
</form>
</center>
</body>
</html>