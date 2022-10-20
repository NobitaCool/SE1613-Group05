/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import com.ebutler.swp.dao.ProviderDAO;
import com.ebutler.swp.dao.UserDAO;
import com.ebutler.swp.dto.ProductDetailDTO;
import com.ebutler.swp.dto.ProviderDTO;
import com.ebutler.swp.dto.ProviderServiceDTO1;
import com.ebutler.swp.dto.UserDTO;
import java.io.IOException;
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
public class LoginController extends HttpServlet {

    private final String ERROR = "errorPage.jsp";
    private final String CUS_ROLE = "CUS";
    private final String CUS_PAGE = "LoadingProductAndServiceCategory";
    private final String PRO_ROLE = "PRO";
    private final String PRO_PAGE = "Provider_ProductController";
    private final String NOT_PASS = "guest_loginPage.jsp";
    private final String PRO_PAGE_PRODUCT = "Provider_ProductController";
    private final String PRO_PAGE_SERVICE = "Provider_ServiceController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = NOT_PASS;
        try {
            boolean isLogin = Boolean.parseBoolean(request.getParameter("isLogin"));

            if (!isLogin) {
                return;
            }

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            UserDAO userDAO = new UserDAO();
            UserDTO login_user = userDAO.Login(username, password);

            HttpSession session = request.getSession();
            session.setAttribute("LOGIN_USER", login_user);
            ProviderDAO providerdao = new ProviderDAO();
            ProviderDTO provider = providerdao.getProvider(username, password);

            if (login_user.getRole_id().equals(CUS_ROLE)) {
                url = CUS_PAGE;
            } else if (userDAO.Login(username, password).getRole_id().equals(PRO_ROLE)) {
                session.setAttribute("LOGIN_PROVIDER", provider);
                ProviderDAO providerDAO = new ProviderDAO();
                List<ProductDetailDTO> listProduct = providerDAO.loadListProduct(provider);
                List<ProviderServiceDTO1> listService = providerDAO.loadListService(provider);
                if (listProduct.isEmpty() && listService != null) {
                    url = PRO_PAGE_SERVICE;
                } else if (listProduct != null && listService.isEmpty()) {
                    url = PRO_PAGE_PRODUCT;
                } else {
                    url = PRO_PAGE_PRODUCT;
                }

            } else {
                request.setAttribute("LOGIN_ERROR", "Incorect username or password");
            }

        } catch (Exception e) {
            log("ERROR at LoginController: " + e.toString());
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
