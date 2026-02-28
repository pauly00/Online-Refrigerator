<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="loginprofile.css">
  <style>
     .title {
        font-family : "Times New Roman"; /*글씨체 변경*/
         /*배경이 어두울 때 사용*/
     }
    article {
      display: flex;
      justify-content: center; /* 가로 중앙 정렬 */
    }
    
    img.left, img.right { /* 냉장고 문 사이 공백*/
      margin-right: 10px;
    }
    
    
    a:hover {
       color: gray; /* 마우스를 대면 색 변화*/
    }
   
   body{ /*베경이미지 설정*/
      background-image: url("background.jpg");
      background-size: 120%; /* 이미지를 확대. */
      
   }
   
   /*로그인 관련 css2개*/
   img.profile{ /* 프로필 사진*/
      position: absolute; /* 위치 고정*/
      display: block; /*블록 요소로 변경*/
      right: 60px; /*좌우 반전 상태*/
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
  <div id="a" style="visibility:hidden;">
  
    <%= request.getParameter("username") %>
</div>
</head>
<script>
function loaded() {
    var username =  document.getElementById('a').textContent;
    if (username && username.trim() !== '') {
      // 로그인 링크 요소를 찾아서 href 속성을 변경합니다.
      var loginLink = document.querySelector('.login');
      if (loginLink) {
        loginLink.href = 'userinfo.jsp'; // 로그인 버튼의 링크를 userinfo.jsp로 변경
      }
      var loginText = document.getElementById('c');
      if (loginText) {
        loginText.textContent = username; // 텍스트를 "userinfo"로 변경
      }
    }
 }
</script>
<body>
   <br><br><br><br><br>
   <!-- 로그인 버튼을 오른쪽으로 -->
   <div> 
      <!-- 로그인 버튼 및 이미지-->
      <%
      HttpSession sessionn = request.getSession(true);
      String username="";
      username = (String) sessionn.getAttribute("username");
      if(username == null){
         %>
         <a href="login.jsp" class="login">
          <img src="profile.jpg" width="50px" height="50px" class="profile"><h3><p>Log In</p></h3>
          </a>  
          </div><br>
   
   <article> <!-- 본문 -->
      <!-- 레프트라이트 없애고 이미지파일로 변형. 프롬포트의 내용을 캡쳐 -->
         <img src="left_door.png" width="35%" height="1000" class="left"> <!-- 냉장고 왼쪽 -->
       <img src="right_door.png" width="35%" height="1000" class="right"> <!-- 냉장고 오른쪽 -->
   </article>
          
     <%
      }
      else{
         %>
         <a href="userinfo.jsp" class="login">
          <img src="profile.jpg" width="50px" height="50px" class="profile"><h3><p><%=username%>님</p></h3>
          </a>  
          </div>
          <br>
         <article> <!-- 본문 -->
          <!-- 레프트라이트 없애고 이미지파일로 변형. 프롬포트의 내용을 캡쳐 -->
          <img src="left_door.png" width="35%" height="1000" class="left" onclick="location.href='main2.jsp'"> <!-- 냉장고 왼쪽 -->
          <img src="right_door.png" width="35%" height="1000" class="right" onclick="location.href='main2.jsp'"> <!-- 냉장고 오른쪽 -->
          </article>
          
     <%
      }
      %>
      
      
</body>
</html>