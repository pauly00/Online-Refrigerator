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
	int cnt;
	Connection conn = null;
	Statement stmt = null; 
	ResultSet rs = null;
	String sql_update;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wep_grock?serverTimezone=UTC"; 
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select max(id) as max_id, count(*) as cnt from user_list"; 
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e) {
		out.println("DB 연동 오류입니다.:1" + e.getMessage());
	}
	
	while(rs.next()) {
	cnt = Integer.parseInt(rs.getString("cnt")); 
	if(cnt != 0) new_id = Integer.parseInt(rs.getString("max_id"));
	}
	
	new_id++;
	String userid = request.getParameter("id");	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String phonenumber = request.getParameter("phonenumber");	

	sql_update = "insert into user_list values (" + new_id + ",'" + userid + "','" + username + "','" + password + "','" + phonenumber + "')";		
	try {
		stmt.executeUpdate(sql_update);
	}
	catch(Exception e) {
		out.println("DB 연동 오류입니다.:2"	 + e.getMessage());
	}
	rs.close();
	rs = null;
    stmt.close();
    stmt = null;
	%>
	<br>
	<center>
	<h2>리스트에 작성했습니다.</h2>
	<a href="main.jsp">메인 페이지로 이동</a>
	</center>
</body>
</html>