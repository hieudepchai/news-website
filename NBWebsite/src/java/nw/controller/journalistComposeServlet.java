/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javafx.util.Pair;
import javax.servlet.http.HttpSession;
import nw.bean.*;
import nw.dao.*;
import nw.utils.ActivityLib;
import nw.utils.ArticleLib;
import nw.utils.ImageLib;

/**
 *
 * @author quan1
 */
//@WebServlet("/journalistComposeServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
    maxFileSize = 1024 * 1024 * 100, // 100MB
    maxRequestSize = 1024 * 1024 * 100) // 100MB
public class journalistComposeServlet extends HttpServlet {
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
            out.println("<title>Servlet journalistComposeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet journalistComposeServlet at " + request.getContextPath() + "</h1>");
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
        
        if (session.getAttribute("Article") != null){
            session.removeAttribute("Article");
        }
        if (session.getAttribute("listImageArticle") != null){
            session.removeAttribute("listImageArticle");
        }
        if (session.getAttribute("listMessage") != null){
            session.removeAttribute("listMessage");
        }
        if (session.getAttribute("AdminEditor") != null){
            session.removeAttribute("AdminEditor");
        }
        request.setAttribute("title", "Compose Article");
        getServletContext().getRequestDispatcher("/journalist_compose.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ArrayList <Pair <Integer, String> > listSrc = new ArrayList < > (); 
    int btnClick = -1;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String value = request.getParameter("save");
        
        String journalistIDStr = request.getParameter("journalistID");
        if(journalistIDStr != null){
            if(!journalistIDStr.equals("")){
                if(journalistID == 0){
                    journalistID = Integer.parseInt(journalistIDStr);
                }else{
                    int journalistID2 = Integer.parseInt(journalistIDStr);
                    if(journalistID != journalistID2)
                        journalistID = journalistID2;
                }
            }
        }
        
        //get save path
        String relativePath = "\\web\\img";
        //InputStream input = getClass().getResourceAsStream(relativePath);
         // gets absolute path of the web application
        //String appPath = getServletContext().getRealPath(relativePath);
        String appPath = request.getServletContext().getRealPath("");
        String[] src = appPath.split("(?<=NBWebsite)", 2);
        appPath = src[0] + relativePath;
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + journalistID;
        
        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }    
        
        if (value == null){
            String buttonClick = request.getParameter("buttonClick");
            
            if (buttonClick != null){
                btnClick = Integer.parseInt(buttonClick);
            }else{
                
                String keyImg = request.getParameter("keyImg");
                if (keyImg != null){
                    String buttonClick2 = request.getParameter("buttonClick2");
                    int btnClick2 = Integer.parseInt(buttonClick2);                
                    
                    String sourcechosen = request.getParameter("sourcechosen");
                    String[] srcChosenPart = sourcechosen.split("/", 3);
                    String srcChosen = srcChosenPart[2];
                    
                    if (keyImg.equals("0")){
                        Pair <Integer, String> altSrc = new Pair<> (btnClick2, srcChosen);
                        listSrc.add(altSrc);
                        return;
                    }
                    
                    String source = request.getParameter("source");
                    String[] srcPart = source.split("/");
                    String fileName = srcPart[srcPart.length - 1];
                    String[] srcPart1 = source.split("/", 3);
                    String source1 = srcPart1[2];                                      
                    
                    File deleteFile = new File(savePath + File.separator + fileName) ;
                    // check if the file  present or not
                    if( deleteFile.exists() )
                    deleteFile.delete() ;
                    
                    Pair <Integer, String> oneSrc = new Pair<> (btnClick2, source1);
                    listSrc.remove(oneSrc);
                    
                    Pair <Integer, String> altSrc = new Pair<> (btnClick2, srcChosen);
                    listSrc.add(altSrc);
                    
                    return;
                }
                
                Part filePart = request.getPart("videoImage"); // Retrieves <input type="file" name="videoImage" accept="file_extension|audio/*|video/*|image/*|media_type*" size="60">
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                //InputStream fileContent = filePart.getInputStream();
                filePart.write(savePath + File.separator + fileName);
        
                String ImgSrc = "img/" + journalistID + "/" + fileName;
                if (btnClick != -1){
                    if (btnClick == 1){
                        int index = -1;
                        for (int i=0; i<listSrc.size(); i++){
                            if (listSrc.get(i).getKey() == 1){
                                index = i;
                                break;
                            }
                        }
                        if (index == -1){
                            Pair <Integer, String> oneSrc = new Pair<> (btnClick, ImgSrc);
                            listSrc.add(oneSrc);
                        } else{
                            Pair <Integer, String> oneSrc = new Pair<> (btnClick, ImgSrc);
                            listSrc.set(index, oneSrc);
                        }
                    } else if (btnClick == 0){
                        Pair <Integer, String> oneSrc = new Pair<> (btnClick, ImgSrc);
                        listSrc.add(oneSrc);
                    }                  
                }                   
            
                response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().print(ImgSrc);
            }
                       
            return;
        }
                       
