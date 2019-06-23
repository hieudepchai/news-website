/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.AccountBean;
import nw.bean.CommentBean;
import nw.dao.CategoryDAO;
import nw.dao.CommentDAO;
import nw.utils.CategoryLib;
import nw.utils.MyBiMap;

/**
 *
 * @author Admin
 */
public class readerProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("CatBiMap") == null) {
            CategoryDAO catDAO = new CategoryDAO();
            MyBiMap<Integer, String> CatBiMap = CategoryLib.getCatBiMap();
            session.setAttribute("CatBiMap", CatBiMap);
        }
        AccountBean acc = (AccountBean) session.getAttribute("CurrentReader");
        if ( acc == null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {      
            CommentDAO cmtDAO = new CommentDAO();            
            ArrayList<CommentBean> alCmt = cmtDAO.getCommentByAccount(acc.getAccountID());
            request.setAttribute("alAccountCmt", alCmt);
            request.getRequestDispatcher("/reader_profile.jsp").forward(request, response);
        }

    }

}
