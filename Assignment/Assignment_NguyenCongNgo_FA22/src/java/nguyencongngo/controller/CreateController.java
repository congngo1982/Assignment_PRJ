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
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyencongngo.account.AccountDTO;
import nguyencongngo.course.CourseDAO;
import nguyencongngo.utils.MakeLifeEasy;
import nguyencongngo.utils.MyAppConstraint;

/**
 *
 * @author Admin
 */
public class CreateController extends HttpServlet {

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
        String category = request.getParameter("txtCategoryProduct");
        String searchValue = request.getParameter("txtSearch");
        String url = MyAppConstraint.showCourse;
        if (session != null) {
            if (user != null && user.isIsAdmin()) {
                String id = request.getParameter("txtId");
                String name = request.getParameter("txtName");
                String img = request.getParameter("txtImage");
                String des = request.getParameter("txtDescription");
                int price = Integer.parseInt(request.getParameter("txtPrice"));
                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                String start = MakeLifeEasy.convertDay(request.getParameter("txtStartDate"));
                String end = MakeLifeEasy.convertDay(request.getParameter("txtEndDate"));
                String cate = request.getParameter("txtCategory");
                boolean status = Boolean.parseBoolean(request.getParameter("txtStatus"));
                try {
                    CourseDAO dao = new CourseDAO();
                    Date date = new Date();
                    int ID = dao.listCourse().size();
                    dao.createCourse(String.valueOf(++ID), name, img, des, price, quantity, start, end, status, cate);
                } catch (SQLException ex) {
                    System.out.println(ex);
                } catch (NamingException ex) {
                    System.out.println(ex);
                }
            }
        }
        response.sendRedirect(MyAppConstraint.SearchPage);
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
