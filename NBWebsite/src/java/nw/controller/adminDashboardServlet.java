/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
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
public class adminDashboardServlet extends HttpServlet {

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
        CommentDAO cmtDAO = new CommentDAO();
        ArticleDAO artiDAO = new ArticleDAO();
        AccountDAO accDAO = new AccountDAO();

        HttpSession session = request.getSession();

        try {
            if (session.getAttribute("countComment") != null) {
                session.removeAttribute("countComment");
            }
            if (session.getAttribute("countAccount") != null) {
                session.removeAttribute("countAccount");
            }
            if (session.getAttribute("countArticle") != null) {
                session.removeAttribute("countArticle");
            }
            if (session.getAttribute("listComment") != null) {
                session.removeAttribute("listComment");
            }
            if (session.getAttribute("listArticle") != null) {
                session.removeAttribute("listArticle");
            }

            if (session.getAttribute("listComment") == null) {
                List<CommentBean> listComment = cmtDAO.getComment();
                session.setAttribute("listComment", listComment);

            }
            if (session.getAttribute("listArticle") == null) {
                List<ArticleBean> listArticle = artiDAO.getAllArticles();
                session.setAttribute("listArticle", listArticle);
            }
            if (session.getAttribute("listAccount") == null) {
                List<AccountBean> listAccount = accDAO.getAccount();
                session.setAttribute("listAccount", listAccount);
            }

            if (session.getAttribute("countComment") == null) {
                int comment = cmtDAO.CountComment();
                session.setAttribute("countComment", comment);
            }

            if (session.getAttribute("countArticle") == null) {
                int article = artiDAO.CountArticle();
                session.setAttribute("countArticle", article);
            }
            if (session.getAttribute("countAccount") == null) {
                int account = accDAO.CountAccount();
                session.setAttribute("countAccount", account);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(adminListAllArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(adminDashboardServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response);
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
