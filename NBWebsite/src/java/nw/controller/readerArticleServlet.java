/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.AccountBean;
import nw.bean.ArticleBean;
import nw.bean.CommentBean;
import nw.dao.AccountDAO;
import nw.dao.CategoryDAO;
import nw.dao.CommentDAO;
import nw.utils.ArticleLib;
import nw.utils.CategoryLib;
import nw.utils.ImageLib;
import nw.utils.MyBiMap;

/**
 *
 * @author DELL
 */
public class readerArticleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("CatBiMap") == null) {
            CategoryDAO catDAO = new CategoryDAO();
            MyBiMap<Integer, String> CatBiMap = CategoryLib.getCatBiMap();
            session.setAttribute("CatBiMap", CatBiMap);
        }
        String scat = request.getParameter("category");
        String ssub = request.getParameter("subcat");
        int artid = Integer.parseInt(request.getParameter("articleid"));
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
        //get list of articles by category or subcat
        if (ssub == null) {//no sub cat  
            ArtByCat = ArticleLib.getGAM().get(CategoryID);

        } else {
            int SubID = CategoryLib.getCatBiMap().getBackward(ssub);
            ArtByCat = fullArtByCat.get(SubID);
        }
        request.setAttribute("ArtByCat", ArtByCat);
        //find the article in ArtByCat
        ArticleBean currArt = null;
        for (ArticleBean art : ArtByCat) {
            if (art.getArticleID() == artid) {
                currArt = art;
                break;
            }
        }
        request.setAttribute("currArt", currArt);
        //get thumbnail img    
        request.setAttribute("imgLib", new ImageLib());
        //comment ---------------
        ArrayList<CommentBean> alCmtLv1 = new ArrayList<CommentBean>();
        Map<Integer, ArrayList<CommentBean>> mapCmtLv2 = new HashMap<Integer, ArrayList<CommentBean>>();
        Map<Integer, AccountBean> mapCmtAcc = new HashMap<Integer, AccountBean>();
        alCmtLv1 = new CommentDAO().getCommentLv1(currArt.getArticleID(), mapCmtLv2);
        mapCmtAcc = new AccountDAO().getAccountByComment(currArt.getArticleID());
        request.setAttribute("alCmtLv1", alCmtLv1);
        request.setAttribute("mapCmtLv2", mapCmtLv2);
        request.setAttribute("mapCmtAcc", mapCmtAcc);
        //dispatcher
        request.getRequestDispatcher("/reader_article.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
