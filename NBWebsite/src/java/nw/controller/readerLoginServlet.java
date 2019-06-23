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
import nw.bean.AccountBean;
import nw.bean.AccountTypeBean;
import nw.dao.AccountDAO;
import nw.dao.AccountTypeDAO;
import com.google.gson.Gson;
import java.util.ArrayList;
import nw.bean.BookmarkBean;
import nw.dao.BookmarkDAO;
import nw.utils.BookmarkLib;

/**
 *
 * @author Admin
 */
public class readerLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
        try {
            String Username = request.getParameter("Username");
            String Password = request.getParameter("Password");
            HttpSession session = request.getSession();
            response.setContentType("application/json");
            AccountBean jsonacc = new AccountBean();
            String resjson = new Gson().toJson(jsonacc);
            if (session.getAttribute("CurrentReader") == null) {
                AccountBean acc = new AccountBean();
                AccountDAO accDAO = new AccountDAO();
                int res = 0;
                res = accDAO.getAccountByPassword(Username, Password, acc);
                if (res == 1) {
                    jsonacc.setAccountID(acc.getAccountID());
                    jsonacc.setFirstName(acc.getFirstName());
                    jsonacc.setLastName(acc.getLastName());
                    jsonacc.setProfilePicture(acc.getProfilePicture());
                    AccountTypeBean type = new AccountTypeBean();
                    AccountTypeDAO typeDAO = new AccountTypeDAO();
                    type = typeDAO.getAccountTypeByID(acc.getAccountTypeID());//get type of the account. If it's reader, save it to sesssion
                    if (type.getReaderRight() == 1) {
                        BookmarkDAO bmDAO = new BookmarkDAO();
                        ArrayList<BookmarkBean> alBM = new ArrayList<BookmarkBean>();
                        alBM = bmDAO.getBookmarkByAccount(acc.getAccountID());
                        BookmarkLib  bmLib = new BookmarkLib();
                        bmLib.setBookmarkByAccount(alBM);
                        session.setAttribute("bmLib", bmLib);
                        session.setAttribute("CurrentReader", acc);
                        session.setAttribute("CurrentAccount", acc);
                        session.setAttribute("CurrentAccountType", type);
                        resjson = new Gson().toJson(jsonacc);
                    }
                }
            } else {//Acc was already in session
                AccountBean session_acc = (AccountBean) session.getAttribute("CurrentReader");
                jsonacc.setAccountID(session_acc.getAccountID());
                jsonacc.setFirstName(session_acc.getFirstName());
                jsonacc.setLastName(session_acc.getLastName());

            }
            response.getWriter().write(resjson);
        } catch (Exception e) {
            System.out.println(e.toString());
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
