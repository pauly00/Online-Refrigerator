package controller;

//Controller.java 파일
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class controller {
	 private List<FoodIngredients> ingredientsList; // 여기에 정보들 저장됨
	 RecipeFetcher recipeFetcher = new RecipeFetcher();
	 public controller(List<FoodIngredients> ingredientsList) {
	     this.ingredientsList = (ingredientsList != null) ? ingredientsList : new ArrayList<>();
	 }
	
	 public void initializeIngredientsList(HttpServletRequest request) {
	     // 음식 재료 리스트가 비어있을 때만 CSV 파일에서 데이터를 불러옴
	     if (ingredientsList.isEmpty()) {
	         String filePath = "C:\\Users\\user\\Downloads\\hj\\2023FinalWepProject\\src\\main\\java\\ingredientTitle.csv";
	         ingredientsList = IngredientLoader.loadIngredientsFromCSV(filePath);
	         System.out.println("음식 재료 리스트를 CSV 파일에서 불러왔습니다.");
	     } else {
	         System.out.println("음식 재료 리스트가 이미 존재합니다.");
	     }
	
	     // 음식 재료 리스트 전달
	     request.setAttribute("ingredientsList", ingredientsList);
	 }
	
	 public void printIngredientsList() {
	     System.out.println("음식 재료 리스트:");
	
	     for (FoodIngredients ingredient : ingredientsList) {
	         System.out.println(ingredient);
	     }
	 }
	
	 
	 // main 실행 함수
	 public static void main(String[] args) {
	     // 컨트롤러 인스턴스 생성
	     controller controller = new controller(new ArrayList<>());
	     RecipeFetcher r = new RecipeFetcher();
	     System.out.println(r.getRecipe("김치"));
	     
	 }
}
