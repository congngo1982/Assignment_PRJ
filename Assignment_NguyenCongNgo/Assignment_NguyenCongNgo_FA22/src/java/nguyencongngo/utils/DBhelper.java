/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
public class DBhelper implements Serializable {

    public static Connection makeConnection() throws SQLException, NamingException{
        Connection con = null;
        Context currentContext = new InitialContext();
        Context tomcatContext = (Context) currentContext.lookup("java:comp/env");
        DataSource dataSource = (DataSource) tomcatContext.lookup("ngoConnection");
        con = dataSource.getConnection();
        return con;
    }
    
    public static Connection makeConnection1() throws SQLException, NamingException, ClassNotFoundException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String sql = "jdbc:sqlserver://localhost:1433;databaseName=NguyenCongNgo_FA22";
        Connection con = DriverManager.getConnection(sql, "sa", "12345");
        return con;
    }
    
}
