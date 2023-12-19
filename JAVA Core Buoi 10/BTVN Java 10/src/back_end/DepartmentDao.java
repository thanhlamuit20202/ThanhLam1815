package back_end;

import entity.Department;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class DepartmentDao {
    public static List<Department> getDepartment(){
        String dbUrl = "jdbc:mysql://localhost/Testing_System_Assignment3";
        String username = "root";
        String password = "Meo_biet_bay_2020";
        List<Department> departmentList = new ArrayList<>();
        try {
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connect success!");

            //Q1-P2: Tạo method để lấy ra danh sách tất cả các Department
            String query1 = "SELECT * FROM Department;";
            Statement getDepart = connection.createStatement();
            ResultSet departInfo = getDepart.executeQuery(query1);
            while (departInfo.next()){
                departmentList.add(new Department(departInfo.getInt(1), departInfo.getString(2)));
            }

            //Q2-P2: Tạo method để lấy ra Department có id = 5
            String query2 = "SELECT * FROM Department WHERE DepartmentID = 5";

            connection.close();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return  departmentList;
    }

    public static void getID5(){
        String dbUrl = "jdbc:mysql://localhost/Testing_System_Assignment3";
        String username = "root";
        String password = "Meo_biet_bay_2020";
        List<Department> departmentList = new ArrayList<>();
        try {
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connect success!");

            //Q2-P2: Tạo method để lấy ra Department có id = 5
            String query2 = "SELECT * FROM Department WHERE DepartmentID = 5";
            Statement statement2 = connection.createStatement();
            ResultSet getID5 = statement2.executeQuery(query2);
            int count = 0;
            while (getID5.next()){
                if(getID5.getInt("DepartmentID") == 5){
                    System.out.println(getID5.getString("DepartName"));
                    count++;
                    break;
                }
            }
            if(count == 0){
                System.out.println("Cannot find department which has id = 5");
            }

            connection.close();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static int insertID(){
        Scanner sc = new Scanner(System.in);
        int id = sc.nextInt();
        return id;
    }
    public static Department getID5_Scanner(){
        String dbUrl = "jdbc:mysql://localhost/Testing_System_Assignment3";
        String username = "root";
        String password = "Meo_biet_bay_2020";

        int id = insertID();
        Department department = null;
        try {
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connect success!");

            //Q3-P2: Tạo method để lấy ra Department có id = 5
            String query2 = "SELECT * FROM Department WHERE DepartmentID = " + id;
            Statement statement2 = connection.createStatement();
            ResultSet getID5 = statement2.executeQuery(query2);
            int count = 0;
            while (getID5.next()){
                if(getID5.getInt("DepartmentID") == id){
                    department = new Department(getID5.getInt(1), getID5.getString(2));
                    count++;
                    break;
                }
            }
            if(count == 0){
                System.out.println("Cannot find department which has id " + id);
            }

            connection.close();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return department;
    }

    public static boolean isDepartmentNameExists(String name){
        String dbUrl = "jdbc:mysql://localhost/Testing_System_Assignment3";
        String username = "root";
        String password = "Meo_biet_bay_2020";

        try {
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connect success!");

            //Q4-P2: Tạo method để lấy ra Department có id = 5
            String query4 = "SELECT * FROM Department WHERE DepartName = " + "'" + name + "'" ;
            Statement statement2 = connection.createStatement();
            ResultSet nameExists = statement2.executeQuery(query4);

            while (nameExists.next()){
                if(nameExists.getString("DepartName").equals(name)){
                    return true;
                }
            }
            return false;

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void createDepart(String name){
        String dbUrl = "jdbc:mysql://localhost/Testing_System_Assignment3";
        String username = "root";
        String password = "Meo_biet_bay_2020";

        try {
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connect success!");

            if(!isDepartmentNameExists(name)){
                //Q5-P2: Tạo method để người dùng có thể tạo được department
                String query5 = "INSERT INTO Department (DepartName) VALUES (?)";
                PreparedStatement preparedStatement = connection.prepareStatement(query5);
                preparedStatement.setString(1,name);
                int create = preparedStatement.executeUpdate();
                System.out.println("Đã thêm");
            }else {
                System.out.println("Departname này đã tồn tại");
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void updateDepartmentName(int id, String name){
        String dbUrl = "jdbc:mysql://localhost/Testing_System_Assignment3";
        String username = "root";
        String password = "Meo_biet_bay_2020";
        try {
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connect success!");
            if(isDepartmentNameExists(name) == false){
                String update = "UPDATE Department SET DepartName = ? WHERE DepartmentID = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(update);
                preparedStatement.setInt(2,id);
                preparedStatement.setString(1,name);
                int up = preparedStatement.executeUpdate();
                System.out.println("Update thành công");
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void deleteDepartment(int id){
        String dbUrl = "jdbc:mysql://localhost/Testing_System_Assignment3";
        String username = "root";
        String password = "Meo_biet_bay_2020";
        try {
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connect success!");
                String delete = "DELETE FROM Department WHERE DepartmentID = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(delete);
                preparedStatement.setInt(1,id);
                int up = preparedStatement.executeUpdate();
                System.out.println("Update thành công");
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
