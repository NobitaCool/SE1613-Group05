/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebutler.swp.controllers;

import com.ebutler.swp.dao.DeliveryDAO;
import com.ebutler.swp.dao.UserDAO;
import com.ebutler.swp.dto.DeliveryDTO;
import com.ebutler.swp.dto.ShipperDTO;
import com.ebutler.swp.dto.UserDTO;
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
 * @author DELL
 */
public class Assign_DeliveryController extends HttpServlet {

    private final String SUCCESS = "DeliveryHomeController";
    private final String ERROR = "delivery_homePage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            DeliveryDAO deliveryDAO = new DeliveryDAO();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            ShipperDTO shipper = (ShipperDTO) session.getAttribute("CURRENT_SHIPPER");
            List<DeliveryDTO> listDelivery = (List<DeliveryDTO>) session.getAttribute("Delivery_List");
            UserDAO userDAO = new UserDAO() ;
            boolean assignNow = false;
            for (int i = 0; i < listDelivery.size(); i++) {
                double total = listDelivery.get(i).getTotal();
                double totalCheck = total / 3;
                if (totalCheck < shipper.getWallet()) {
                    
                    double newWallet = shipper.getWallet() - totalCheck ; 
                    boolean checkUpdate = userDAO.updateShipperWallet(newWallet, shipper.getUsername()) ; 
                    if (checkUpdate) {
                        assignNow = true;
                    }
                }
            }
            if (assignNow) {
                String checkDelivery = deliveryDAO.assignDeliveryChecking(orderID);
                if (checkDelivery == null) {
                    boolean check = deliveryDAO.assignDelivery(loginUser.getUsername(), orderID);
                    if (check) {
                        url = SUCCESS;

                    }
                } else if (!checkDelivery.isEmpty()) {
                    url = ERROR;
                    session.setAttribute("ERROR_ASSIGN", "This Order Has Been Assigned!!");
                }
            } else {
                 url = ERROR;
                    session.setAttribute("ERROR_ASSIGN", "You Dont Have Enough Money To Assign"); 
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
