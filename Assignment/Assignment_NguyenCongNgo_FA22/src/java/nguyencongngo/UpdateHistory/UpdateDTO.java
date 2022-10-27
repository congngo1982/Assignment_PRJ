/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.UpdateHistory;

/**
 *
 * @author Admin
 */
public class UpdateDTO {

    private String username;
    private String updateDate;
    private String courseId;
    private String courseName;
    private String fullname;

    public UpdateDTO() {
    }

    public UpdateDTO(String username, String updateDate, String courseId) {
        this.username = username;
        this.updateDate = updateDate;
        this.courseId = courseId;
    }

    public UpdateDTO(String username, String updateDate, String courseId, String courseName, String fullname) {
        this.username = username;
        this.updateDate = updateDate;
        this.courseId = courseId;
        this.courseName = courseName;
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Override
    public String toString() {
        return "UpdateDTO{" + "username=" + username + ", updateDate=" + updateDate + ", courseId=" + courseId + ", courseName=" + courseName + ", fullname=" + fullname + '}';
    }

}
