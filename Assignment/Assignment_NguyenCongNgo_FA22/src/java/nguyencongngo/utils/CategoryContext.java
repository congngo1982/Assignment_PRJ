/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import nguyencongngo.category.CategoryDAO;

/**
 *
 * @author Admin
 */
public class CategoryContext {

    public static void getCategory(ServletContext context) throws IOException {
        InputStream is = null;
        try {
            CategoryDAO dao = new CategoryDAO();
            List<String> category = dao.getType();
            category.add("All");
            context.setAttribute("CATEGORY", category);
        } catch (SQLException ex) {
        } catch (NamingException ex) {
        } finally {
            if (is != null) {
                is.close();
            }
        }
    }
}
