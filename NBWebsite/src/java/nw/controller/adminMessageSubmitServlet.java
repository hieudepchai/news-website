/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.*;
import nw.dao.*;
import nw.utils.MyBiMap;

/**
 *
 * @author DUNG
 */
public class adminMessageSubmitServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminMessageSubmitServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminMessageSubmitServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        MessageDAO message = new MessageDAO();
        MessageBean msg = new MessageBean();
        HttpSession session = request.getSession();
        ArrayList<MessageBean> msgsize =  (ArrayList<MessageBean>) session.getAttribute("listMessage1");
        String msgcheck = request.getParameter("inputMessage");
        if (msgcheck != "") {
            try {
                if (msgsize.size() ==0) {
                    msg.setContent(request.getParameter("inputMessage"));
                    msg.setArticleID(Integer.parseInt(request.getParameter("ArticleIDPreview")));
                    msg.setSenderID(Integer.parseInt(request.getParameter("SenderID")));
                    msg.setRepliedMessageID(0);
                    msg.setReceiverID(Integer.parseInt(request.getParameter("ReceiverIDJournalist")));
                    message.insertMessage(msg);
                    response.sendRedirect(request.getContextPath() + "/manage/admin/List-article-waiting");
                }
                if (msgsize.size() != 0) {
                    msg.setContent(request.getParameter("inputMessage"));
                    msg.setArticleID(Integer.parseInt(request.getParameter("ArticleIDPreview")));
                    msg.setSenderID(Integer.parseInt(request.getParameter("SenderID")));
                    msg.setReceiverID(Integer.parseInt(request.getParameter("ReceiverID")));
                    msg.setRepliedMessageID(Integer.parseInt(request.getParameter("MessageID")));
                    message.insertMessage(msg);
                    response.sendRedirect(request.getContextPath() + "/manage/admin/List-article-waiting");
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(adminAccountSubmitServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/manage/admin/List-article-waiting");
        }
        ;

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
