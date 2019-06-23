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
import nw.bean.CommentBean;
import nw.dao.CommentDAO;

/**
 *
 * @author Admin
 */
public class readerCommentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
        String responseText = "";
        String mode = request.getParameter("mode");
        CommentDAO cmtDAO = new CommentDAO();
        if (mode==null) {
            int ArticleID = Integer.parseInt(request.getParameter("ArticleID"));
            int RepliedCommentID = Integer.parseInt(request.getParameter("RepliedCommentID"));
            int AccountID = Integer.parseInt(request.getParameter("AccountID"));
            String Content = (String) request.getParameter("Content");
            int NoOfLikes = Integer.parseInt(request.getParameter("NoOfLikes"));
            int Level = Integer.parseInt(request.getParameter("Level"));
            int resInsert = cmtDAO.insertComment(new CommentBean(ArticleID, RepliedCommentID, AccountID, Content, NoOfLikes, Level));
            if (resInsert > 0) {
                responseText = new Integer(resInsert).toString();

            } else {
                responseText = "failed";
            }
        } else {
            int CommentID = Integer.parseInt(request.getParameter("CommentID"));
            int resDelete = cmtDAO.deleteComment(CommentID);
            if (resDelete > 0) {
                 responseText = "success";
            } else {
                responseText = "failed";
            }
        }

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(responseText);
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
