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
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import nw.bean.*;
import nw.dao.*;


/**
 *
 * @author quan1
 */
//@WebServlet(name = "journalistLibaryServlet", urlPatterns = {"/journalistLibaryServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 4, // 4MB
    maxFileSize = 1024 * 1024 * 100, // 100MB
    maxRequestSize = 1024 * 1024 * 100) // 100MB
public class journalistLibaryServlet extends HttpServlet {
    private int journalistID = 26;
    //private final List<String> listSrc = new ArrayList<>();
    private static final String SAVE_DIR = "quan";
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
            out.println("<title>Servlet journalistLibaryServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet journalistLibaryServlet at " + request.getContextPath() + "</h1>");
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
        ImageDAO imgDAO = new ImageDAO();
        List<String> listSrc = new ArrayList<>();
        try {
            List<Image> listImg = imgDAO.getAllImage(journalistID);
            listImg.forEach((img) -> {
                listSrc.add(img.getSource());
            });
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(journalistLibaryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("listImage", listSrc);
        getServletContext().getRequestDispatcher("/journalist_libary.jsp").forward(request, response);
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
        List<String> listSrc = new ArrayList<>();
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
        
        List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
        fileParts.forEach((filePart) -> {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            try {
                //InputStream fileContent = filePart.getInputStream();
                filePart.write(savePath + File.separator + fileName);
                String ImgSrc = "../img/" + SAVE_DIR + "/" + fileName;
                listSrc.add(ImgSrc);
            } catch (IOException ex) {
                Logger.getLogger(journalistLibaryServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        });
        
        request.setAttribute("listImage", listSrc);
        getServletContext().getRequestDispatcher("/journalist_libary.jsp").forward(request, response);
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