        CategoryDAO cateDAO = new CategoryDAO();
        ImageDAO imgDAO = new ImageDAO();
        ArticleDAO artDAO = new ArticleDAO();
        MessageDAO mesDAO = new MessageDAO();
        //UpdateArticleActivityDAO activityDAO = new UpdateArticleActivityDAO();
        
        String shortDes = "";
        String content = "";
        int cate1 = 0; //CategoryID
        int cate2 = 0; //SubCategoryID
        
        String subject = request.getParameter("subjectInput");
        //String contentEditor = request.getParameter("editorContent");
        String contentEditor = request.getParameter("selectedVehicles");
        String note = request.getParameter("note");
        
        //create short description and article's content
        if (!contentEditor.equals("")){
            String[] parts = contentEditor.split("(?<=</div>)", 2);
            if (parts.length == 2){
                shortDes = parts[0];
                content = parts[1];
            }
            else{
                shortDes = parts[0];
            }
            
        }
         
        //find category ID
        String[] category = request.getParameterValues("category");
        if (category.length == 2){
            try {
                cate1 = cateDAO.getIDCategory(category[0]);
                cate2 = cateDAO.getIDCategory(category[1]);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }            
            } else if (category.length == 1){
            try {
                cate1 = cateDAO.getIDCategory(category[0]);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            }                         
        
//        Part filePart = request.getPart("videoImage"); // Retrieves <input type="file" name="videoImage" accept="file_extension|audio/*|video/*|image/*|media_type*" size="60">
//        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//        //InputStream fileContent = filePart.getInputStream();
//        filePart.write(savePath + File.separator + fileName);
//        
//        String ImgSrc = "img/" + journalistID + "/" + fileName;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String currentTime = formatter.format(date); //get current date
        
        List<Pair<Integer, ActivityBean>> listActivity = (List<Pair<Integer, ActivityBean>>) session.getAttribute("listActivityJournalist");

        ArticleBean article = new ArticleBean();
        //create new article
        if (value.equals("Draft")){
            article = new ArticleBean(subject, shortDes, content, cate1, cate2, journalistID, 0, 1, 0);
        } else if(value.equals("Article")){
            article = new ArticleBean(subject, shortDes, content, cate1, cate2, journalistID, 0, 0, 0);
        }                
        int articleID = 0; 
        
        String updateArticleID = request.getParameter("ArticleID");
        String articleOldStatus = request.getParameter("ArticleStatus");
        if (!updateArticleID.equals("")){  //update article            
            articleID = Integer.parseInt(updateArticleID);
            
            //insert activity
            int oldStatus = Integer.parseInt(articleOldStatus);
            if (oldStatus != article.getDraft()){
                UpdateArticleActivityBean activity = new UpdateArticleActivityBean(journalistID, articleID, 0, article.getDraft(), 0, 0, currentTime);                
                ActivityLib.insertActivity(activity, article.getHeading(), article.getShortDescription(), article.getJournalistID());
                //activityDAO.insertActivity(activity);
            }
            
            try {
                article.setArticleID(articleID);
                artDAO.updateArticle(article);
            } catch (SQLException ex) {
                Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //update article into ArticleLib
            article.setDateCreated(currentTime);
            article.setLastModified(currentTime);
            ArticleLib.updateArticle(article);
            
            //create list image
            ArrayList<Image> listImage = new ArrayList<>(); 
            for (int i = 0; i < listSrc.size(); i++){
                Image img0 = new Image(listSrc.get(i).getValue(), articleID, journalistID, listSrc.get(i).getKey());
                listImage.add(img0);
            }
            //update list image
            if (listImage.size() > 0){
            try {
                imgDAO.updateListImageArticle(listImage);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
            
            
        } else { //new article

            try {
                artDAO.insertArticle(article);

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                articleID = artDAO.getArticleID(subject, journalistID);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            //insert article into ArticleLib (because I difficult to get articleID if I only insert into static, I insert new article into both)
            article.setArticleID(articleID);
            article.setDateCreated(currentTime);
            article.setLastModified(currentTime);
            ArticleLib.insertArticle(article);
            
            //insert activity to activityLib
            UpdateArticleActivityBean activity = new UpdateArticleActivityBean(journalistID, articleID, 0, article.getDraft(), 0, 1, currentTime);
            ActivityLib.insertActivity(activity, article.getHeading(), article.getShortDescription(), article.getJournalistID());

            //Insert image coressponding
            for (int i = 0; i < listSrc.size(); i++) {
                Image img0 = new Image(listSrc.get(i).getValue(), articleID, journalistID, listSrc.get(i).getKey());
                img0.setDateCreated(currentTime);
                ImageLib.insertNewImg(img0);
                try {
                    imgDAO.InsertImage(img0);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            
            }

        }

        if (!note.equals("")) {
            MessageBean mesg = new MessageBean(articleID, journalistID, 0, 0, note);
            try {
                mesDAO.insertMessage(mesg);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
         
        //update session             
            article.setLastModified(currentTime);
            
            List <ArticleBean> listArticle = (List <ArticleBean>) session.getAttribute("listArticle"); //list article
            int position = 0;
            for(int i = 0; i< listArticle.size(); i++){
                if (listArticle.get(i).getArticleID() == article.getArticleID()){
                    position = i;
                    break;
                }
            }
            if (position == 0){
                listArticle.add(article);
            }else{
                listArticle.set(position, article);
            }
            session.setAttribute("listArticle", listArticle); //list image
            
            List<Image> listSrcSession = (List<Image>) session.getAttribute("listImage");
            for (int i = 0; i < listSrc.size(); i++){
                listSrcSession.add(new Image(listSrc.get(i).getValue(), articleID, journalistID, listSrc.get(i).getKey()));
            }
            session.setAttribute("listImage", listSrcSession);
            session.setAttribute("listActivityJournalist", listActivity);
        
        //set default value    
        btnClick = -1;
        listSrc.removeAll(listSrc);
        
        getServletContext().getRequestDispatcher("/journalist_compose.jsp").forward(request, response);
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

    private String extractFileName(Part part) {
    String contentDisp = part.getHeader("content-disposition");
    String[] items = contentDisp.split(";");
    for (String s : items) {
      if (s.trim().startsWith("filename")) {
        return s.substring(s.indexOf("=") + 2, s.length() - 1);
      }
    }
    return "";
  }
    
    public File getFolderUpload() {
    //File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
    File folderUpload = new File("D://term 6" + "/Uploads");
    if (!folderUpload.exists()) {
      folderUpload.mkdirs();
    }
    return folderUpload;
  }
}
