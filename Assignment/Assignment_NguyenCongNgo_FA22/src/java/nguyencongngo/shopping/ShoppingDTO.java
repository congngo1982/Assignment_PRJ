/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.shopping;

/**
 *
 * @author Admin
 */
public class ShoppingDTO {

    private String username;
    private String fullname;
    private String courseId;
    private String courseName;
    private String date;
    private int quantity;
    private int price;

    public ShoppingDTO() {
    }

    public ShoppingDTO(String username, String fullname, String courseId, String courseName, String date, int quantity, int price) {
        this.username = username;
        this.fullname = fullname;
        this.courseId = courseId;
        this.courseName = courseName;
        this.date = date;
        this.quantity = quantity;
        this.price = price;
    }

    public ShoppingDTO(String username, String courseId, String date, int quantity, int price) {
        this.username = username;
        this.courseId = courseId;
        this.date = date;
        this.quantity = quantity;
        this.price = price;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ShoppingDTO{" + "username=" + username + ", fullname=" + fullname + ", courseId=" + courseId + ", courseName=" + courseName + ", date=" + date + ", quantity=" + quantity + ", price=" + price + '}';
    }

}
