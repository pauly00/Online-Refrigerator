<!-- 로그인 페이지 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="utf-8">
<title>로그인 페이지</title>
<style>
   body {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 700px;
      margin: 0;
      
      background-image: url("background.jpg");
      background-size: 250%; /* 이미지를 확대. */
      }

   form {
      display: flex;
      flex-direction: column;
      }
   
   a.login {
       position: absolute;
       top: 50px;
       margin-left: 10px; /* 왼쪽 여백 추가 */
       color: black;
       text-decoration : none; /*밑줄 제거*/
       right : 250px;
    }
    
</style>
</head>
<body> <!-- login 버튼 클릭 시 load -->
   
   <h1><center>Login</center></h1>

   <form method="POST" id="loginForm" action="trylogin.jsp">
      <input type="text" name="userid" size="30" placeholder="Enter your username/email"> <br>
      <input type="password" name="password" size="30" placeholder="Enter your password">   <br>
     <input type="submit" value ="로그인">
   </form>
   <h6>Don't have an account?
   <a href="signup.jsp">Signup Now</a> </h6>
</body>
</html>