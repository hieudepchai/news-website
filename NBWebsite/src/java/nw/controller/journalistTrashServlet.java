/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.AccountBean;
import nw.bean.ActivityBean;
import nw.bean.ArticleBean;
import nw.bean.UpdateArticleActivityBean;
import nw.dao.ArticleDAO;
import nw.dao.UpdateArticleActivityDAO;
import nw.utils.ActivityLib;
import nw.utils.ArticleLib;

/**
 *
 * @author quan1
 */
public class journalistTrashServlet extends HttpServlet {
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
            out.println("<title>Servlet journalistTrashServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet journalistTrashServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
        journalistID = journalist.getAccountID(); 
        getServletContext().getRequestDispatcher("/journalist_trash.jsp").forward(request, response);
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
        ArticleDAO artiDAO = new ArticleDAO();
        HttpSession session = request.getSession();
        
        request.setCharacterEncoding("UTF-8");
        
        //delete forever
        String[] listDelArticleID = request.getParameterValues("jsonDel[]"); 
        if (listDelArticleID != null){
            List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticle");
            
            HashMap <Integer, ArticleBean> articleMap = new HashMap<>();
            for (int i = 0; i < listArticle.size(); i++){
                articleMap.put(listArticle.get(i).getArticleID(), listArticle.get(i));
            }
            
            for (String listArticleID1 : listDelArticleID) {
                int ID = Integer.parseInt(listArticleID1); //ArticleID
                try {
                    artiDAO.deleteArticle(ID);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                ArticleBean article = articleMap.get(ID);
                int position = listArticle.indexOf(article);
                listArticle.remove(position);
            }
            session.setAttribute("listArticle", listArticle);
        }
        
        //revert article
        String[] listRevertArticleID = request.getParameterValues("jsonRevert[]"); 
        if (listRevertArticleID != null){
            List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticle");
            List<Pair<Integer, ActivityBean>> listActivity = (List<Pair<Integer, ActivityBean>>) session.getAttribute("listActivityJournalist");
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
            Date date = new Date(); 
            String currentTime = formatter.format(date);  
            
//            HashMap <Integer, ArticleBean> articleMap = new HashMap<>();
//            for (int i = 0; i < listArticle.size(); i++){
//                articleMap.put(listArticle.get(i).getArticleID(), listArticle.get(i));
//            }
            
            for (String listArticleID1 : listRevertArticleID) {
                int ID = Integer.parseInt(listArticleID1); //ArticleID
                
                try {
                    artiDAO.revertArticle(ID);
                } catch (SQLException ex) {
                    Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                // update session listArticle
                ArticleBean article = new ArticleBean();
                for (int i = 0; i < listArticle.size(); i++){
                    if(ID == listArticle.get(i).getArticleID()){
                        article = listArticle.get(i);
                        break;
                    }
                }
                int position = listArticle.indexOf(article);
                article.setCensored(0);
                article.setDraft(0);
                article.setTrash(0);
                article.setLastModified(currentTime);
                listArticle.set(position, article);
                
                ArticleLib.updateArticle(article);
                
                //insert activity to ActivityLib
                UpdateArticleActivityBean activity = new UpdateArticleActivityBean(journalistID, ID, 0, 1 ,1, 0, currentTime);
                ActivityLib.insertActivity(activity, article.getHeading(), article.getShortDescription(), article.getJournalistID());
            }
            session.setAttribute("listArticle", listArticle);
            session.setAttribute("listActivityJournalist", listActivity);
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
