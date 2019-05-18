/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
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
import nw.bean.*;
import nw.dao.*;

/**
 *
 * @author quan1
 */
//@WebServlet("/journalistComposeServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 4, // 4MB
    maxFileSize = 1024 * 1024 * 100, // 50MB
    maxRequestSize = 1024 * 1024 * 100) // 50MB
public class journalistComposeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "quan";
    private int journalistID = 26;
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        CategoryDAO cateDAO = new CategoryDAO();
        ImageDAO imgDAO = new ImageDAO();
        ArticleDAO artDAO = new ArticleDAO();
        
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
            String[] parts = contentEditor.split("(?=<div>)", 2);
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
        
        //get save path
        String relativePath = "\\web\\img";
        //InputStream input = getClass().getResourceAsStream(relativePath);
         // gets absolute path of the web application
        //String appPath = getServletContext().getRealPath(relativePath);
        String appPath = request.getServletContext().getRealPath("");
        String[] src = appPath.split("(?<=NBWebsite)", 2);
        appPath = src[0] + relativePath;
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + SAVE_DIR;
         
        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        
        Part filePart = request.getPart("videoImage"); // Retrieves <input type="file" name="videoImage" accept="file_extension|audio/*|video/*|image/*|media_type*" size="60">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        //InputStream fileContent = filePart.getInputStream();
        filePart.write(savePath + File.separator + fileName);
        
        String ImgSrc = "../img/" + SAVE_DIR + "/" + fileName;
        
        //Insert article
        ArticleBean article = new ArticleBean(subject, shortDes, content, cate1, cate2, journalistID, 1, 0, 0);
        int articleID = 0; 
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
        //Insert image coressponding
        Image img = new Image(ImgSrc, articleID, journalistID);
        try {
            imgDAO.InsertImage(img);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(journalistComposeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        out.println("<script type=\"text/javascript\">");
        out.println("alert('Waiting for censor!');");
        out.println("location='journalist_compose.jsp';");
        out.println("</script>");
        
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
