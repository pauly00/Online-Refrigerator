<!-- 로그인 성공 후 메인페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="controller.controller"%>
<%@ page import="controller.RecipeFetcher"%>
<%@ page import="controller.FoodIngredients" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="org.w3c.dom.*" %>

<!DOCTYPE html>
<% controller c = new controller(new ArrayList<>()); %>
<html>
<head>
   <meta charset="utf-8">
   <link rel="stylesheet" type="text/css" href="sidebar.css">
   
   <title>MAIN PAGE</title> <!-- 타이틀명 변경 필요시 바꾸면 될듯 -->
   <style>

   hr {
       width: 90%; /*상단 길이 조정*/
       
    }
    
    body {/*베경이미지 설정*/
      background-image: url("?background_open.jpg");
      background-repeat: no-repeat; /*반복 오류 해결을 위해*/
      background-size: 115%; /* 이미지를 확대. */
      background-color: #e0ffff;
      color: black; /*글자색*/
       
       text-align: center;
       height:500px;
       
       font-family: sans-serif;
       
       }



   .search{
      display:flex;
       justify-content:center;
       align-items: center;
   }

    .big_tool { /* 레시피 큰 틀 */

       padding: 5px; /* 큰 직사각형의 안 여백 */
       border: solid; /* 큰 직사각형의 테두리 스타일 */
       border-radius: 10px; /* 큰 직사각형의 모서리 둥글게 */
       
       width: 1000px;
       height: 300px;
       
       display:block; /*글자들은 가운데로 감*/
       /* justify-content:center; */
       align-items: center;
       
       background-color: white;
       color: black;
       overflow: auto
    }
    .recipeS {
       width: 600px;
       height: 260px;
       display: block;
       border: solid; /* 큰 직사각형의 테두리 스타일 */
       border-radius: 10px; /* 큰 직사각형의 모서리 둥글게 */
       display: inline-block;
       background-color: #FFF59D;
       word-break: break-all;
       white-space: pre-line;
       margin: 10px;
       overflow: auto;
    }
    .ingredientInfo {
       width: 200px;
       height: 200px;
       display: block;
       border: solid; /* 큰 직사각형의 테두리 스타일 */
       border-radius: 10px; /* 큰 직사각형의 모서리 둥글게 */
       display: inline-block;
       background-color: #FFF59D;
       word-break: break-all;
       white-space: pre-line;
       margin: 10px;
       overflow: auto;
    }
    
    #beforeI {
       width: 280px;
       height: 280px;
       display: block;
       border: solid; /* 큰 직사각형의 테두리 스타일 */
       border-radius: 10px; /* 큰 직사각형의 모서리 둥글게 */
       display: inline-block;
       word-break: break-all;
       white-space: normal;
       margin: 3px;
       overflow: auto;
    }
    #afterI {
       width: 690px;
       height: 280px;
       margin: 3px;
       border: solid; /* 큰 직사각형의 테두리 스타일 */
       border-radius: 10px; /* 큰 직사각형의 모서리 둥글게 */
       display: inline-block;
       white-space: normal;
       word-break: break-all;
       background-color: white;
       color: black;
       overflow: auto;
       
       overflow-x:auto;
    }
    
    .re { /* 레시피 큰 틀 */

       padding: 5px; /* 큰 직사각형의 안 여백 */
       border: solid; /* 큰 직사각형의 테두리 스타일 */
       border-radius: 10px; /* 큰 직사각형의 모서리 둥글게 */
       overflow: auto;
       overflow-y:hidden;
       overflow-x:auto;
       white-space:nowrap;
       
       width: 1000px;
       height: 300px;
       
       background-color: white;
       color: black;
       
       content: "";
       clear: both;
    }

    .big_tool a {
       display: block;
       margin: 10px 0;
       padding: 5px; /* 작은 직사각형의 안 여백 */
       border-radius: 5px; /* 작은 직사각형의 모서리 둥글게 */
       text-decoration: none; /* 링크 밑줄 제거 */
       width: 100px; height: 50px; /*이건 뭡니까*/
    }

    .round_date { /* 장바구니 속 날짜 */
       border: solid;
       border-radius: 10px;
       padding: 5px; /* 버튼 내부의 여백을 조절 */
       margin: 10px;
    }

   
   /*로그인 관련 2개*/
   img.profile{ /* 프로필 사진*/
      position: absolute; /* 위치 고정*/
      display: block; /*블록 요소로 변경*/
      right: 60px; /*좌우 반전 상태*/
      color: white;
      right:70px;
   }
   
   .login {
       position: absolute;
       top: 50px;
       margin-left: 10px; /* 왼쪽 여백 추가 */
       color: black;
       text-decoration : none; /*밑줄 제거*/
       right : 200px;
    }
    
    .membername{ /*맴버이름*/
       left:50px;
       font-weight:bold;
       color: black;
    }
    
    .ingredientButton {
        display: inline-block;
        margin: 3px;
        padding: 10px;
        background-color: #FFF59D;
        color: #000;
        border: none;
        border-radius: 5px;
        align-items: center;
        cursor: pointer;
        white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
    }
   </style>
