/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.dao.AccountDAO;
import nw.bean.AccountBean;
import nw.bean.AccountTypeBean;
import nw.dao.AccountTypeDAO;
import nw.utils.MyBiMap;

/**
 *
 * @author Admin
 */
public class adminAccountServlet extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            //
            if (session.getAttribute("ListType") != null) {
                session.removeAttribute("ListType");
            }
            if (session.getAttribute("ListAccount") != null) {
                session.removeAttribute("ListAccount");
            }

            if (session.getAttribute("ListType") == null) {
                ArrayList<AccountTypeBean> alAccountType = new ArrayList<AccountTypeBean>();
                MyBiMap<Integer, String> TypeMap = new MyBiMap<Integer, String>();
                AccountTypeDAO typeDAO = new AccountTypeDAO();
                //get list of Account Type
                alAccountType = typeDAO.getAccountType(TypeMap);
                //Map ID Name
                session.setAttribute("TypeMap", TypeMap);
                session.setAttribute("ListType", alAccountType);
            }
            if (session.getAttribute("ListAccount") == null) {
                ArrayList<AccountBean> alAccount = new ArrayList<AccountBean>();
                AccountDAO accDAO = new AccountDAO();
                alAccount = accDAO.getAccount();
                session.setAttribute("ListAccount", alAccount);
            }
            request.getRequestDispatcher("/admin_account.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(adminAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

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
        doGet(request, response);
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
