/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
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
 * @author quan1
 */
public class journalistUpdateArticle extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private int journalistID = 0;

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
            out.println("<title>Servlet journalistUpdateArticle</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet journalistUpdateArticle at " + request.getContextPath() + "</h1>");
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
        MessageDAO messDAO = new MessageDAO();
        AccountDAO accDAO = new AccountDAO();
        HttpSession session = request.getSession();
        
        AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
        journalistID = journalist.getAccountID();       
        
        String url = request.getRequestURI();
        String[] urlPart = url.split("=", 2);
        int articleID = Integer.parseInt(urlPart[1]);
        
        String headingStr = request.getQueryString();
        String[] headingPart = headingStr.split("=", 2);
        String headingUrl = headingPart[1];
        
        try {
                ArticleBean article = new ArticleBean();
                ArrayList<Image> listImageArticle = new ArrayList<>();
                ArrayList<MessageBean> listMessage = messDAO.getListMsgArticle(articleID);
                
                List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticle");
                for(int i=0; i<listArticle.size(); i++){
                    if(listArticle.get(i).getArticleID() == articleID){
                        article = listArticle.get(i);
                        break;
                    }
                }
                String encodedHeading = URLEncoder.encode(article.getHeading(), "UTF-8");
                if(!encodedHeading.equals(headingUrl)){
                    getServletContext().getRequestDispatcher("/404_notfound.jsp").forward(request, response);
                    return;
                }
                
                List<Image> listImage = (List<Image>) session.getAttribute("listImage");
                for(int i=0; i<listImage.size(); i++){
                    if (listImage.get(i).getArticleID() == articleID){
                        listImageArticle.add(listImage.get(i));
                    }
                }
                
                HashMap<Integer, AccountBean> listAdmin = new HashMap<>();
                for (int i = 0; i < listMessage.size(); i++) {
                    if (listMessage.get(i).getSenderID() != this.journalistID){
                        listAdmin.put(listMessage.get(i).getSenderID(), accDAO.getAccountInfor(listMessage.get(i).getSenderID()));
                    }
                    
                }
                
                request.setAttribute("title", article.getHeading());
                request.setAttribute("Article", article);
                request.setAttribute("listImageArticle", listImageArticle);
                request.setAttribute("listMessage", listMessage);
                request.setAttribute("AdminEditor", listAdmin);
                getServletContext().getRequestDispatcher("/journalist_compose.jsp").forward(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        //processRequest(request, response);
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
