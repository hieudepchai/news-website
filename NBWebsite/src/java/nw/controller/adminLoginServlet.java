/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.*;
import nw.dao.*;

/**
 *
 * @author Admin
 */
public class adminLoginServlet extends HttpServlet {

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
        doPost(request, response);
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
        try {

            String passedUsername = request.getParameter("username");
            String passedPassword = request.getParameter("password");
            HttpSession session = request.getSession();
            String contextPath = request.getContextPath();
            if (session.getAttribute("CurrentAccount") != null && session.getAttribute("CurrentAccountType") != null) {
                AccountTypeBean currType = (AccountTypeBean) session.getAttribute("CurrentAccountType");
                if (currType.getAdminRight() == 1) {
                    response.sendRedirect(contextPath + "/admin");
                } else {
                    response.sendRedirect(contextPath + "/journalist");
                }
            }
            if (passedUsername == null && passedPassword == null) {
                request.setAttribute("LoginResult", "");
                request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
            } else {

                //session not exist
                AccountBean loggedAccount = new AccountBean();
                AccountTypeBean loggedType = new AccountTypeBean();
                AccountDAO accDAO = new AccountDAO();
                AccountTypeDAO typeDAO = new AccountTypeDAO();
                int resaccDAO = 0;
                resaccDAO = accDAO.getAccountByPassword(passedUsername, passedPassword, loggedAccount);
                loggedType = typeDAO.getAccountTypeByID(loggedAccount.getAccountTypeID());
                if (resaccDAO == 1 && loggedAccount.getValid() == 1 && (loggedType.getAdminRight() == 1 || loggedType.getJournalistRight() == 1)) {

                    session.setAttribute("CurrentAccount", loggedAccount);
                    session.setAttribute("CurrentAccountType", loggedType);
                    //redirect with corresponding role - priority: admin
                    if (loggedType.getAdminRight() == 1) {
                        response.sendRedirect(contextPath + "/admin");
                    } else {
                        response.sendRedirect(contextPath + "/journalist");
                    }

                } else {
                    request.setAttribute("LoginResult", "Failed");
                    request.getRequestDispatcher("admin_login.jsp").forward(request, response);
                }

            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
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
