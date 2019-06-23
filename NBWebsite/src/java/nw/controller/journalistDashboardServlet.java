    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.AccountBean;
import nw.bean.ActivityBean;
import nw.bean.ArticleBean;
import nw.bean.CommentBean;
import nw.bean.Image;
import nw.bean.notificationBean;
import nw.dao.ArticleDAO;
import nw.dao.CategoryDAO;
import nw.dao.ImageDAO;
import nw.dao.notificationDAO;
import nw.utils.ActivityLib;
import nw.utils.ArticleLib;
import nw.utils.CommentLib;
import nw.utils.ImageLib;
import nw.utils.NotificationLib;

/**
 *
 * @author quan1
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
        maxFileSize = 1024 * 1024 * 100, // 100MB
        maxRequestSize = 1024 * 1024 * 100) // 100MB
public class journalistDashboardServlet extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet journalistDashboardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet journalistDashboardServlet at " + request.getContextPath() + "</h1>");
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
        //ArticleDAO artiDAO = new ArticleDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        //ImageDAO imgDAO = new ImageDAO();
        HttpSession session = request.getSession();

        AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
        journalistID = journalist.getAccountID();

        //create session
        try {
            if (session.getAttribute("listArticle") == null) {
                List<ArticleBean> listArticle = ArticleLib.getListArticleJL(journalistID);
                if(listArticle == null){
                    ArticleLib.createListAticleJl(journalistID);
                    listArticle = ArticleLib.getListArticleJL(journalistID);
                }
                HashMap<Integer, String> listCate = cateDAO.getAllCategory();

                session.setAttribute("listArticle", listArticle);
                session.setAttribute("listCate", listCate);

            }
            if (session.getAttribute("listImage") == null) {
                List<Image> listImg = ImageLib.getListImageAccount(journalistID);
                if(listImg == null){
                    ImageLib.createListImageAccount(journalistID);
                    listImg = ImageLib.getListImageAccount(journalistID);
                }
                session.setAttribute("listImage", listImg);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (session.getAttribute("listComment") == null) {           
            List<CommentBean> listCmt = CommentLib.getCommentJournalist(journalistID);
            if(listCmt == null){
                CommentLib.createListCommentJournalist(journalistID);
                listCmt = CommentLib.getCommentJournalist(journalistID);
            }
            session.setAttribute("listComment", listCmt);
        }

        List<Image> listImage = (List<Image>) session.getAttribute("listImage");

        if (session.getAttribute("TopicImageMap") == null) {
            HashMap<Integer, String> TopicImageMap = ImageLib.getTopicImageMap(); //map store topic image(thumbnail = 1)
            
            session.setAttribute("TopicImageMap", TopicImageMap);
        }

        int nArticle = 0;
        int nDraft = 0;
        int nComments = 0;
        int nTrash = 0;

        List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticle");
        for (int i = 0; i < listArticle.size(); i++) {
            if (listArticle.get(i).getDraft() == 1) {
                nDraft++;
            } else if (listArticle.get(i).getTrash() == 1) {
                nTrash++;
            } else {
                nArticle++;
            }
        }

        List<CommentBean> listCmt = (List<CommentBean>) session.getAttribute("listComment");
        for(int i=0; i<listCmt.size(); i++){
            if(listCmt.get(i).getLevel() == 1)
                nComments++;
        }

        request.setAttribute("nArticle", nArticle);
        request.setAttribute("nDraft", nDraft);
        request.setAttribute("nTrash", nTrash);
        request.setAttribute("nComments", nComments);

        //activity
        List<Pair<Integer, ActivityBean>> listActivity = ActivityLib.getActivityJournalist(journalistID);  //kind activity, ArticleActivityBean
        if (listActivity == null) {
            ActivityLib.createListActivityJournalist(journalistID, listArticle, listImage);
            listActivity = ActivityLib.getActivityJournalist(journalistID);
        }

        List<Pair<Integer, ActivityBean>> tenActivity = new ArrayList<>();
        for (int i = 0; i < listActivity.size(); i++) {
            tenActivity.add(listActivity.get(i));
            if (i == 9) {
                break;
            }
        }

        request.setAttribute("listActivity", tenActivity);
        
        //notification
        if (session.getAttribute("listNotification") == null) {
            
            List<Pair<Integer, ActivityBean>> listNotification = NotificationLib.getListNotifyAccount(journalistID);
            
            if (listNotification == null) {
                NotificationLib.createlistNotificationJournalist(journalistID);
                listNotification = NotificationLib.getListNotifyAccount(journalistID);
            }
            //List<Pair<Integer, ActivityBean>> listNotify = new ArrayList<>(listNotification);
            //NotificationLib.CalTimeListNotification(listNotify, TopicImageMap);
            NotificationLib.clearListNewNotificationJl(journalistID);
            session.setAttribute("listNotification", listNotification);
        }
        

        getServletContext().getRequestDispatcher("/journalist_dashboard.jsp").forward(request, response);
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
        processRequest(request, response);
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
