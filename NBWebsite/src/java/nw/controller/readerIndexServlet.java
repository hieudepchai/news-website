/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import com.google.common.cache.LoadingCache;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.ArticleBean;
import nw.bean.Image;
import nw.dao.CategoryDAO;
import nw.utils.*;
import nw.utils.*;

/**
 *
 * @author Admin
 */
public class readerIndexServlet extends HttpServlet {

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
        //get generalArticleMap
        Map<Integer, ArrayList<ArticleBean>> generalArticleMap = ArticleLib.getGAM();
        request.setAttribute("generalArticleMap", generalArticleMap);
        //get Cat Bi Map
        HttpSession session = request.getSession();
        if (session.getAttribute("CatBiMap") == null) {
            CategoryDAO catDAO = new CategoryDAO();
            MyBiMap<Integer, String> CatBiMap = CategoryLib.getCatBiMap();
            session.setAttribute("CatBiMap", CatBiMap);
        }
        //get Img
        ImageLib imgLib = new ImageLib();
        request.setAttribute("imgLib", imgLib);
        request.getRequestDispatcher("/reader_index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
