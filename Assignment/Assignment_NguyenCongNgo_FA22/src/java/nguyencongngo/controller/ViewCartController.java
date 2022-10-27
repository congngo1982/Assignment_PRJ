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
import nguyencongngo.cart.CartDTO;
import nguyencongngo.cart.ViewCartDTO;
import nguyencongngo.course.CourseDAO;
import nguyencongngo.course.CourseDTO;
import nguyencongngo.utils.MyAppConstraint;

/**
 *
 * @author Admin
 */
public class ViewCartController extends HttpServlet {

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
        AccountDTO account = (AccountDTO) session.getAttribute("USER");
        String url = MyAppConstraint.cartPage;
        try {
            if (account != null && !account.isIsAdmin()) {
                CartDAO dao = new CartDAO();
                List<CartDTO> dto = dao.viewCart(account.getUsername());
                if (dto != null) {
                    int total = 0;
                    List<CourseDTO> cart = new ArrayList<>();
                    int size = dto.size();
//                    List<CourseDTO> course = new ArrayList<>();
                    CourseDAO courseDao = new CourseDAO();
                    for (int i = 0; i < size; i++) {
                        String result[] = courseDao.getName(dto.get(i).getCourseId()).split(";");
                        String id = result[0];
                        String name = result[1];
                        String des = result[3];
//                        System.out.println("Result 2: " + result[2]);
                        int quantity = dto.get(i).getQuantity();
//                        System.out.println("Quantity:" + quantity);
                        int price = Integer.parseInt(result[4]);
                        String image = result[2];
                        CourseDTO view = new CourseDTO(id, name, image, des, price, quantity);
                        cart.add(view);
                        total += price * quantity;
//                        System.out.println(view);
                    }
                    request.setAttribute("CART", cart);
                    request.setAttribute("TOTAL", total);
                }

            } else if (account == null) {
                List<String> course = (List<String>) session.getAttribute("CARTNOLOGIN");
                HashMap<String, Integer> courseList = (HashMap<String, Integer>) session.getAttribute("CARTNOLOGIN1");
                CourseDAO courseDao = new CourseDAO();
                List<CourseDTO> cart = new ArrayList<>();
                int total = 0;
                if (course != null) {
                    for (int i = 0; i < course.size(); i++) {
                        String result[] = courseDao.getName(course.get(i)).split(";");
                        String id = result[0];
                        String name = result[1];
                        String des = result[3];
//                        System.out.println("Result 2: " + result[2]);
                        int quantity = courseList.get(id);
//                        System.out.println("Quantity:" + quantity);
                        int price = Integer.parseInt(result[4]);
                        String image = result[2];
                        CourseDTO view = new CourseDTO(id, name, image, des, price, quantity);
                        cart.add(view);
                        total += price * quantity;
                        request.setAttribute("CART", cart);
                        request.setAttribute("TOTAL", total);
                    }
                }
            }
        } catch (SQLException | NamingException ex) {
            System.out.println(ex);
        } finally {
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
