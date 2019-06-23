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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.*;
import nw.dao.*;
import nw.utils.ArticleLib;
import nw.utils.BookmarkLib;
import nw.utils.CommentLib;
import nw.utils.ImageLib;
import nw.utils.NotificationLib;

/**
 *
 * @author Admin
 */
public class adminLoginServlet extends HttpServlet {

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
        doPost(request, response);
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
        try {

            String passedUsername = request.getParameter("username");
            String passedPassword = request.getParameter("password");
            HttpSession session = request.getSession();
            String contextPath = request.getContextPath();
            if (session.getAttribute("CurrentAccount") != null && session.getAttribute("CurrentAccountType") != null) {
                AccountTypeBean currType = (AccountTypeBean) session.getAttribute("CurrentAccountType");
                if (currType.getAdminRight() == 1) {
                    response.sendRedirect(contextPath + "/manage/admin");
                } else {
                    response.sendRedirect(contextPath + "/manage/journalist");
                }
            }
            if (passedUsername == null && passedPassword == null) {
                request.setAttribute("LoginResult", "");
                request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
            } else {

                //session not exist
                AccountBean loggedAccount = new AccountBean();
                AccountTypeBean loggedType = new AccountTypeBean();
                AccountDAO accDAO = new AccountDAO();
                AccountTypeDAO typeDAO = new AccountTypeDAO();
                int resaccDAO = 0;
                resaccDAO = accDAO.getAccountByPassword(passedUsername, passedPassword, loggedAccount);
                loggedType = typeDAO.getAccountTypeByID(loggedAccount.getAccountTypeID());
                if (resaccDAO == 1 && loggedAccount.getValid() == 1 && (loggedType.getAdminRight() == 1 || loggedType.getJournalistRight() == 1)) {

                    session.setAttribute("CurrentAccount", loggedAccount);
                    session.setAttribute("CurrentAccountType", loggedType);
                    //set reader account
                    if(loggedType.getReaderRight()==1){
                        BookmarkDAO bmDAO = new BookmarkDAO();
                        ArrayList<BookmarkBean> alBM = new ArrayList<BookmarkBean>();
                        alBM = bmDAO.getBookmarkByAccount(loggedAccount.getAccountID());
                        BookmarkLib  bmLib = new BookmarkLib();
                        bmLib.setBookmarkByAccount(alBM);
                        session.setAttribute("bmLib", bmLib);
                        session.setAttribute("CurrentReader", loggedAccount);
                    }
                    //
//                    if (loggedType.getJournalistRight() == 1) {
//                        //ArticleDAO artiDAO = new ArticleDAO();
//                        CategoryDAO cateDAO = new CategoryDAO();
//                        //ImageDAO imgDAO = new ImageDAO();
//                        int journalistID = loggedAccount.getAccountID();
//
//                        try {
//                            if (session.getAttribute("listArticle") == null) {
//                                List<ArticleBean> listArticle = ArticleLib.getListArticleJL(journalistID);
//                                if (listArticle == null) {
//                                    ArticleLib.createListAticleJl(journalistID);
//                                    listArticle = ArticleLib.getListArticleJL(journalistID);
//                                }
//                                HashMap<Integer, String> listCate = cateDAO.getAllCategory();
//
//                                session.setAttribute("listArticle", listArticle);
//                                session.setAttribute("listCate", listCate);
//
//                            }
//
//                            if (session.getAttribute("listImage") == null) {
//                                List<Image> listImg = ImageLib.getListImageAccount(journalistID);
//                                if (listImg == null) {
//                                    ImageLib.createListImageAccount(journalistID);
//                                    listImg = ImageLib.getListImageAccount(journalistID);
//                                }
//                                session.setAttribute("listImage", listImg);
//                            }
//
//                        } catch (ClassNotFoundException | SQLException ex) {
//                            Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
//                        }
//
//                        //comment
//                        if (session.getAttribute("listComment") == null) {
//                            List<CommentBean> listCmt = CommentLib.getCommentJournalist(journalistID);
//                            if (listCmt == null) {
//                                CommentLib.createListCommentJournalist(journalistID);
//                                listCmt = CommentLib.getCommentJournalist(journalistID);
//                            }
//                            session.setAttribute("listComment", listCmt);
//                        }
//
//                        //notification
//                        if (session.getAttribute("listNotification") == null) {
//                            List<Pair<Integer, ActivityBean>> listNotification = NotificationLib.getListNotifyAccount(journalistID);
//                            HashMap<Integer, String> TopicImageMap = ImageLib.getTopicImageMap(); //map store topic image(thumbnail = 1)
//                            if (listNotification == null) {
//                                NotificationLib.createlistNotificationJournalist(journalistID);
//                                listNotification = NotificationLib.getListNotifyAccount(journalistID);
//                            }
//                            //List<Pair<Integer, ActivityBean>> listNotify = new ArrayList<>(listNotification);
//                            //HashMap<Integer, String> time = NotificationLib.CalTimeListNotification(listNotify, TopicImageMap);
//                            NotificationLib.clearListNewNotificationJl(journalistID);
//                            session.setAttribute("TopicImageMap", TopicImageMap);
//                            session.setAttribute("listNotification", listNotification);
//                        }
//                        
//                    }
                    
                    //redirect with corresponding role - priority: admin
                    if (loggedType.getAdminRight() == 1) {
                        response.sendRedirect(contextPath + "/manage/admin");
                    } else {
                        
                        response.sendRedirect(contextPath + "/manage/journalist");
                    }

                } else {
                    request.setAttribute("LoginResult", "Failed");
                    request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
                }

            }
        } catch (Exception e) {
            System.out.println(e.toString());
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
