/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.utils;

/**
 *
 * @author Admin
 */
public class Errors {

    private String usernameIsExisted;
    private String outOfLengthUsername;
    private String outOfLengthFullName;
    private String numberFormatError;
    private String outLengthPassword;
    private String confirmPasswordError;

    public Errors() {
    }

    public Errors(String usernameIsExisted, String outOfLengthUsername, String outOfLengthFullName, String numberFormatError, String outLengthPassword, String confirmPasswordError) {
        this.usernameIsExisted = usernameIsExisted;
        this.outOfLengthUsername = outOfLengthUsername;
        this.outOfLengthFullName = outOfLengthFullName;
        this.numberFormatError = numberFormatError;
        this.outLengthPassword = outLengthPassword;
        this.confirmPasswordError = confirmPasswordError;
    }

    public String getConfirmPasswordError() {
        return confirmPasswordError;
    }

    public void setConfirmPasswordError(String confirmPasswordError) {
        this.confirmPasswordError = confirmPasswordError;
    }

    public String getUsernameIsExisted() {
        return usernameIsExisted;
    }

    public void setUsernameIsExisted(String usernameIsExisted) {
        this.usernameIsExisted = usernameIsExisted;
    }

    public String getOutOfLengthUsername() {
        return outOfLengthUsername;
    }

    public void setOutOfLengthUsername(String outOfLengthUsername) {
        this.outOfLengthUsername = outOfLengthUsername;
    }

    public String getOutOfLengthFullName() {
        return outOfLengthFullName;
    }

    public void setOutOfLengthFullName(String outOfLengthFullName) {
        this.outOfLengthFullName = outOfLengthFullName;
    }

    public String getNumberFormatError() {
        return numberFormatError;
    }

    public void setNumberFormatError(String numberFormatError) {
        this.numberFormatError = numberFormatError;
    }

    public String getOutLengthPassword() {
        return outLengthPassword;
    }

    public void setOutLengthPassword(String outLengthPassword) {
        this.outLengthPassword = outLengthPassword;
    }

}
