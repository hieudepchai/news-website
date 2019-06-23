/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.utils.ArticleLib;
import nw.utils.CategoryLib;
import nw.utils.MyBiMap;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import nw.bean.ArticleBean;
import nw.dao.CategoryDAO;
import nw.utils.ImageLib;

/**
 *
 * @author DELL
 */
public class readerCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String scat = request.getParameter("category");
        String ssub = request.getParameter("subcat");
        //
        int CategoryID = CategoryLib.getCatBiMap().getBackward(scat);
        //get all article of that category
        Map<Integer, ArrayList<ArticleBean>> fullArtByCat = ArticleLib.getDAM().get(CategoryID);
        ArrayList<Integer> SubCatID = new ArrayList<Integer>();
        ArrayList<ArticleBean> ArtByCat;
        //get all sub category id
        for (Integer id : fullArtByCat.keySet()) {
            SubCatID.add(id);
        }
        //
        request.setAttribute("SubCatID", SubCatID);
        if (ssub == null) {//no sub cat  
            ArtByCat = ArticleLib.getGAM().get(CategoryID);

        } else {
            int SubID = CategoryLib.getCatBiMap().getBackward(ssub);
            ArtByCat = fullArtByCat.get(SubID);
        }
        request.setAttribute("ArtByCat", ArtByCat);
        //cat bi map
        HttpSession session = request.getSession();
        if (session.getAttribute("CatBiMap") == null) {
            CategoryDAO catDAO = new CategoryDAO();
            MyBiMap<Integer, String> CatBiMap = CategoryLib.getCatBiMap();
            session.setAttribute("CatBiMap", CatBiMap);
        }
        //set img lib
        request.setAttribute("imgLib", new ImageLib());
        request.getRequestDispatcher("reader_category.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
