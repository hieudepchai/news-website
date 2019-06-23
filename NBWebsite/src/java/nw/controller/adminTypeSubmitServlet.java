/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import nw.bean.AccountTypeBean;
import nw.dao.AccountTypeDAO;

/**
 *
 * @author DUNG
 */
public class adminTypeSubmitServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        AccountTypeDAO typeDAO = new AccountTypeDAO();
        AccountTypeBean type = new AccountTypeBean();
        String para_action = request.getParameter("action");
        if (para_action != null) {
            int action = Integer.parseInt(para_action);
        try{
            int value=0;
                if (action == 1 || action == 2) {
                    type.setName(request.getParameter("Name"));
                    if(request.getParameter("ReaderRight") == null)
                        type.setReaderRight(0);
                    else
                    type.setReaderRight(Integer.parseInt(request.getParameter("ReaderRight")));
                    
                    if(request.getParameter("JournalistRight")==null)
                        type.setJournalistRight(0);
                    else
                    type.setJournalistRight(Integer.parseInt(request.getParameter("JournalistRight")));
                    
                    if(request.getParameter("AdminRight")==null)
                        type.setAdminRight(0);
                    else
                    type.setAdminRight(Integer.parseInt(request.getParameter("AdminRight")));
                    
                    if(request.getParameter("AccountMng")==null)
                        type.setAccountMng(0);
                    else
                    type.setAccountMng(Integer.parseInt(request.getParameter("AccountMng")));
                    
                    if(request.getParameter("AccountTypeMng")==null)
                        type.setAccountTypeMng(0);
                    else
                    type.setAccountTypeMng(Integer.parseInt(request.getParameter("AccountTypeMng")));
                    
                    if(request.getParameter("ArticleMng")==null)
                        type.setArticleMng(0);
                    else
                    type.setArticleMng(Integer.parseInt(request.getParameter("ArticleMng")));
                    
                    if(request.getParameter("CommentMng")==null)
                        type.setCommentMng(0);
                    else
                    type.setCommentMng(Integer.parseInt(request.getParameter("CommentMng")));
                    
                    if(request.getParameter("BookmarkMng")==null)
                        type.setBookmarkMng(0);
                    else
                    type.setBookmarkMng(Integer.parseInt(request.getParameter("BookmarkMng")));
                    
                    if(request.getParameter("FeedbackMng")==null)
                        type.setFeedbackMng(0);
                    else
                    type.setFeedbackMng(Integer.parseInt(request.getParameter("FeedbackMng")));
                    
                    if(request.getParameter("ImageMng")==null)
                        type.setImageMng(0);
                    else                    
                    type.setImageMng(Integer.parseInt(request.getParameter("ImageMng")));

                    int res = 0;
                    if (action == 1) {
                        //insert operation
                        res = typeDAO.insertType(type);
                        if (res == 0 || res == -1) {
                            session.setAttribute("TypeSubmitResult", "Failed to insert");
                        } else {
                            session.setAttribute("TypeSubmitResult", "Inserted successfully");
                            session.removeAttribute("ListType");
                        }
                    } else {//action ==2
                        //update operation
                    type.setAccountTypeID(Integer.parseInt(request.getParameter("AccountTypeID")));
                        res = typeDAO.updateType(type);
                        if (res == 0 || res == -1) {
                            session.setAttribute("TypeSubmitResult", "Failed to update");
                        } else {
                            session.setAttribute("TypeSubmitResult", "Updated successfully");
                            session.removeAttribute("ListType");
                        }
                    }
                } else {//action ==3
                    int id = Integer.parseInt(request.getParameter("AccountTypeID"));
                    int deleteres = 0;
                    deleteres = typeDAO.deleteTypeByID(id);
                    if (deleteres == 0 || deleteres == -1) {
                        session.setAttribute("TypeSubmitResult", "Failed to delete");
                    } else {
                        session.setAttribute("TypeSubmitResult", "Deleted successfully");
                        session.removeAttribute("ListType");
                    }
                }
                response.sendRedirect(request.getContextPath() + "/manage/admin/accounttype");
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(adminAccountSubmitServlet.class.getName()).log(Level.SEVERE, null, ex);
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
