<!-- 냉장고 관리 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>냉장고 관리 페이지</title>
  
  <style>

    .hr-container {
  		width: 90%;
  		margin: 0 auto; /* 가운데 정렬을 위해 필요 */
	}

    #user_info { /* 개인정보 관련 */
      position: absolute;
      top: 1px;
      right: 70px;
      padding: 10px;
      border-radius: 5px;
    }

    #username { /*유저명: 필요없으면 삭제*/
      display: inline-block;
      width: 50px; /* 원의 크기 조절 */
      height: 50px; /* 원의 크기 조절 */
      background-color: yellow; /* 임시 색 */
      border-radius: 50%; /* 50%로 지정하여 원형으로 만듦 */
      text-align: center;
      line-height: 30px; /* 원 안에 텍스트를 세로 중앙 정렬하기 위함 */
    }

    
    #menu { /* 메뉴 속 내용 숨기기 */
      display: none;
      position: absolute; /* 고정 */
      top: 50px; left: 10px;
    }

    #inside_menu { /* big_tool과 같음 */
      display: flex;
      padding: 5px; /* 큰 직사각형의 안 여백 */
      border: solid; /* 큰 직사각형의 테두리 스타일 */
      border-radius: 10px; /* 큰 직사각형의 모서리 둥글게 */
      width: 1000px; height: 300px;
    }
    
    #inside_menu a {
      margin-bottom: 10px; /* 라인 사이를 맞추기 */
    }

    #hiddenContent {
      display: none;
    }

    #arrow7::before, #arrow30:before {
      content: "▼";
    }

  </style>
</head>
<body>
  <!--목록-->
  <button id="menuButton" onclick="toggleMenu()">목록</button>

  <script>
    function toggleMenu() { // 메뉴판
      var menu = document.getElementById("menu");
      menu.style.display = (menu.style.display === "none") ? "block" : "none";
    }
  </script>


  <div id="menu"><!-- 목록 내용 추가 -->
    <ul>
    <li>예시목록 1</li>
    <li>예시목록 2</li>
    </ul>
  </div>

  <form>
    <!--맨 위 검색-->
    <center><input type="text" name="search" size="30" id="search"></center>
  </form><br><br>
  
  <div class="hr-container">
  	<hr>
  </div>

  <div id="user_info">
    <p><span id="username">회원1</span></p>
    <!-- 동적으로 개인정보를 가지고 와야 한다 -->
  </div>


  <h2>&nbsp;&nbsp;&nbsp;냉장고 관리</h2><br><br><br>
  
  <hr>
  
  <script>
  function toggleContent(contentId) {
	    var content = document.getElementById(contentId);
	    if (content.style.display === "none") {
	      content.style.display = "block";
	    } else {
	      content.style.display = "none";
	    }
	  }
  </script>

	<!-- 7일 -->
  <h2>&nbsp;&nbsp;&nbsp;D-7 <span id="arrow7" onclick="toggleContent('hiddenContent7','arrow7')"></span></h2>
  <div id="hiddenContent7">
    <div id="inside_menu"> <!-- 냉장고 내부 메뉴 -->
      <a href="">1번</a>
      <a href="">2번</a>
      <a href="">3번</a>
    </div>
  </div>
  
  <!-- 30일 -->
	<h2>&nbsp;&nbsp;&nbsp;D-30 <span id="arrow30" onclick="toggleContent('hiddenContent30','arrow30')"></span></h2>
  	<div id="hiddenContent30">
    <div id="inside_menu"> <!-- 냉장고 내부 메뉴 -->
      <a href="">1번</a>
      <a href="">2번</a>
      <a href="">3번</a>
    </div>
  </div>
</body>
</html>