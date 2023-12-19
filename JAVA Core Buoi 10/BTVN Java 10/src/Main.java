import entity.Department;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static back_end.DepartmentDao.*;
import static front_end.Program1.doProgram1;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //Exercise 1
//        doProgram1();

        //Exercise 2
        //Q1
//        for (Department department : getDepartment()){
//            System.out.println(department.getDepartmentID());
//            System.out.println(department.getDepartName());
//        }
        //Q2
//        getID5();

        //Q3: Không fix cứng id nữa mà sẽ dùng scanner để yêu cầu người dùng
        //nhập vào id, sau đó trả về thông tin department có id như người dùng
        //nhập vào
//        getID5_Scanner();
//        System.out.println(getID5_Scanner().getDepartmentID());
//        System.out.println(getID5_Scanner().getDepartName());

        //Q4: Tạo method để check department name có tồn tại hay không?
//        if(isDepartmentNameExists("Phó giám đốc")){
//            System.out.println("Position exists");
//        }else {
//            System.out.println("Position is not exists");
//        }

        //Q5: Tạo method để người dùng có thể tạo được department
//        createDepart("Lmao");

        //Q6: Tạo method để người dùng có thể update được department name
//        updateDepartmentName(2, "Lmao3");

        //Q7: Tạo method để người dùng có thể xóa được department theo id mà user
        //nhập vào
        deleteDepartment(3);

        //Q8: Làm tương tự với Table Account

        //Exercise 3 và 4 (Optional)
    }
}