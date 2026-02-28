<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bodytool.css">
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>
<%
	String username = (String) session.getAttribute("username");
	String userid="", password="", phonenumber = "";
	Connection conn = null;
	Statement stmt = null; 
	ResultSet rs = null;
	String sql_update;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wep_grock?serverTimezone=UTC"; 
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from user_list where username = '" + username +"'";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e) {
		out.println("DB 연동 오류입니다.:1" + e.getMessage());
	}
	while(rs.next()) {
		userid = rs.getString("userid");
		password = rs.getString("password");
		phonenumber = rs.getString("phonenumber");
		break;
	}
%>
<center>

<h1>회원 정보</h1> <br><br><br>

<!-- 사진제거 및 div클래스 추가 -->
<div class="user-container">
	<div class="row-container">
		<div class="user-info1">username </div>&nbsp;
		<div class="user-info2"><%=username %></div> <br><br>
	</div>

	<div class="row-container">
		<div class="user-info1">userid  </div>&nbsp;
		<div class="user-info2"><%=userid %></div>
	<br><br>
	</div>
	
	<div class="row-container">
		<div class="user-info1">password  </div>&nbsp;
		<div class="user-info2"><%=password %></div>
		<br><br>
	</div>
	<div class="row-container">
		<div class="user-info1">phonenumber  </div>&nbsp;
		<div class="user-info2"><%=phonenumber %></div>
		<br> <br> <br>
	</div>
</div>
<a href = "main.jsp">메인 페이지로 이동</a> &nbsp; &nbsp;
<a href = "main2.jsp">냉장고로 이동</a> <br><br><br>
<a href = "logout.jsp">로그아웃하기</a>
</center>
</body>
</html>