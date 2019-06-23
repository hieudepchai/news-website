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

public class adminListArticleWaitingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    //private String SAVE_DIR = "";
    private int adminID = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminListArticleWaiting</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminListArticleWaiting at " + request.getContextPath() + "</h1>");
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
        ArticleDAO artiDAO = new ArticleDAO();
        ImageDAO ImgDAO = new ImageDAO();

        ArrayList<CategoryBean> al2Category = new ArrayList<CategoryBean>();
        MyBiMap<Integer, String> CategoryMap = new MyBiMap<Integer, String>();
        CategoryDAO categoryDAO = new CategoryDAO();
        al2Category = categoryDAO.getCategory(CategoryMap);

        HttpSession session = request.getSession();
        session.setAttribute("CategoryMap", CategoryMap);

        AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
        adminID = journalist.getAccountID();

        try {
            if (session.getAttribute("listMessage1") != null) {
                session.removeAttribute("listMessage1");
            }
            if (session.getAttribute("AdminEditor1") != null) {
                session.removeAttribute("AdminEditor1");
            }
            if (session.getAttribute("ImageSoucre") != null) {
                session.removeAttribute("ImageSoucre");
            }

            if (session.getAttribute("ArticlePreview") != null) {
                session.removeAttribute("ArticlePreview");
            }
            if (session.getAttribute("listArticleWaiting") != null) {
                session.removeAttribute("listArticleWaiting");
            }
            if (session.getAttribute("ArticleMap") != null) {
                session.removeAttribute("ArticleMap");
            }
            if (session.getAttribute("listImg") != null) {
                session.removeAttribute("listImg");
            }

            if (session.getAttribute("listArticleWaiting") == null) {
                List<ArticleBean> listArticle = artiDAO.getAllArticlesWating();

                HashMap<Integer, ArticleBean> ArticleMap = new HashMap<>();
                for (int i = 0; i < listArticle.size(); i++) {
                    ArticleMap.put(listArticle.get(i).getArticleID(), listArticle.get(i));
                }

                session.setAttribute("listArticleWaiting", listArticle);
                session.setAttribute("ArticleMap", ArticleMap);
            }
            if (session.getAttribute("listImg") == null) {
                List<Image> listImg = ImgDAO.getListImagebyThumbnail();
                session.setAttribute("listImg", listImg);
            }

        } catch (SQLException ex) {
            Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(adminListAllArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext().getRequestDispatcher("/admin_ListArticleWaiting.jsp").forward(request, response);
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
        ImageDAO ImgDAO = new ImageDAO();
        MessageDAO messDAO = new MessageDAO();
        AccountDAO accDAO = new AccountDAO();
        UpdateArticleActivityDAO activityDAO = new UpdateArticleActivityDAO();
        HttpSession session = request.getSession();

        request.setCharacterEncoding("UTF-8");
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String currentTime = formatter.format(date); //get current date

        String[] listArticleID = request.getParameterValues("acceptJson[]"); //publish Article
        if (listArticleID != null) {
            for (String listArticleID1 : listArticleID) {
                int ID = Integer.parseInt(listArticleID1); //ArticleID
                UpdateArticleActivityBean activity = new UpdateArticleActivityBean(adminID, ID, 1, 0, 0, 0, currentTime);
                try {
                    artiDAO.publishArticle(ID);
                    activityDAO.insertActivity(activity);
                } catch (SQLException ex) {
                    Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(adminListArticleWaitingServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return;
        }

        String[] listUnacceptArticleID = request.getParameterValues("unacceptJson[]"); //publish Article
        if (listUnacceptArticleID != null) {
            for (String listArticleID1 : listUnacceptArticleID) {
                int ID = Integer.parseInt(listArticleID1); //ArticleID
                UpdateArticleActivityBean activity = new UpdateArticleActivityBean(adminID, ID, 0, 1, 0, 0, currentTime);
                try {
                    artiDAO.draftArticle(ID);
                    activityDAO.insertActivity(activity);
                } catch (SQLException ex) {
                    Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(adminListArticleWaitingServlet.class.getName()).log(Level.SEVERE, null, ex);
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

                List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticleWaiting");
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
                    if (listMessage.get(i).getSenderID() != this.adminID) {
                        listAdmin.put(listMessage.get(i).getSenderID(), accDAO.getAccountInfor(listMessage.get(i).getSenderID()));
                    }
                }
                session.setAttribute("listMessage1", listMessage);
                session.setAttribute("AdminEditor1", listAdmin);
                String img = image.getSource();
                session.setAttribute("ImageSoucre", img);
                session.setAttribute("ArticlePreview", article);
                //getServletContext().getRequestDispatcher("/journalist_compose.jsp").forward(request, response);
                getServletContext().getRequestDispatcher("/previewArticle.jsp").forward(request, response);
//                Pair <String, ArticleBean> ImageArticle = new Pair<>(image.getSource(), article);
//                
//                Gson gson = new Gson();
//                //JsonElement element = gson.toJsonTree(article, new TypeToken<ArticleBean>(){}.getType());
//                JsonElement element = gson.toJsonTree(ImageArticle, new TypeToken<Pair <String, ArticleBean>>(){}.getType());
                //JsonArray jsonArray = element.getAsJsonArray();
                //response.setContentType("application/json");
                //response.setCharacterEncoding("UTF-8");

//                response.getWriter().println(element);
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
