package entity;

public class Department {
    private int DepartmentID;
    private String DepartName;
    public Department(){};
    public Department(int departmentID, String departName) {
        DepartmentID = departmentID;
        DepartName = departName;
    }

    public int getDepartmentID() {
        return DepartmentID;
    }

    public void setDepartmentID(int departmentID) {
        DepartmentID = departmentID;
    }

    public String getDepartName() {
        return DepartName;
    }

    public void setDepartName(String departName) {
        DepartName = departName;
    }
}