</head>

<body>

<%    
   String re = (String) session.getAttribute("recommand");
   if("y".equals(re)){
      session.setAttribute("recommand","n");
      response.sendRedirect("main2.jsp");
   }

%>
   
   <br><br>
   <form class="search">
      <!--맨 위 검색-->
      <center><input type="text" name="search" size="80" style="width:400px;height:30px;font-size:20px;outline: 3px solid skyblue;" id="search" placeholder="검색: 베이컨" oninput="filterIngredients()"></center>
    <div id="buttonContainer">
    </div>
    
   </form>
   <div class="login"> 
      <!-- 로그인 버튼 재구현 필요-->
      
         <img src="profile.jpg" width="50px" height="50px" class="profile">
      <% String username = (String) session.getAttribute("username");
         String i = (String) session.getAttribute("food");
         %>
      <h3><a href ="userinfo.jsp" class = "membername"><%=username %>님</a></h3>
   </div><br>
   
   
   <br><br><hr>

   <%
   // 목록 가져오기
    c.initializeIngredientsList(request);
   %>
   
     <h2>&nbsp;&nbsp;&nbsp;레시피 추천</h2>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;냉장고 재료 내 재료로 식사 메뉴를 추천합니다</p>
     <center>
     <div class="re" style="overflow: auto"> <br>
        <%
       String in = request.getParameter(".IngredientButten"); // 음식 재료 이름을 sql로 받아오는 코드 작성 후 반환 여따가
       String test = RecipeFetcher.getRecipe(i);
   
       try {
          String xmlData = test;
           // XML 파싱
           DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
           Document document = factory.newDocumentBuilder().parse(new org.xml.sax.InputSource(new java.io.StringReader(xmlData)));
   
           // 루트 엘리먼트 가져오기
           Element root = document.getDocumentElement();
   
           // <row> 엘리먼트 리스트 가져오기
           NodeList rowList = root.getElementsByTagName("row");
   
           // 각 <row> 엘리먼트의 속성과 값 출력
           for (int ia = 0; ia < rowList.getLength(); ia++) {
               Node rowNode = rowList.item(ia);
               if (rowNode.getNodeType() == Node.ELEMENT_NODE) {
                   Element rowElement = (Element) rowNode;
                   out.print("<div class=" + "recipeS" + "><h2>[" +  rowElement.getElementsByTagName("RCP_NM").item(0).getTextContent() + "]</h2>");
                   // 각 엘리먼트의 값을 가져와서 출력
                   out.print("<h4>재료 목록</h4> " + rowElement.getElementsByTagName("RCP_PARTS_DTLS").item(0).getTextContent() + "<br>");
                   out.println("<h4>만드는 방법</h4>");
   
                   String manualContent;
                   String manualIMG;
                   for (int n = 1; ; n++) {
                       manualContent = rowElement.getElementsByTagName("MANUAL0" + String.valueOf(n)).item(0).getTextContent();
                       manualIMG = rowElement.getElementsByTagName("MANUAL_IMG0" + String.valueOf(n)).item(0).getTextContent();

                       if (manualContent == null || manualContent.isEmpty()) {
                           // 만약 MANUAL+n의 내용이 null이거나 비어있다면 반복 종료
                           break;
                       }

                       // MANUAL+n의 내용 출력
                       out.println(manualContent + "<br>");
                       out.print("<img src=");
                       out.print("\"" + manualIMG + "\"");
                       out.print("></a><br>");
                   }
               }
               out.println("<br></div>");
          }
         } catch (Exception e) {
                 out.println("Error: " + e.getMessage());
         }
      %>
     </div>
     </center>

     <h2>&nbsp;&nbsp;&nbsp;냉장고 관리</h2>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유통기한이 얼마 남지 않은 식재료를 확인하세요</p>

