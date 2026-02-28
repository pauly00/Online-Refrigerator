package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;

public class RecipeFetcher {

    public static String getRecipe(String ingredient) {
        String apiUrl = "http://openapi.foodsafetykorea.go.kr/api/c1158559110542f19517/COOKRCP01/xml/1/5/RCP_PARTS_DTLS=" + ingredient;
        System.out.println(apiUrl);
        try {
            // API에 대한 URL 생성
            URL url = new URL(apiUrl);
            
            // HTTP 연결 설정
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            // 응답 코드 확인
            int responseCode = connection.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            // 응답 데이터 읽기
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                // 응답 출력
                String recipe = parseRecipe(response.toString());
                //return recipe;
                return response.toString();

            } else {
                System.out.println("API 호출 실패");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "false";
    }

    private static String parseRecipe(String xml) {
        try {
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(new org.xml.sax.InputSource(new java.io.StringReader(xml)));
            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("row");

            StringBuilder recipeBuilder = new StringBuilder();

            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;
                    String recipePart = eElement.getElementsByTagName("RCP_PARTS_DC").item(0).getTextContent();
                    recipeBuilder.append(recipePart).append("\n");
                }
            }

            return recipeBuilder.toString();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
