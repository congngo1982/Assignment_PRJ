/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.cart;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CartDTO implements Serializable {

    private String username;
    private String courseId;
    private String date;
    private int quantity;

    public CartDTO() {
    }

    public CartDTO(String username, String courseId, String date, int quantity) {
        this.username = username;
        this.courseId = courseId;
        this.date = date;
        this.quantity = quantity;
    }

    public CartDTO(String courseId, String date, int quantity) {
        this.courseId = courseId;
        this.date = date;
        this.quantity = quantity;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
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

}
