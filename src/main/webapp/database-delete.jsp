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
<%
   String food = request.getParameter("food");
%>
<br>
<center><h1>냉장고에 음식 삭제하기</h1>
<form action = "database-delete-db.jsp" method = "post">

<br><!-- div 태그로 박스안에 넣는 작업.. -->
<% if(food == null) { %>
<div class="user-container">
	<div class="row-container">
		<div class="user-info1">삭제할 음식</div>
		<input type = "text" name = "food" class="deletefoodlist" placeholder="삭제할 음식을 입력하세요.">
	</div>
</div> <br><br>
<% } else { %>
<div class="user-container">
	<div class="row-container">
		<div class=>삭제할 음식</div>
			<input type = "text" name = "food" value="<%= food %>" class="deletefoodlist" placeholder="삭제할 음식을 입력하세요.">
		<br><br>
<% } %>

<input type="submit" value = "등록하기">&nbsp;
<input type ="reset" value = "다시쓰기">
</form>
</center>
</body>
</html>