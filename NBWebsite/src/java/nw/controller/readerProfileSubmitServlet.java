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
import nw.bean.AccountBean;
import nw.dao.AccountDAO;
import org.mindrot.jbcrypt.BCrypt;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class readerProfileSubmitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String responseText = "Failed to update!!!";
        AccountBean acc = new AccountBean();
        AccountDAO accDAO = new AccountDAO();
        HttpSession session = request.getSession();
        AccountBean accBean = (AccountBean) session.getAttribute("CurrentReader");
        String Username = request.getParameter("Username");
        String mode = request.getParameter("mode");
        if ("save".equals(mode)) {
            String Email = request.getParameter("Email");
            String FirstName = request.getParameter("FirstName");
            String LastName = request.getParameter("LastName");
            String Phone = request.getParameter("Phone");
            String fakePP = request.getParameter("fakePP");
            if (!"".equals(fakePP)) {
                Part filePart = request.getPart("ProfilePicture");
                //upload file
                // gets absolute path of the web application
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String appPath = request.getServletContext().getRealPath("");
                // constructs path of the directory to save uploaded file
                //String savePath = appPath + File.separator +SAVE_DIR;
                //get true project directory
                String[] dir = appPath.split("build");
                String savePath = dir[0] + "web\\img\\profilepic";
                // creates the save directory if it does not exists
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
                filePart.write(savePath + File.separator + fileName);
                acc.setProfilePicture("img/profilepic/" + fileName);
                accBean.setProfilePicture("img/profilepic/" + fileName);

            } else {//not upload file
                acc.setProfilePicture(null);
            }
            acc.setAccountID(accBean.getAccountID());
            acc.setUsername(Username);
            acc.setEmail(Email);
            acc.setFirstName(FirstName);
            acc.setLastName(LastName);
            acc.setPhone(Phone);
            acc.setAccountTypeID(accBean.getAccountTypeID());
            acc.setValid(1);
            acc.setPassword("");
            //
            int updateAcc = accDAO.updateAccount(acc);
            if (updateAcc > 0) {
                responseText = "success";
                accBean.setUsername(Username);
                accBean.setEmail(Email);
                accBean.setFirstName(FirstName);
                accBean.setLastName(LastName);
                accBean.setPhone(Phone);
                session.setAttribute("CurrentReader", accBean);
            } else {
                responseText = "failed";
            }

        } else {//reset
            String currPw = request.getParameter("CurrentPassword");
            String newPw = request.getParameter("Password");
            if (BCrypt.checkpw(currPw, accBean.getPassword())) {
                String updatePw = accDAO.updatePassword(accBean.getAccountID(), newPw);
                if (updatePw != null) {
                    responseText = "success";
                    accBean.setPassword(updatePw);
                    session.setAttribute("CurrentReader", accBean);
                } else {
                    responseText = "Failed to update!!!";
                }
            } else {
                responseText = "Current password is wrong!!!";
            }
        }
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(responseText);
    }
}
