<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bodytool.css">
</head>
<body>
<%
	int total=0;
	Connection conn = null;
	Statement stmt = null; 
	ResultSet rs = null;
	String sql_update;
	String date = request.getParameter("date");
	String month = date.substring(5, 7);
	String day = date.substring(8,10);

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wep_grock?serverTimezone=UTC"; 
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from ingredient_list where month = " + month + " AND day = " + day ; 
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e) {
		out.println("DB 연동 오류입니다.: 1" + e.getMessage());
	}
	%>
	<br>
	<center>
	<h1><%=date %></h1>	</center> <br>
	<%
	String food,price,amount,expiration;
	int priceI=0;
	int i=1;
	while(rs.next()){
		food = rs.getString("food"); 
		amount = rs.getString("amount");
		price = rs.getString("price"); 
		priceI=Integer.parseInt(price);
		%>
		<h3><%=i %>.</h3> <br>
		음식: <%=food %>	<br>	
		양: <%=amount %> <br>
		가격: <%=price %> <br>
		<%
		total += priceI;
		i++;
	}
 	%>
 	<h2>총합:<%=total %> </h2>
<a href = "calender.jsp">캘린더로 이동하기</a>
</center>
</body>
</html>