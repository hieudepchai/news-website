/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.AccountBean;
import nw.bean.ActivityBean;
import nw.bean.ArticleBean;
import nw.bean.Image;
import nw.dao.UpdateArticleActivityDAO;
import nw.utils.ActivityLib;
import nw.utils.ArticleLib;

/**
 *
 * @author quan1
 */
public class journalistAllActivityServlet extends HttpServlet {
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
            out.println("<title>Servlet journalistAllActivityServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet journalistAllActivityServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
        journalistID = journalist.getAccountID();
        
        List<Pair<Integer, ActivityBean>> listActivity = ActivityLib.getActivityJournalist(journalistID);  //kind activity, ArticleActivityBean
        
        HashMap<String, HashMap<String, List< Pair<Integer, ActivityBean> >>> activityMapMonth = new HashMap<>();
        List<Pair<String, List< String >>> listTimeMonth = new ArrayList<>();
        
        HashMap<String, List< Pair<Integer, ActivityBean> >> activityMapDate = new HashMap<>(); //map activities by date
        List< Pair<Integer, ActivityBean> > listActivityDate = new ArrayList<>();  //list activities in a date
        List< String > listTimeDate = new ArrayList<>(); //list date in month
        
        DateFormat month = new SimpleDateFormat("MMM YYYY");
        DateFormat date = new SimpleDateFormat("MMM dd");
        Date currentTime = new Date();
        String currentMonth = month.format(currentTime);
        String currentDate = date.format(currentTime);
        
        for(int i = 0; i < listActivity.size(); i++){
            try {
                Date actionTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(listActivity.get(i).getValue().getTime());
                String actionMonth = month.format(actionTime);
                if(i == 0){
                    currentMonth = actionMonth;
                    currentDate = date.format(actionTime);
                }
                if(actionMonth.equals(currentMonth)){
                    String actionDate = date.format(actionTime);
                    if(actionDate.equals(currentDate)){
                        listActivityDate.add(listActivity.get(i));  //list activities in a date
                    }else{
                        listTimeDate.add(currentDate); //list date in month
                        List< Pair<Integer, ActivityBean> > listActionDate = new ArrayList<>(listActivityDate);  //list activities in a date
                        activityMapDate.put(currentDate, listActionDate); //map activities by date
                        listActivityDate.clear();
                        currentDate = actionDate;
                        listActivityDate.add(listActivity.get(i));
                    }
                    
                }else{
                    listTimeDate.add(currentDate); //list date in month
                    List< Pair<Integer, ActivityBean> > listActionDate = new ArrayList<>(listActivityDate);  //list activities in a date
                    activityMapDate.put(currentDate, listActionDate); //map activities by date
                    listActivityDate.clear();
                    currentDate = date.format(actionTime);
                    
                    List< String > listDateMonth = new ArrayList<>(listTimeDate); //list date in month
                    listTimeMonth.add(new Pair<>(currentMonth,listDateMonth)); //add list date in month into listTimeMonth
                    HashMap<String, List< Pair<Integer, ActivityBean> >> actionMapDate = new HashMap<>(activityMapDate); //map activities by date
                    activityMapMonth.put(currentMonth, actionMapDate); //add map activities in month into activityMapMonth
                    activityMapDate.clear();
                    listTimeDate.clear();
                    currentMonth = actionMonth;
                    i--;
                }
                if(i == listActivity.size()-1){
                    listTimeDate.add(currentDate); //list date in month
                    activityMapDate.put(currentDate, listActivityDate); //map activities by date
                    
                    listTimeMonth.add(new Pair<>(currentMonth,listTimeDate)); //add list date in month into listTimeMonth
                    activityMapMonth.put(currentMonth, activityMapDate); //add map activities in month into activityMapMonth
                }
            } catch (ParseException ex) {
                Logger.getLogger(journalistAllActivityServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        request.setAttribute("activityMapMonth", activityMapMonth);
        request.setAttribute("listTimeMonth", listTimeMonth);
        getServletContext().getRequestDispatcher("/journalist_all_activity.jsp").forward(request, response);
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
        String StrArticleID = request.getParameter("ArticleID");
        if(StrArticleID != null){
            int articleID = Integer.parseInt(StrArticleID);
            ArticleBean article = new ArticleBean();
            String StrJournalistID = request.getParameter("JournalistID");
            int JlID = Integer.parseInt(StrJournalistID);
            if(JlID == journalistID){
                List<ArticleBean> listArticle = (List<ArticleBean>) session.getAttribute("listArticle");
                for(int i=0; i<listArticle.size(); i++){
                    if(listArticle.get(i).getArticleID() == articleID){
                        article = listArticle.get(i);
                        break;
                    }
                }
            }else{
                List<ArticleBean> listArticle = ArticleLib.getListAllArticle();
                for(int i=0; i<listArticle.size(); i++){
                    if(JlID == listArticle.get(i).getJournalistID()){
                        if(listArticle.get(i).getArticleID() == articleID){
                            article = listArticle.get(i);
                            break;
                        }
                    }
                }
            }
            
            
            HashMap<Integer, String> listCate = (HashMap<Integer, String>) session.getAttribute("listCate");            
            Pair<ArticleBean, Pair<String, String>> articleCategory = new Pair<>(article, new Pair<>(listCate.get(article.getCategoryID()), listCate.get(article.getSubCategoryID())));
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(articleCategory, new TypeToken<Pair<ArticleBean, Pair<String, String>>>(){}.getType());
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(element);
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
