<!-- 회원가입페이지 -->
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@ page import="java.sql.Connection" %>
   <%@ page import="java.sql.DriverManager" %>
   <%@ page import="java.sql.PreparedStatement" %>
   <%@ page import="java.sql.SQLException" %>
   
<html>
<head>
   <link rel="stylesheet" type="text/css" href="sidebar.css">
   <meta charset="UTF-8">
   <title>회원가입</title>
   <style>
      body {
         font-family: 'Inter', sans-serif;
         background-color: #FFFFFF;
               
         text-align: center; /* 수정 부분: 글자 가운데 */
         height:500px; /*위에서부터 500px 높이로*/
      }
   
      .container { /* 전체*/
         position: absolute; /*중앙정령*/
         left: 50%;
         top: 30%;
         transform: translate(-50%, -50%);
      }
   
      .title {
         margin-top: 15px;
         text-align: center;
         color: black;
         font-size: 25px;
         font-weight: 700;
         line-height: 37.50px;
         word-wrap: break-word;
         
         color: gray; /*수정코드*/
           }
   
           .form-container {
               display: flex;
               flex-direction: column;
               margin: 0 auto;
               margin-top: 50px;
               width: 465px;
               gap: 8px;
           }
   
           .form-box { /*사용자명*/
               display: flex;
               flex-direction: column;
               padding: 6px 8px;
               gap: 6px;
               border-radius: 5px;
               overflow: hidden;
               border: 1px rgba(0, 0, 0, 0.66) solid;
           }
   
           .input-box { /*아이디 입력*/
               line-height: 28px;
               padding-left: 10px;
               width: 427px;
               height: 30px;
               font-size: 13px;
               resize: none;
               border-radius: 5px;
               border: 1px rgba(0, 0, 0, 0.44) solid;
           }
   
           .pw-input-box {/*비번 입력*/
               line-height: 28px;
               padding-left: 10px;
               width: 427px;
               height: 32px;
               font-size: 13px;
               resize: none;
               border-radius: 5px;
               border: 1px rgba(0, 0, 0, 0.44) solid;
           }
   
           .phone-box { /*전화번호*/
               display: flex;
               width: 430px;
               height: 35px;
           }
   
           .phone-ck { /*전화번호 체크:미구현*/
               border-radius: 5px;
               border: 1px rgba(0, 0, 0, 0.44) solid;
           }
   
           .phone-ck-btn {
               margin-left: auto;
               margin-right: 6px;
               width: 112px;
               height: 43px;
               /* 배경 이미지의 경로를 실제 경로로 수정하세요. */
               background-image: url('path/to/PhoneCkImg');
               cursor: pointer;
           }
           #ha{
           visibility:hidden;
           }
      body{ /*베경이미지 설정*/
         background-image: url("background.jpg");
         background-size: 130%; /* 이미지를 확대. */
      }
      
      #hello{
         height: 30px;
         text-align: center;
      }
   </style>
</head>
<body>
   <%
   
           Connection conn = null;
           PreparedStatement pstmt = null;
   
           try {
               // 데이터베이스 연결 설정 (실제 데이터베이스 URL, 사용자명, 암호로 대체)
               String url = "jdbc:mysql://localhost:3306/wep_grock?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
               conn = DriverManager.getConnection(url, "root", "0000");
   
               // 사용자 데이터를 데이터베이스에 삽입하는 SQL 쿼리 실행 (user_list 테이블 생성)
               String sql = "select * from user_list";
               pstmt = conn.prepareStatement(sql);
           } catch (Exception e) {
               // 예외 발생 시 스택 트레이스 출력
               e.printStackTrace();
               out.println("DB 오류" + e.getMessage());
           }
           Boolean ok = false;
           String id,passwd,username,phonenumber;
       %>
       <script>
       var isClick = false;
       function setClicked(){
         isClick = true;
         document.getElementById("ha").click();
       }
       </script>
       <div class="container" style="margin-bottom:20px;"> <!-- 스타일 추가 -->
           <div class="title">회원가입</div>
   
           <div class="form-container" style="margin-bottom: 20px;">
               <div class="form-box" style="margin-bottom: 5px;">
                   <input type="text" class="input-box" id="id" placeholder="아이디를 입력해주세요"></input>
                   <input type="password" id = "passwd" name="password" class="pw-input-box" placeholder="비밀번호를 입력해주세요">
                   <input type="password" id = "checkpasswd" class="pw-input-box" placeholder="비밀번호를 다시 입력해주세요">
               </div>
   
               <div class="form-box">
                   <input type="text" class="input-box" id="username" placeholder="사용하실 사용자명을 입력해주세요"></textarea>
               </div>
   
               <div class="form-box">
                   <input class="input-box phone-box" id="phonenumber" placeholder="휴대전화번호를 입력해주세요">
               </div>
                   <button id = "hello" onclick = "setClicked()" value = "제출하기">입력 완료
               <div class="phone-ck-btn"></div>
   
           </div>
       </div>

              <form method = "post" action = "member-insert-db.jsp" id = "signup">
                   <input type="hidden" name = "id" id = "r_id">
                   <input type="hidden" name ="password" id = "r_password">
                   <input type="hidden" name = "username" id = "r_username">
                   <input type="hidden" name = "phonenumber" id = "r_phonenumber">
              </form>
         <button id = ha onclick = "submitt()"></button>
      <script>
      function submitt(){
          var in_id = document.getElementById("id").value;
         var in_passwd = document.getElementById("passwd").value;
         var in_checkpasswd = document.getElementById("checkpasswd").value;
         var in_username = document.getElementById("username").value;
         var in_phonenumber = document.getElementById("phonenumber").value;   
         if(isClick){;
             if(in_passwd===in_checkpasswd && isClick == true){
               alert("비밀번호 동일")
                document.getElementById('r_id').value = document.getElementById('id').value;
                 document.getElementById('r_password').value = document.getElementById('passwd').value;
                 document.getElementById('r_username').value = document.getElementById('username').value;
                 document.getElementById('r_phonenumber').value = document.getElementById('phonenumber').value;
                 document.getElementById('signup').submit();   
             }
             else {
                 alert("비밀번호가 일치하지 않습니다");
                  return false;
             }
            
         }
         
      }
       </script>
    
   
   </body>
   </html>