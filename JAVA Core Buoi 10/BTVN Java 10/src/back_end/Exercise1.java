package back_end;

import java.sql.*;

public class Exercise1 {
    //Q1-P1: Tạo connection tới database và in ra khi thành công
    public static void doEx1(){
        String dbUrl = "jdbc:mysql://localhost/Testing_System_Assignment3";
        String username = "root";
        String password = "Meo_biet_bay_2020";
        try {
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connect success!");

            //Q2-P1: Tạo method để in ra các thông tin của position gồm có id, name
            Statement printPositionInfo = connection.createStatement();
            String query2 = "SELECT * FROM Position;";
            ResultSet resultSet2 = printPositionInfo.executeQuery(query2);
            while (resultSet2.next()){
                System.out.println("ID: " + resultSet2.getString(1));
                System.out.println("Name: " + resultSet2.getString(2));
            }

            //Q3-P1: Tạo method để tạo position, user sẽ nhập vào name
            String query3 = "INSERT INTO Position (PositionName) VALUES (?)";
            PreparedStatement insertPos = connection.prepareStatement(query3);
            insertPos.setString(1, "Design");
            int insert = insertPos.executeUpdate();
            System.out.println("Đã thêm " + insert + " Position");

            //Q4-P1: Tạo method để update tên của position gồm có id = 5 thành "Dev".
            String query4 = "UPDATE Position SET PositionName = ? WHERE PositionID = 5";
            PreparedStatement updatePos = connection.prepareStatement(query4);
            updatePos.setString(1, "Dev");
            int update = updatePos.executeUpdate();
            System.out.println("Đã cập nhật vị trí cho ID 5");

            //Q5-P1: Tạo method để delete của position theo id và user sẽ nhập vào id
            String query5 = "DELETE FROM Position WHERE PositionID = ?";
            PreparedStatement deletePos = connection.prepareStatement(query5);
            deletePos.setInt(1, 7);
            int delete = deletePos.executeUpdate();
            System.out.println("Đã xóa 1 user");

        }catch (SQLException e){
            throw new RuntimeException(e);
        }

    }

}
