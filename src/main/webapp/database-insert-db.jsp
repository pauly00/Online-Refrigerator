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
	Date today = new Date();
 	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String dateString = format.format(today);	
	String month = dateString.substring(5, 7);
	String day = dateString.substring(8,10);

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wep_grock?serverTimezone=UTC"; 
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select max(id) as max_id, count(*) as cnt from ingredient_list"; 
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
	String food = request.getParameter("food");
	String price = request.getParameter("price");
	int priceI = Integer.parseInt(price);
	String amount = request.getParameter("amount");
	int amountI = Integer.parseInt(amount);
	String amount_info = request.getParameter("amount_info");
	String expiration = request.getParameter("expiration");
	

	sql_update = "insert into ingredient_list values (" + new_id + ",'" + month + "','" + day + "','" + food + "'," + priceI + ","
			+ amountI + ",'" + expiration + "')";		
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
    
	try{
		stmt = conn.createStatement();
		String sql = "select * from account_book"; 
		rs = stmt.executeQuery(sql);
	}catch(Exception e){
		out.println("DB 연동 오류입니다.:3"	 + e.getMessage());
	}
	
	if(!rs.next()) { // 초기화
		for(int i=1;i<=12;i++) { 
			String setMonth = String.format("%02d", i);
			int max;
			if(i==2)	max = 28;
			else if( i==1 ||  i==3 || i==5 || i==7 || i==8 || i==10 || i==12) max = 31;
			else max = 30;
			for(int j=1;j<=max;j++){
				String setDay = String.format("%02d", j);				
				String sql2 = "insert into account_book values ('" + setMonth + "', '" + setDay + "', 0)";
				try{
					stmt.executeUpdate(sql2);
				}catch(Exception e) {
					out.println("DB 앤들 오류입니다:"+ e.getMessage() );
				}
				
			}
		}
	}

	sql_update = "update account_book set day_total = day_total + " + priceI + " where month = " + month  + " and day = " + day + ""; 
	
	try {
		stmt.executeUpdate(sql_update);
	}
	catch(Exception e) {
		out.println("DB 연동 오류입니다.:4"	 + e.getMessage());
	}

	session.setAttribute("recommand","y");	
	%>
	<br>
	<center>
	<h2>리스트에 작성했습니다.</h2>
	<a href="main2.jsp">냉장고로 이동</a>
	</center>
</body>
</html>