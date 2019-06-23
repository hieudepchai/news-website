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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import nw.bean.*;
import nw.dao.AccountDAO;

/**
 *
 * @author quan1
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
    maxFileSize = 1024 * 1024 * 100, // 100MB
    maxRequestSize = 1024 * 1024 * 100) // 100MB
public class journalistProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    //private String SAVE_DIR = "";
    private int journalistID = 0;
    
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
        getServletContext().getRequestDispatcher("/journalist-profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String profileImgSource = "";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String value = request.getParameter("save");
        
        if (value == null){
        //get save path
        String relativePath = "\\web\\img";
        //InputStream input = getClass().getResourceAsStream(relativePath);
         // gets absolute path of the web application
        //String appPath = getServletContext().getRealPath(relativePath);
        String appPath = request.getServletContext().getRealPath("");
        String[] src = appPath.split("(?<=NBWebsite)", 2);
        appPath = src[0] + relativePath;
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + "profilepic";
        
        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }    
            
            if (!profileImgSource.equals("")){
                String[] srcPart = profileImgSource.split("/");
                String fileNameDel = srcPart[srcPart.length - 1];
                File deleteFile = new File(savePath + File.separator + fileNameDel) ;
                // check if the file  present or not
                if( deleteFile.exists() )
                deleteFile.delete() ;
            }
        
        Part filePart = request.getPart("profileFile"); // Retrieves <input type="file" name="videoImage" accept="file_extension|audio/*|video/*|image/*|media_type*" size="60">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        //InputStream fileContent = filePart.getInputStream();
        filePart.write(savePath + File.separator + fileName);
        
            profileImgSource = "img/profilepic/" + fileName;
            
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(profileImgSource);
            return;
        }
        else if (value.equals("change")){
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String password = request.getParameter("password");
            
            HttpSession session = request.getSession();             
            AccountBean journalist = (AccountBean) session.getAttribute("CurrentAccount");
            
            if (firstName != null){
                journalist.setFirstName(firstName);
            }
            if (lastName != null){
                journalist.setLastName(lastName);
            }
            if (userName != null){
                journalist.setUsername(userName);
            }
            if (email != null){
                journalist.setEmail(email);
            }
            if (phoneNumber != null){
                journalist.setPhone(phoneNumber);
            }
            if(password != null){
               journalist.setPassword(password); 
            }else{
                journalist.setPassword("");
            }
            if (!profileImgSource.equals("")){
                journalist.setProfilePicture(profileImgSource);
            }
            
            AccountDAO accDAO = new AccountDAO();
            accDAO.updateAccount(journalist);
            
            session.setAttribute("CurrentAccount", journalist);
            
            getServletContext().getRequestDispatcher("/journalist-profile.jsp").forward(request, response);
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