<center>
    <div class="re" style="overflow: auto">
       <div id = "beforeI"> <h4>음식 재료 검색 항목</h4>
       <%
        List<FoodIngredients> ingredientsList = (List<FoodIngredients>) request.getAttribute("ingredientsList");
        if (ingredientsList != null && !ingredientsList.isEmpty()) {
            for (FoodIngredients ingredient : ingredientsList) {
        %>
                <button class='ingredientButton' value='<%= ingredient.getIngredientName() %>' onclick="location.href='database-insert.jsp?food=<%= ingredient.getIngredientName() %>'">
                    <%= ingredient.getIngredientName() %>
                    
                </button>
        <%
            }
        } else {
        %>
            <p>음식 재료가 없습니다.</p>
        <%
        }
        %>
        </div>
        <div id = "afterI"> <h4> 내가 보유한 음식 재료</h4>
        <%
      // JDBC 연결 및 데이터 조회
      try {
          Class.forName("com.mysql.jdbc.Driver");
          String url = "jdbc:mysql://localhost:3306/wep_grock?serverTimezone=UTC";
          Connection conn = DriverManager.getConnection(url, "root", "0000");
      
          // SQL 쿼리
          String query = "SELECT * FROM ingredient_list";
          PreparedStatement pstmt = conn.prepareStatement(query);
          ResultSet rs = pstmt.executeQuery();
      
          // 결과 출력
          while (rs.next()) {
              int id = rs.getInt("id");
              String month = rs.getString("month");
              String day = rs.getString("day");
              String food = rs.getString("food");
              session.setAttribute("food", food);
              int price = rs.getInt("price");
              int amount = rs.getInt("amount");
              String expiration = rs.getString("expiration");
      %>
              <a href="database-delete.jsp?food=<%=food%>"><div class="ingredientInfo">
                 <h5><%= food %></h5>
                  추가 날짜 : <%= month %>월 <%= day %>일 <br>
                  가격: <%= price %><br>
                  수량: <%= amount %> 유통기한 : <%= expiration %>
              </div></a>
      <%
          }
          
          // 리소스 해제
          rs.close();
          pstmt.close();
          conn.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
      %>
        </div>
    </div>

</center>

<script>
    // 식재료 검색 해서 보여주기
    function filterIngredients() {
        var searchInput = document.getElementById('search').value.toLowerCase();
        var buttons = document.querySelectorAll('.ingredientButton');

        buttons.forEach(button => {
            var buttonText = button.value.toLowerCase();
            // 입력한 검색어가 재료 이름에 포함되어 있으면 보여주고, 그렇지 않으면 감추기
            button.style.display = buttonText.includes(searchInput) ? 'block' : 'none';
        });
    }

    // 각 버튼에 클릭 이벤트를 추가하고 클릭 시 해당 버튼의 값을 출력하는 함수
    document.querySelectorAll('.ingredientButton').forEach(button => {
        button.addEventListener('click', function() {
            alert("선택한 재료: " + this.value);
            
        });
    });
</script>

     </center>

   <h2>&nbsp;&nbsp;&nbsp;11월 가계부</h2>
   <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11월의 소비 내역을 확인하세요</p> <br>
   <h1><a href="calender.jsp">가계부 이동</a></h1>
    <center>
     </center>
     
   <br><br><br><br>
</body>
</html>