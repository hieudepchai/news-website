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
import java.util.ArrayList;
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
import nw.bean.MessageBean;
import nw.bean.notificationBean;
import nw.dao.MessageDAO;
import nw.dao.notificationDAO;
import nw.utils.NotificationLib;

/**
 *
 * @author quan1
 */
public class journalistNotificationServlet extends HttpServlet {
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
            out.println("<title>Servlet journalistNotificationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet journalistNotificationServlet at " + request.getContextPath() + "</h1>");
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
        
        getServletContext().getRequestDispatcher("/journalist_notification.jsp").forward(request, response);
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
        
        AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
        journalistID = journalist.getAccountID();
        
        HashMap<Integer, String> TopicImageMap = (HashMap<Integer, String>) session.getAttribute("TopicImageMap");
        List<Pair<Integer, ActivityBean>> listNotification = (List<Pair<Integer, ActivityBean>>) session.getAttribute("listNotification");
//        List<Pair<Integer, ActivityBean>> listNotification = NotificationLib.getListNotifyAccount(journalistID);
//        if(listNotification == null){
//            NotificationLib.createlistNotificationJournalist(journalistID);
//            listNotification = NotificationLib.getListNotifyAccount(journalistID);
//        }
//        //List<String> time = NotificationLib.CalTimeListNotification(listNotify, TopicImageMap);
//        session.setAttribute("listNotification", listNotification);

        
        List<Pair<Integer, ActivityBean>> listNewNotification = NotificationLib.getListNewNotifyAccount(journalistID);
        if(listNewNotification == null){
//            List<String> listNewTime = new ArrayList<>();
//            
//            for(int i=0; i<listNotify.size(); i++){
//                if(listNotify.get(i).getKey() != 5)
//                    listNewTime.add(listNotify.get(i).getValue().getTime());
//            }
            List<String> listNewTime = NotificationLib.CalTimeListNotification(listNotification, TopicImageMap);
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(listNewTime, new TypeToken<List<String>>() {}.getType());
            JsonArray jsonArray = element.getAsJsonArray();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(jsonArray);
        }else {
            List<Pair<Integer, ActivityBean>> listNewNotify = new ArrayList<>(listNewNotification);
            NotificationLib.CalTimeListNotification(listNewNotify, TopicImageMap);
            
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(listNewNotify, new TypeToken<List<Pair<Integer, ActivityBean>>>() {
            }.getType());
            JsonArray jsonArray = element.getAsJsonArray();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(jsonArray);
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
