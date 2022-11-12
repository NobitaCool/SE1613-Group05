/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import com.ebutler.swp.dao.AdminDAO;
import com.ebutler.swp.dto.AdminDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AddAdminController extends HttpServlet {

    private final String HOME = "AdminController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME;
        try {
            AdminDAO admindao = new AdminDAO();
//            AdminDTO admin = new AdminDTO();
            HttpSession session = request.getSession();
            List<AdminDTO> listAdmin = new ArrayList();
            AdminDTO admin = (AdminDTO) session.getAttribute("Admin_Login");
            listAdmin = admindao.getAllAdmin();
            if (listAdmin != null) {
                session.setAttribute("Admin_List", listAdmin);
            }

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role_ID = request.getParameter("role_ID");
            int status = 1;
            if ("ADMIN REVENUE".equals(role_ID)) {
                admin = new AdminDTO(username, password, "RE", status);
                request.setAttribute("roleName", "ADMIN REVENUE");
            } else if ("ADMIN USER".equals(role_ID)) {
                admin = new AdminDTO(username, password, "US", status);
                request.setAttribute("roleName", "ADMIN USER");
            }
            if (username.contains(" ") || username.isEmpty() || password.contains(" ") || password.isEmpty()) {
                request.setAttribute("Message", "Username/Password cannot contain blank");
            } else if (admindao.isExisted(username)) {
                request.setAttribute("Message", "Username is in use");
            } else if (role_ID.equals("")) {
                request.setAttribute("Message", "Please choose your role");
                // no error
            } else {
                admindao.AddAdmin(admin);

            }

        } catch (Exception e) {
            log("ERROR at AddAdminController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
