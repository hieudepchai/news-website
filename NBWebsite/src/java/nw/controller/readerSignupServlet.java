/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nw.dao.AccountDAO;
import nw.dao.AccountTypeDAO;
import nw.bean.AccountBean;

/**
 *
 * @author Admin
 */
public class readerSignupServlet extends HttpServlet {

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AccountBean acc = new AccountBean();
            AccountTypeDAO typeDAO = new AccountTypeDAO();
            AccountDAO accDAO = new AccountDAO();
            int insertres = 0;
            acc.setUsername(request.getParameter("Username"));
            acc.setPassword(request.getParameter("Password"));
            acc.setFirstName(request.getParameter("FirstName"));
            acc.setLastName(request.getParameter("LastName"));
            acc.setEmail(request.getParameter("Email"));
            acc.setPhone(request.getParameter("Phone"));
            acc.setValid(1);
            acc.setAccountTypeID(typeDAO.getReaderTypeIDByName("reader"));
            insertres = accDAO.insertAccount(acc);
            String SignupResult = "";
            if(insertres==1)
            {
                SignupResult = "success";
            }
            else
            {
                SignupResult = "fail";
            }
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(SignupResult);
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
