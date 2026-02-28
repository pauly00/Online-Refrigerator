<%@ page import="java.sql.*" %>
<%@ page contentType="application/json; charset=UTF-8" %>

<%
    // 데이터베이스 설정

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    StringBuilder jsonBuilder = new StringBuilder();
    try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/wep_grock?serverTimezone=UTC"; 
		conn = DriverManager.getConnection(url, "root", "0000");
		stmt = conn.createStatement();
		String sql = "select * from account_book";
		rs = stmt.executeQuery(sql);

        // 결과 처리
        jsonBuilder.append("[");
        boolean firstRecord = true;
        while(rs.next()) {
            if (firstRecord) {
                firstRecord = false;
            } else {
                jsonBuilder.append(",");
            }
            jsonBuilder.append("{");
            jsonBuilder.append("\"month\":\"").append(rs.getString("month")).append("\",");
            jsonBuilder.append("\"day\":\"").append(rs.getString("day")).append("\",");
            jsonBuilder.append("\"day_total\":").append(rs.getInt("day_total"));
            jsonBuilder.append("}");
        }
        jsonBuilder.append("]");

    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        // 자원 정리
        try { if (rs != null) rs.close(); } catch(Exception e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch(Exception e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch(Exception e) { e.printStackTrace(); }
    }

    // JSON 데이터 클라이언트에 전송
    out.print(jsonBuilder.toString());	

%>
