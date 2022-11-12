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
public class AdminController extends HttpServlet {

    private final String HOME = "admin_listPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME;
        String action = request.getParameter("action");
        try {

            AdminDAO admindao = new AdminDAO();
//            AdminDTO admin = new AdminDTO();
            HttpSession session = request.getSession();
            List<AdminDTO> listAdmin = new ArrayList();
            AdminDTO admin = (AdminDTO) session.getAttribute("ADMIN_LOGIN");
            listAdmin = admindao.getAllAdmin();
            if (listAdmin != null) {
                session.setAttribute("Admin_List", listAdmin);
            }

            //get param
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role_ID = request.getParameter("role_ID");
            String status1 = (String) request.getParameter("status1");
            // check if admin is User or Revenue
            if ("ADMIN REVENUE".equals(role_ID)) {
                int status = 0;
                admin = new AdminDTO(username, password, "RE", status);
                request.setAttribute("roleName", "ADMIN REVENUE");
            } else if ("ADMIN USER".equals(role_ID)) {
                int status = 0;
                admin = new AdminDTO(username, password, "US", status);
                request.setAttribute("roleName", "ADMIN USER");
            }

            // actions
            if (action.equals("showupdate")) {
                AdminDTO adminInfo = admindao.getAdminByUser(username);
                request.setAttribute("adminInfo", adminInfo);
                url = "admin_editAd.jsp";
            } else if (action.equals("showchangepass")) {
                AdminDTO adminInfo = admindao.getAdminByUser(username);
                request.setAttribute("adminInfo", adminInfo);
                url = "admin_changePass.jsp";
            }

        } catch (Exception e) {
            log("ERROR at AdminController: " + e.toString());
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
