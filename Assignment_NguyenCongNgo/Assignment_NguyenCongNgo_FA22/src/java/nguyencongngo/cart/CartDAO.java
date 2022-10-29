/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.cart;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyencongngo.course.CourseDTO;
import nguyencongngo.utils.DBhelper;

/**
 *
 * @author Admin
 */
public class CartDAO implements Serializable {

    private List<CartDTO> cart;

    public List<CartDTO> getCart() {
        return cart;
    }

    public void setCart(List<CartDTO> cart) {
        this.cart = cart;
    }

    public CartDAO() {
    }

    public void addToCart(String username, String courseId, String date, int quantity) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO dbo.Cart (username, courseId, quantity, date) "
                        + "VALUES(?, ?, ?, ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, courseId);
                stm.setInt(3, quantity);
                stm.setString(4, date);
                stm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<CartDTO> viewCart(String username) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT username, courseId, quantity, date "
                        + "FROM dbo.Cart "
                        + "WHERE username = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String courseId = rs.getString("courseId");
                    int quantity = rs.getInt("quantity");
                    String date = rs.getString("date");
                    CartDTO dto = new CartDTO(username, courseId, date, quantity);
                    if (this.cart == null) {
                        this.cart = new ArrayList<>();
                    }
                    this.cart.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return this.cart;
    }

    public void updateCart(String username, String courseId, String date, int quantity) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "UPDATE dbo.Cart "
                        + "SET quantity = ?, date = ? "
                        + "WHERE username = ? AND courseId = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, quantity);
                stm.setString(2, date);
                stm.setString(3, username);
                stm.setString(4, courseId);
                stm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void deleteCart(String username, String courseId) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM dbo.Cart "
                        + "WHERE username = ? AND courseId = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, courseId);
                stm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public int checkPrimaryKey(String username, String courseId) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int quantity = 0;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT username, courseId, quantity "
                        + "FROM dbo.Cart "
                        + "WHERE username = ? AND courseId = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, courseId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }

    public List<String> getCartByUsername(String username) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<String> cart = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT username, courseId, quantity, date "
                        + "FROM dbo.Cart "
                        + "WHERE username = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String courseId = rs.getString("courseId");
                    int quantity = rs.getInt("quantity");
                    String name = courseId + ";" + quantity;
                    cart = new ArrayList<>();
                    cart.add(name);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return cart;
    }

}
