/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyencongngo.account.AccountDTO;
import nguyencongngo.course.CourseDAO;
import nguyencongngo.course.CourseDTO;
import nguyencongngo.utils.MyAppConstraint;

/**
 *
 * @author Admin
 */
public class ShowCourse extends HttpServlet {

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
        String url = MyAppConstraint.loginFailPage;
        try {
            if (user != null) {
                if (!user.isIsAdmin()) {
                    url = MyAppConstraint.SearchPage;
                    request.setAttribute("ERROR", "You are not Admin");
                } else {
                    CourseDAO dao = new CourseDAO();
                    List<CourseDTO> dto = dao.listCourse();
                    request.setAttribute("LISTCOURSE", dto);
                    for (int i = 0; i < dto.size(); i++) {
                        System.out.println(dto.get(i));
                    }
                    url = MyAppConstraint.updatePage;
                    if (dto != null) {
                        int length = dto.size();
                        int paging = length / 20;
                        if (length % 20 > 0) {
                            ++paging;
                        }
                        request.setAttribute("PAGING", paging);
                        request.setAttribute("LENGTH", length);
                    }
                }
            } else {
                request.setAttribute("ERROR", "You must Login to Update");
            }
        } catch (SQLException ex) {
        } catch (NamingException ex) {
        } finally {
            System.out.println(url);
            if (user != null) {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                response.sendRedirect(url);
            }
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
