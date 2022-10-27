/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyencongngo.account.AccountDTO;
import nguyencongngo.cart.CartDAO;
import nguyencongngo.cart.CartDTO;
import nguyencongngo.course.CourseDTO;

/**
 *
 * @author Admin
 */
public class AddToCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("txtUsername");
        String courseId = request.getParameter("txtId");
        String txtSearch = request.getParameter("txtSearch");
        String txtCategory = request.getParameter("txtCategory");
        Date date = new Date();
        String url = "SearchController?txtSearch=" + txtSearch + "&txtCategory=" + txtCategory;
        HttpSession session = request.getSession(true);
        AccountDTO user = (AccountDTO) session.getAttribute("USER");
        if (user != null) {
            try {
                CartDAO dao = new CartDAO();
                System.out.println("Quantity: " + dao.checkPrimaryKey(username, courseId));
                if (dao.checkPrimaryKey(username, courseId) > 0) {
                    dao.updateCart(username, courseId, date.toString(), dao.checkPrimaryKey(username, courseId) + 1);
                } else {
                    dao.addToCart(username, courseId, date.toString(), 1);
                }
            } catch (SQLException ex) {
                System.out.println(ex);
            } catch (NamingException ex) {
                System.out.println(ex);
            }
        } else {
            //Code for not Login
            List<String> course = (List<String>) session.getAttribute("CARTNOLOGIN");
            HashMap<String, Integer> courseList = (HashMap<String, Integer>) session.getAttribute("CARTNOLOGIN1");
            if (course == null) {
                course = new ArrayList<>();
            }
            if (courseList == null) {
                courseList = new HashMap<>();
            }
            if (!course.contains(courseId)) {
                course.add(courseId);
                courseList.put(courseId, 1);
                session.setAttribute("CARTNOLOGIN", course);
                session.setAttribute("CARTNOLOGIN1", courseList);
            } else {
                courseList.put(courseId, courseList.get(courseId) + 1);
            }
            System.out.println("ahihi: " + courseList.get(courseId));
            for (int i = 0; i < course.size(); i++) {
                System.out.println(course.get(i));
            }
        }
        response.sendRedirect(url);
        out.close();

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
