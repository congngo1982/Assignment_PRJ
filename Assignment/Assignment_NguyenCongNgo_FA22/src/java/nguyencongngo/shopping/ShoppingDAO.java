/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.shopping;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyencongngo.account.AccountDAO;
import nguyencongngo.cart.CartDAO;
import nguyencongngo.course.CourseDAO;
import nguyencongngo.utils.DBhelper;

/**
 *
 * @author Admin
 */
public class ShoppingDAO implements Serializable {

    private List<ShoppingDTO> shopping;

    public List<ShoppingDTO> getListShopping(String userName) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "Select username, courseId, quantity, price, date "
                        + "FROM dbo.Shopping "
                        + "WHERE username = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userName);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String courseId = rs.getString("courseId");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    String date = rs.getString("date");
                    String fullname = (new AccountDAO()).getFullName(username);
                    String courseName = (new CourseDAO().getName(courseId)).split(";")[1];
                    ShoppingDTO dto = new ShoppingDTO(username, fullname, courseId, courseName, date, quantity, price);
                    if (this.shopping == null) {
                        this.shopping = new ArrayList<>();
                    }
                    this.shopping.add(dto);
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
        return this.shopping;
    }

    public void checkOut(ShoppingDTO dto) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO dbo.Shopping (username, courseId, quantity, price, date) "
                        + "VALUES(?, ?, ?, ?, ?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getCourseId());
                stm.setInt(3, dto.getQuantity());
                stm.setInt(4, dto.getPrice());
                stm.setString(5, dto.getDate());
                stm.executeUpdate();
                CartDAO dao = new CartDAO();
                dao.deleteCart(dto.getUsername(), dto.getCourseId());
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

}
