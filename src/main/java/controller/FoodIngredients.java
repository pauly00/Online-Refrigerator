// FoodIngredients.java 파일
package controller;

public class FoodIngredients {
    private String ingredientName;
    private int price;
    private int kg; //

    public FoodIngredients(String ingredientName, int price) {
        this.ingredientName = ingredientName;
        this.price = price;
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return getIngredientName();
    }
    
}
