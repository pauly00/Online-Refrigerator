package controller;

// IngredientLoader.java 파일
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class IngredientLoader {
	// csv 파일에서 재료 이름 가져오는 함수 리스트로 반환
    public static List<FoodIngredients> loadIngredientsFromCSV(String filePath) {
        List<FoodIngredients> ingredientsList = new ArrayList<>();
        Set<String> ingredientNamesSet = new HashSet<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String ingredientName = line.trim();

                // 중복 체크
                if (!ingredientNamesSet.contains(ingredientName)) {
                    ingredientNamesSet.add(ingredientName);

                    // FoodIngredients 인스턴스 생성 (가격은 일단 0으로 초기화)
                    FoodIngredients ingredient = new FoodIngredients(ingredientName, 0);

                    // 리스트에 추가
                    ingredientsList.add(ingredient);
                } else {
                    System.out.println("중복된 재료 이름 발견: " + ingredientName);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("파일 읽기 오류: " + e.getMessage());
        }

        return ingredientsList;
    }
}
