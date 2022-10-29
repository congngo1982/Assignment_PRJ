/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.account;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import nguyencongngo.utils.DBhelper;

/**
 *
 * @author Admin
 */
public class AccountDAO implements Serializable {

    public AccountDTO Login(String username, String password) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO user = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT username, password, fullname, isAdmin "
                        + "FROM dbo.Account "
                        + "WHERE username = ? AND password = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String userName = rs.getString("username");
                    String passwordd = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    user = new AccountDTO(userName, passwordd, fullname, isAdmin);
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
        return user;
    }

    public String getFullName(String username) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String name = "";
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT username, password, fullname, isAdmin "
                        + "FROM dbo.Account "
                        + "WHERE username = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    name = rs.getString("fullname");
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
        return name;
    }
}
