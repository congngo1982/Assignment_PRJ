/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.UpdateHistory;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyencongngo.account.AccountDAO;
import nguyencongngo.course.CourseDAO;
import nguyencongngo.utils.DBhelper;

/**
 *
 * @author Admin
 */
public class UpdateDAO implements Serializable {

    private List<UpdateDTO> updateHistory;

    public UpdateDAO() {
    }

    public List<UpdateDTO> getUpdateHistory() {
        return updateHistory;
    }

    public void setUpdateHistory(List<UpdateDTO> updateHistory) {
        this.updateHistory = updateHistory;
    }

    public List<UpdateDTO> getListUpdate() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBhelper.makeConnection();
            if (conn != null) {
                String sql = "Select updateUser, updateDate, courseId "
                        + "FROM dbo.History";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("updateUser");
                    String updateDate = rs.getString("updateDate");
                    String courseId = rs.getString("courseId");
                    UpdateDTO dto = new UpdateDTO(username, updateDate, courseId);
                    CourseDAO courseDao = new CourseDAO();
                    String courseName[] = courseDao.getName(courseId).split(";");
                    dto.setCourseName(courseName[1]);
                    dto.setFullname((new AccountDAO()).getFullName(username));
                    if(this.updateHistory == null){
                        this.updateHistory = new ArrayList<>();
                    }
                    this.updateHistory.add(dto);
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
        return this.updateHistory;
    }
}
