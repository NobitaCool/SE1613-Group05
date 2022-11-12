/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import com.ebutler.swp.dao.AdminDAO;
import com.ebutler.swp.dto.AdminDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AdminChangePassword extends HttpServlet {

    private final String ERROR = "admin_changePass.jsp";
    private final String SUCCESS = "admin_changePass.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean check = false;
//            String username = request.getParameter("userP") ; 
            String userChange = request.getParameter("userP");
            String oldPassword = request.getParameter("OldPassword");
            String newPassword = request.getParameter("NewPassword");
            String confirmPassword = request.getParameter("ConfirmPassword");
            HttpSession session = request.getSession();
            AdminDAO adminDAO = new AdminDAO();
            
            AdminDTO admin = new AdminDTO();
            String currentPasswordDAO = adminDAO.getCurrentCustomerPassword(userChange);

            if (confirmPassword.equals(newPassword)) {

                if (currentPasswordDAO.equals(oldPassword)) {
                    check = adminDAO.changePassword(userChange, newPassword);
                    if (check) {
                        url = SUCCESS;
                        admin = adminDAO.getAdmin(admin.getUsername(), newPassword);
                        session.setAttribute("Admin_Login", admin);
                        request.setAttribute("MESSAGE1", "Successfully!!");

                    }
                } else {
                    request.setAttribute("MESSAGE", "Please try again your old password");
                }
            } else {
                request.setAttribute("MESSAGE", "Your passwords are not correct");
            }

        } catch (Exception e) {
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
