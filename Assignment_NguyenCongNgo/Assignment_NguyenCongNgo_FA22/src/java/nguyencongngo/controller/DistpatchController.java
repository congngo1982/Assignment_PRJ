/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyencongngo.utils.MyAppConstraint;

/**
 *
 * @author Admin
 */
public class DistpatchController extends HttpServlet {

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
        String action = request.getParameter("btAction");
        PrintWriter out = response.getWriter();
        String url = MyAppConstraint.errorPage;
        try {
            if (action == null) {
                url = MyAppConstraint.startApp;
            } else if (action.equals("Login")) {
                url = MyAppConstraint.loginAction;
            } else if (action.equals("LogOut")) {
                url = MyAppConstraint.logoutAction;
            } else if (action.equals("Search")) {
                url = MyAppConstraint.SearchAction;
            } else if (action.equals("Update")) {
                url = MyAppConstraint.updateAction;
            } else if (action.equals("Create")) {
                url = MyAppConstraint.createAction;
            } else if (action.equals("UpdateCart")) {
                url = MyAppConstraint.updateCartController;
            } else if(action.equals("Checkout")){
                url = MyAppConstraint.buyCart;
            } else if(action.equals("View Shopping Bill")){
                url = MyAppConstraint.viewShopping;
            }
        } finally {
            System.out.println("Action: " + url);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
