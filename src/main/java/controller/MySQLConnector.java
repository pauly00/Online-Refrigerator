package controller;

//MySQLConnector.java 파일
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MySQLConnector {
 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/wep_grock";
 private static final String USER = "root";
 private static final String PASSWORD = "0000";

 public static void insertIngredient(FoodIngredients ingredient) {
     try (Connection connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD)) {
         String sql = "INSERT INTO ingredients (ingredient_name, price) VALUES (?, ?)";
         try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
             preparedStatement.setString(1, ingredient.getIngredientName());
             preparedStatement.setInt(2, ingredient.getPrice());
             preparedStatement.executeUpdate();
         }
     } catch (SQLException e) {
         e.printStackTrace();
     }
 }
}