/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.course;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CourseDTO implements Serializable {

    private String id;
    private String name;
    private String image;
    private String description;
    private int price;
    int quantity;
    private String startDate;
    private String endDate;
    private String category;
    private boolean status;

    public CourseDTO(String name, String image, String description, int price, int quantity, String startDate, String endDate, String category, boolean status) {
        this.name = name;
        this.image = image;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.startDate = startDate;
        this.endDate = endDate;
        this.category = category;
        this.status = status;
    }

    public CourseDTO(String id, String name, String image, String description, int price, int quantity, String startDate, String endDate, String category, boolean status) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.startDate = startDate;
        this.endDate = endDate;
        this.category = category;
        this.status = status;
    }

    public CourseDTO(String id, String name, String image, String description, int price, int quantity) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
    }

    public CourseDTO(String id, String name, String image, String description, int price) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.price = price;
    }

    public CourseDTO() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CourseDTO{" + "id=" + id + ", name=" + name + ", image=" + image + ", description=" + description + ", price=" + price + ", quantity=" + quantity + ", startDate=" + startDate + ", endDate=" + endDate + ", category=" + category + ", status=" + status + '}';
    }

}
