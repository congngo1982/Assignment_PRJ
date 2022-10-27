/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyencongngo.account.AccountDTO;
import nguyencongngo.cart.CartDAO;
import nguyencongngo.utils.MyAppConstraint;

/**
 *
 * @author Admin
 */
public class UpdateCartController extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        AccountDTO user = (AccountDTO) session.getAttribute("USER");
        String url = MyAppConstraint.viewCartController;
        try {
            String courseId = request.getParameter("txtId");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            if (user != null && !user.isIsAdmin()) {
                courseId = request.getParameter("txtId");
                quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                System.out.println("Update: " + quantity);
                if (quantity > 0) {
                    Date date = new Date();
                    CartDAO dao = new CartDAO();
                    if (dao.checkPrimaryKey(user.getUsername(), courseId) > 0) {
                        dao.updateCart(user.getUsername(), courseId, date.toString(), quantity);
                    }
                } else {
                    url = "DeleteCartController?txtUsername=" + user.getUsername() + "&txtId=" + courseId;
                }

            } else if (user == null) {
                HashMap<String, Integer> courseList = (HashMap<String, Integer>) session.getAttribute("CARTNOLOGIN1");
                List<String> course = (List<String>) session.getAttribute("CARTNOLOGIN");
                courseId = request.getParameter("txtId");
                quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                if(quantity > 0){
                    courseList.put(courseId, quantity);
                } else {
                    courseList.remove(courseId);
                    course.remove(courseId);
                }
                
            }
        } catch (SQLException | NamingException ex) {
            System.out.println(ex);
        } finally {
            response.sendRedirect(url);
        }
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
