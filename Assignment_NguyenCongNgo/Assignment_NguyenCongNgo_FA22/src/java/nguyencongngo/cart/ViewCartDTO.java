/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.cart;

/**
 *
 * @author Admin
 */
public class ViewCartDTO {

    private String name;
    private int quantity;
    private int price;
    private String describe;

    public ViewCartDTO() {
    }

    public ViewCartDTO(String name, int quantity, int price, String describe) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.describe = describe;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    @Override
    public String toString() {
        return "ViewCartDTO{" + "name=" + name + ", quantity=" + quantity + ", price=" + price + ", describe=" + describe + '}';
    }

}
