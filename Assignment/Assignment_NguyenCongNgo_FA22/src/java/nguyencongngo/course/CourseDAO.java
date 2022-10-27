/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.course;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import nguyencongngo.utils.DBhelper;

/**
 *
 * @author Admin
 */
public class CourseDAO implements Serializable {

    private List<CourseDTO> course;
    private List<String> categories;

    public CourseDAO() {
    }

    public CourseDAO(List<CourseDTO> course) {
        this.course = course;
    }

    public List<CourseDTO> getCourse() {
        return course;
    }

    public void setCourse(List<CourseDTO> course) {
        this.course = course;
    }

    public List<CourseDTO> findCourseByName(String name) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT id, name, image, description, price, quantity, startDate, endDate, category, status "
                        + "FROM dbo.Course "
                        + "WHERE name LIKE ? AND status = 1 AND quantity > 0 ";
//                        + "ORDER BY quantity"
//                        + "OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");
//                stm.setInt(2, (pageNumber - 1 * 20));
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String namee = rs.getString("name");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String startDate = rs.getString("startDate");
                    String endDate = rs.getString("endDate");
                    String category = rs.getString("category");
                    boolean status = rs.getBoolean("status");
                    CourseDTO dto = new CourseDTO(id, namee, image, description, price, quantity, startDate, endDate, category, status);
                    if (this.course == null) {
                        this.course = new ArrayList<>();
                    }
                    this.course.add(dto);
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
        return this.course;
    }

    public String getName(String id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String name = "";
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT id, name, image, description, price, quantity, startDate, endDate, category, status "
                        + "FROM dbo.Course "
                        + "WHERE id = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    name = rs.getString("id") + ";" + rs.getString("name") + ";" + rs.getString("image") + ";" + rs.getString("description") + ";" + rs.getInt("price") + ";" + rs.getInt("quantity");
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

    public List<CourseDTO> findCourseByCategory(String name, String category) throws SQLException, NamingException {
        List<CourseDTO> course = null;
        if (this.findCourseByName(name) != null) {
            int length = this.course.size();
            course = new ArrayList<>();
            for (int i = 0; i < length; i++) {
                if (this.course.get(i).getCategory().equals(category)) {
                    course.add(this.course.get(i));
                }
            }
        }
        if (course.isEmpty()) {
            course = null;
        }
        return course;
    }

    public List<CourseDTO> listCourse() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT id, name, image, description, price, quantity, startDate, endDate, category, status "
                        + "FROM dbo.Course ";
                stm = conn.prepareStatement(sql);
//                stm.setInt(2, (pageNumber - 1 * 20));
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String namee = rs.getString("name");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String startDate = rs.getString("startDate");
                    String endDate = rs.getString("endDate");
                    String category = rs.getString("category");
                    boolean status = rs.getBoolean("status");
                    CourseDTO dto = new CourseDTO(id, namee, image, description, price, quantity, startDate, endDate, category, status);
                    if (this.course == null) {
                        this.course = new ArrayList<>();
                    }
                    this.course.add(dto);
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
        return this.course;
    }

    public void updateCourse(String user, String id, String name, String img, String des, int price, int quantity, String start, String end, String cate, boolean status, String date) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        int success = 0;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "UPDATE dbo.Course "
                        + "SET id = ?, name = ?, image = ?, description = ?, price = ?, quantity = ?, startDate = ?, endDate = ?, category = ?, status = ? "
                        + "WHERE name = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                stm.setString(2, name);
                stm.setString(3, img);
                stm.setString(4, des);
                stm.setInt(5, price);
                stm.setInt(6, quantity);
                stm.setString(7, start);
                stm.setString(8, end);
                stm.setString(9, cate);
                stm.setBoolean(10, status);
                stm.setString(11, name);
                success = stm.executeUpdate();
                if (success > 0) {
                    sql = "SELECT updateUser, courseId "
                            + "FROM dbo.History "
                            + "WHERE updateUser = ? AND courseId = ? ";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, user);
                    stm.setString(2, id);
                    rs = stm.executeQuery();
                    if (rs.next()) {
                        sql = "UPDATE dbo.History "
                                + "SET updateDate = ? "
                                + "Where updateUser = ? AND courseId = ? ";
                        stm = conn.prepareStatement(sql);
                        stm.setString(1, date);
                        stm.setString(2, user);
                        stm.setString(3, id);
                        stm.executeUpdate();
                    } else {
                        sql = "INSERT INTO dbo.History (updateUser, updateDate, courseId) "
                                + "VALUES (?, ?, ?) ";
                        stm = conn.prepareStatement(sql);
                        stm.setString(1, user);
                        stm.setString(2, date);
                        stm.setString(3, id);
                        stm.executeUpdate();
                    }
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
    }

    public void createCourse(String id, String name, String img, String des, int price, int quantity, String start, String end, boolean status, String cate) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        int success = 0;
//        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO dbo.Course (id, name, image, description, price, quantity, startDate, endDate, status, category) "
                        + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                stm.setString(2, name);
                stm.setString(3, img);
                stm.setString(4, des);
                stm.setInt(5, price);
                stm.setInt(6, quantity);
                stm.setString(7, start);
                stm.setString(8, end);
                stm.setBoolean(9, status);
                stm.setString(10, cate);
                success = stm.executeUpdate();
            }
        } finally {
//            if (rs != null) {
//                rs.close();
//            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date.toString());
    }

}
