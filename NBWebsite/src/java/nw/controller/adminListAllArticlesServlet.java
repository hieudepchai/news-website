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
import nw.utils.MyBiMap;

/**
 *
 * @author DUNG
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
        maxFileSize = 1024 * 1024 * 100, // 100MB
        maxRequestSize = 1024 * 1024 * 100) // 100MB

public class adminListAllArticlesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    //private String SAVE_DIR = "";
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
        ArticleDAO artiDAO = new ArticleDAO();
        ImageDAO ImgDAO = new ImageDAO();

        HttpSession session = request.getSession();

        try {
            if (session.getAttribute("listArticle") != null) {
                session.removeAttribute("listArticle");
            }
            if (session.getAttribute("ArticleMap") != null) {
                session.removeAttribute("ArticleMap");
            }
            if (session.getAttribute("CategoryMap") != null) {
                session.removeAttribute("CategoryMap");
            }
            if (session.getAttribute("listImg") != null) {
                session.removeAttribute("listImg");
            }

            if (session.getAttribute("listImg") == null) {
                List<Image> listImg = ImgDAO.getListImagebyThumbnail();
                session.setAttribute("listImg", listImg);
            }
            if (session.getAttribute("CategoryMap") == null) {
                ArrayList<CategoryBean> al2Category = new ArrayList<CategoryBean>();
                MyBiMap<Integer, String> CategoryMap = new MyBiMap<Integer, String>();
                CategoryDAO categoryDAO = new CategoryDAO();
                al2Category = categoryDAO.getCategory(CategoryMap);

                session.setAttribute("CategoryMap", CategoryMap);
            }

            if (session.getAttribute("listArticle") == null) {
                List<ArticleBean> listArticle = artiDAO.getAllArticles();

                HashMap<Integer, ArticleBean> ArticleMap = new HashMap<>();
                for (int i = 0; i < listArticle.size(); i++) {
                    ArticleMap.put(listArticle.get(i).getArticleID(), listArticle.get(i));
                }

                session.setAttribute("listArticle", listArticle);
                session.setAttribute("ArticleMap", ArticleMap);

            }

        } catch (SQLException ex) {
            Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(adminListAllArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext().getRequestDispatcher("/admin_ListofArticles.jsp").forward(request, response);
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
        UpdateArticleActivityDAO activityDAO = new UpdateArticleActivityDAO();
        ImageDAO ImgDAO = new ImageDAO();
        MessageDAO messDAO = new MessageDAO();
        AccountDAO accDAO = new AccountDAO();
        HttpSession session = request.getSession();

        AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
        journalistID = journalist.getAccountID();

        request.setCharacterEncoding("UTF-8");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String currentTime = formatter.format(date); //get current date

        String[] listArticleID = request.getParameterValues("json[]"); //move to trash
        if (listArticleID != null) {
            for (String listArticleID1 : listArticleID) {
                int ID = Integer.parseInt(listArticleID1);
                UpdateArticleActivityBean activity = new UpdateArticleActivityBean(journalistID, ID, 0, 0, 1, 0, currentTime);
                try {
                    artiDAO.moveArticleToTrash(ID);
                    activityDAO.insertActivity(activity);
                } catch (SQLException ex) {
                    Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(adminListAllArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return;
        }

        String StrArticleID = request.getParameter("ArticleID");
        if (StrArticleID != null) {
            int articleID = Integer.parseInt(StrArticleID);
            try {
                ArticleBean article = new ArticleBean();
                ArrayList<MessageBean> listMessage = messDAO.getListMsgArticle(articleID);

                List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticle");
                for (int i = 0; i < listArticle.size(); i++) {
                    if (listArticle.get(i).getArticleID() == articleID) {
                        article = listArticle.get(i);
                        break;
                    }
                }
                Image image = new Image();

                List<Image> listImage = (List<Image>) session.getAttribute("listImg");
                for (int i = 0; i < listImage.size(); i++) {
                    if (listImage.get(i).getArticleID() == articleID) {
                        image = listImage.get(i);
                        break;
                    }
                }

                HashMap<Integer, AccountBean> listAdmin = new HashMap<>();
                for (int i = 0; i < listMessage.size(); i++) {
                    if (listMessage.get(i).getSenderID() != this.journalistID) {
                        listAdmin.put(listMessage.get(i).getSenderID(), accDAO.getAccountInfor(listMessage.get(i).getSenderID()));
                    }

                }
                Pair<String, ArticleBean> ImageArticle = new Pair<>(image.getSource(), article);

                Gson gson = new Gson();
                //JsonElement element = gson.toJsonTree(article, new TypeToken<ArticleBean>(){}.getType());
                JsonElement element = gson.toJsonTree(ImageArticle, new TypeToken<Pair<String, ArticleBean>>() {
                }.getType());
                //JsonArray jsonArray = element.getAsJsonArray();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().println(element);
                //response.getWriter().print(article);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
