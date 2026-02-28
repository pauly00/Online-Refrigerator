<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bodytool.css">
</head>
<body>
<%

	int new_id = 0;
	int cnt=0;
	Connection conn = null;
	Statement stmt = null; 
	ResultSet rs = null;
	String sql_update;
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String username="";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wep_grock?serverTimezone=UTC"; 
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from user_list where userid = '" + userid + "' and password = '" + password +"'"; 
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e) {
		out.println("DB 연동 오류입니다.:1" + e.getMessage());
	}

	if(!rs.next()){
		%>
	<center>
	<br><br>
	<h2>로그인에 실패했습니다.</h2>
	<!--<img src="image/green_tree.gif">-->
	<br><br>
	<a href="main.jsp">메인 페이지로 이동</a> &nbsp; &nbsp; &nbsp;
	<a href="main2.jsp">로그인 페이지로 이동</a> 
	</center>
		<%
	}
	else{
			username = rs.getString("username");
			session.setAttribute("username",username);
	%>
	<center>
	<br><br>
	<h2>로그인 성공했습니다.</h2>

	<a href="main.jsp">메인페이지로 이동</a> &nbsp; &nbsp; &nbsp;
	<a href="main2.jsp">냉장고로 이동</a>
	</center>
	<% }
	%>
</body>
</html>