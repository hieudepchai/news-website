/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.BookmarkBean;
import nw.dao.BookmarkDAO;
import nw.utils.BookmarkLib;

/**
 *
 * @author Admin
 */
public class readerBookmarkServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String responseText = "failed";
        int ArticleID = Integer.parseInt(request.getParameter("ArticleID"));
        int AccountID = Integer.parseInt(request.getParameter("AccountID"));
        String sBookmarkID = request.getParameter("BookmarkID");
        int BookmarkID=0;
        if (sBookmarkID != "") {
            BookmarkID = Integer.parseInt(sBookmarkID);
        }
        String Title = request.getParameter("Title");
        String Mode = request.getParameter("Mode");
        BookmarkDAO bmDAO = new BookmarkDAO();
        int resUpdate = 0;
        int resInsert = 0;
        int resDelete = 0;
        if ("save".equals(Mode)) {
            
            if (!"".equals(sBookmarkID)) {//update
                resUpdate =bmDAO.updateBookmark(new BookmarkBean(BookmarkID,AccountID,ArticleID,Title));
            } else {//insert
                resInsert = bmDAO.insertBookmark(new BookmarkBean(AccountID,ArticleID,Title));
           }           
        }
        else{//delete
            resDelete = bmDAO.deleteBookmarkByID(BookmarkID);
        }
        if(resUpdate>0 || resInsert>0 || resDelete>0){
                try {
                    responseText = "success";
                    BookmarkLib bmLib = new BookmarkLib();
                    bmLib.setBookmarkByAccount(bmDAO.getBookmarkByAccount(AccountID));               
                    session.setAttribute("bmLib", bmLib);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(readerBookmarkServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(responseText);
    }

}
