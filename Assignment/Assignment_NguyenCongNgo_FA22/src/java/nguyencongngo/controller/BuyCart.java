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
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyencongngo.account.AccountDTO;
import nguyencongngo.cart.CartDAO;
import nguyencongngo.course.CourseDAO;
import nguyencongngo.shopping.ShoppingDAO;
import nguyencongngo.shopping.ShoppingDTO;
import nguyencongngo.utils.MyAppConstraint;

/**
 *
 * @author Admin
 */
public class BuyCart extends HttpServlet {

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
        try {
//            if(user != null && !user.isIsAdmin()){
//                CartDAO dao = new CartDAO();
//                CourseDAO courseDAO = new CourseDAO();
//                List<String> courseId = dao.getCartByUsername(user.getUsername());
//                for(int i = 0; i< courseId.size(); i++){
//                    String[] course = courseId.get(i).split(";");
//                    String id = course[0];
//                    int quantity = Integer.parseInt(course[1]);
//                    String result[] = courseDAO.getName(id).split(";");
//                    int price = Integer.parseInt(result[4]);
//                    Date date = new Date();
//                    ShoppingDTO dto = new ShoppingDTO(user.getUsername(), id, date.toString(), quantity, price);
//                    ShoppingDAO shopping = new ShoppingDAO();
//                    shopping.checkOut(dto);
//                }
            String courseId = request.getParameter("txtId");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            int price = Integer.parseInt(request.getParameter("txtPricee"));
            Date date = new Date();
            ShoppingDTO dto = new ShoppingDTO(user.getUsername(), courseId, date.toString(), quantity, price);
            ShoppingDAO shopping = new ShoppingDAO();
            shopping.checkOut(dto);
        } catch (SQLException | NamingException ex) {

        } finally {
            response.sendRedirect(MyAppConstraint.viewCartController);
            out.close();
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
