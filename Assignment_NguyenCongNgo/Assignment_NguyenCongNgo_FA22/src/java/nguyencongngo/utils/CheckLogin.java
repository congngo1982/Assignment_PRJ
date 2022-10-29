/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.utils;

import java.util.HashMap;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CheckLogin {

    private HashMap<String, Boolean> prop;

    public CheckLogin() {
        this.prop = new HashMap<>();
        this.prop.put("DistpatchController", false);
        this.prop.put("StartAppController", false);
        this.prop.put("DeleteController", true);
        this.prop.put("LoginController", false);
        this.prop.put("LogoutController", true);
        this.prop.put("SearchController", true);
        this.prop.put("UpdateController", true);
    }

    public void addProp(String key, boolean check) {
        this.prop.put("DistpatchController", false);
        this.prop.put("StartAppController", false);
        this.prop.put("DeleteController", true);
        this.prop.put("LoginController", false);
        this.prop.put("LogoutController", true);
        this.prop.put("SearchController", true);
        this.prop.put("UpdateController", true);
    }

    public boolean checkProp(String key) {
        return this.prop.get(key);
    }

    public String checkLogin(HttpSession session, String url) {
        if (session == null) {
            if (this.checkProp(url)) {
                return "login.html";
            } else {
                return url;
            }
        }
        return url;
    }
}
