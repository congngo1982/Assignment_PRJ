/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.category;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyencongngo.utils.DBhelper;

/**
 *
 * @author Admin
 */
public class CategoryDAO implements Serializable {

    private List<CategoryDTO> category;

    public CategoryDAO() {
    }

    public List<CategoryDTO> getCategory() {
        return category;
    }

    public void setCategory(List<CategoryDTO> category) {
        this.category = category;
    }

    private List<String> categoryItem;

    public List<String> getCategoryItem() {
        return categoryItem;
    }

    public void setCategoryItem(List<String> categoryItem) {
        this.categoryItem = categoryItem;
    }

    public List<String> getType() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            String sql = "SELECT id, type "
                    + "FROM dbo.Category";
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String type = rs.getString("type");
                if (this.categoryItem == null) {
                    this.categoryItem = new ArrayList<>();
                }
                this.categoryItem.add(type);
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
        return this.categoryItem;
    }

}
