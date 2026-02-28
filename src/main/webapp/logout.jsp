<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session = "false" %> 
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bodytool.css">
</head>
<body>
<center>
<br><br>
	<h1>로그아웃 성공하였습니다</h1> <br><br><br>
	
<!-- <img src="image/green_tree.gif"> -->
<a href = "main.jsp">메인 페이지로 이동</a>
</center>

<%
	HttpSession session = request.getSession();
	session.invalidate();
%>