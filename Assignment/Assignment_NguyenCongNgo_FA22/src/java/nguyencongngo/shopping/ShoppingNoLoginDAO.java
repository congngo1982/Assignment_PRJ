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
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import nguyencongngo.course.CourseDAO;
import nguyencongngo.utils.DBhelper;

/**
 *
 * @author Admin
 */
public class ShoppingNoLoginDAO implements Serializable {

    private List<ShoppingNoLoginDTO> shopping;

    public List<ShoppingNoLoginDTO> getShopping() {
        return shopping;
    }

    public void setShopping(List<ShoppingNoLoginDTO> shopping) {
        this.shopping = shopping;
    }

    public boolean buyingCart(ShoppingNoLoginDTO dto) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        int check = 0;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                CourseDAO courseDAO = new CourseDAO();
                int courseQuantity = courseDAO.getQuantity(dto.getCourseId());
                if (dto.getQuantity() <= courseQuantity) {
                    courseDAO.updateQuantity(dto.getCourseId(), courseQuantity - dto.getQuantity());
                    Date date = new Date();
                    String sql = "INSERT INTO dbo.ShoppingNoLogin (email, courseId, quantity, price, date, address, phone, discount, name) "
                            + "VALUES (?, ?, ?, ?, ?, ? ,?, ?, ?)";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, dto.getUsername());
                    stm.setString(2, dto.getCourseId());
                    stm.setInt(3, dto.getQuantity());
                    stm.setInt(4, dto.getPrice());
                    stm.setString(5, date.toString());
                    stm.setString(6, dto.getAddress());
                    stm.setString(7, dto.getPhone());
                    stm.setString(8, dto.getDiscount());
                    stm.setString(9, dto.getFullname());
                    check = stm.executeUpdate();
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check > 0;
    }

    public List<ShoppingNoLoginDTO> getList(String email) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT email, courseId, quantity, price, date, address, phone, discount, name "
                        + "FROM dbo.ShoppingNoLogin "
                        + "WHERE email = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                while (rs.next()) {
                    ShoppingNoLoginDTO dto = new ShoppingNoLoginDTO(email, rs.getString("name"), rs.getString("courseId"), (new CourseDAO()).getName(rs.getString("courseId")).split(";")[1],
                            rs.getString("date"), rs.getInt("quantity"), rs.getInt("price"), rs.getString("address"), rs.getString("phone"), rs.getString("discount"));
                    if (this.shopping == null) {
                        this.shopping = new ArrayList<>();
                    }
                    this.shopping.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();;
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

}
