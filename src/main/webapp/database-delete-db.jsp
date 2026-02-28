<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bodytool.css">
</head>
<body>
<%
	
	String passwd = "", sql, sql1;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String food = request.getParameter("food");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wep_grock?serverTimezone=UTC"; 
		conn = DriverManager.getConnection(url, "root", "0000"); 
		stmt = conn.createStatement();
		sql = "select * from ingredient_list where food = '" + food +"'";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e) {
		out.println("DB 연동에 실패했습니다.:" + e.getMessage());
	}
	
while(rs.next()) {
	sql1 = "delete from ingredient_list where food = '" + food + "'";
	try {
		stmt.executeUpdate(sql1);
	}
	catch(Exception e) {
		out.println("DB 연동에 실패했습니다" + e.getMessage());
	}
	session.setAttribute("recommand","y");
%>
	
	<br>
	<center><h2>해당 재료가 삭제되었습니다</h2> 
	<a href="main2.jsp">냉장고로 이동</a></center>
<%
		break;
}
	%>
 </body> </html>