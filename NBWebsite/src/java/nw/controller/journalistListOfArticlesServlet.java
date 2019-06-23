/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
import nw.utils.ActivityLib;
import nw.utils.ArticleLib;

/**
 *
 * @author quan1
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
    maxFileSize = 1024 * 1024 * 100, // 100MB
    maxRequestSize = 1024 * 1024 * 100) // 100MB
public class journalistListOfArticlesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    //private String SAVE_DIR = "";
    private int journalistID = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        HttpSession session = request.getSession();
        AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
        journalistID = journalist.getAccountID(); 
        
        List<CommentBean> listCmt = (List<CommentBean>) session.getAttribute("listComment");
        List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticle");
        HashMap<Integer, Integer> nCmt = new HashMap<>();
        
        int count = 0;
        for (int i = 0; i < listArticle.size(); i++) {
            for (int j = 0; j < listCmt.size(); j++) {
                if (listCmt.get(j).getLevel() == 1 && listCmt.get(j).getArticleID() == listArticle.get(i).getArticleID()) {
                    count++;
                }
            }
            nCmt.put(listArticle.get(i).getArticleID(), count);
            count=0;
        }
        
        request.setAttribute("nCmtMap", nCmt);
        getServletContext().getRequestDispatcher("/journalist_listOfArticles.jsp").forward(request, response);
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
        
        //move to trash
        String[] listArticleID = request.getParameterValues("json[]"); 
        if (listArticleID != null){
            //UpdateArticleActivityDAO activityDAO = new UpdateArticleActivityDAO();
            List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticle");
            List<Pair<Integer, ActivityBean>> listActivity = (List<Pair<Integer, ActivityBean>>) session.getAttribute("listActivityJournalist");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
            Date date = new Date(); 
            String currentTime = formatter.format(date);  
            
//            HashMap <Integer, ArticleBean> articleMap = new HashMap<>();
//            for (int i = 0; i < listArticle.size(); i++){
//                articleMap.put(listArticle.get(i).getArticleID(), listArticle.get(i));
//            }
            
            for (String listArticleID1 : listArticleID) {
                int ID = Integer.parseInt(listArticleID1); //ArticleID               
                try {
                    artiDAO.moveArticleToTrash(ID);
                    //activityDAO.insertActivity(activity);
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
                article.setTrash(1);
                article.setLastModified(currentTime);
                listArticle.set(position, article);
                
                ArticleLib.updateArticle(article);
                
                //insert activity to ActivityLib
                UpdateArticleActivityBean activity = new UpdateArticleActivityBean(journalistID, ID, 0, 0 ,1, 0, currentTime);
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
