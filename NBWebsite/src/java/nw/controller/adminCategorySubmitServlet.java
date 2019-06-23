/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import nw.bean.CategoryBean;
import nw.dao.CategoryDAO;

/**
 *
 * @author DUNG
 */
public class adminCategorySubmitServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
        doPost(request, response);
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
        CategoryDAO categoryDAO = new CategoryDAO();
        CategoryBean cate = new CategoryBean();
        String para_action = request.getParameter("action");
        if (para_action != null) {
            int action = Integer.parseInt(para_action);
            try {
                if (action == 1 || action == 2) {
                    cate.setName(request.getParameter("CategoryName"));
                    cate.setParentCategoryID(Integer.parseInt(request.getParameter("ParentCategoryID")));
                    int res = 0;
                    if (action == 1) {
                        //insert operation
                        res = categoryDAO.insertCategory(cate);
                        if (res == 0 || res == -1) {
                            session.setAttribute("TypeSubmitResult", "Failed to insert");
                        } else {
                            session.setAttribute("TypeSubmitResult", "Inserted successfully");
                            session.removeAttribute("ListCategory");
                        }
                    } else {//action ==2
                        //update operation
                        cate.setCategoryID(Integer.parseInt(request.getParameter("CategoryID")));
                        res = categoryDAO.updateCategory(cate);
                        if (res == 0 || res == -1) {
                            session.setAttribute("TypeSubmitResult", "Failed to update");
                        } else {
                            session.setAttribute("TypeSubmitResult", "Updated successfully");
                            session.removeAttribute("ListCategory");
                        }
                    }
                } else {//action ==3
                    int categoryid = Integer.parseInt(request.getParameter("CategoryID"));
                    int deleteres = 0;
                    deleteres = categoryDAO.deleteCategoryByID(categoryid);
                    if (deleteres == 0 || deleteres == -1) {
                        session.setAttribute("TypeSubmitResult", "Failed to delete");
                    } else {
                        session.setAttribute("TypeSubmitResult", "Deleted successfully");
                        session.removeAttribute("ListCategory");
                    }
                }
                response.sendRedirect(request.getContextPath() + "/manage/admin/category");
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(adminAccountSubmitServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

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
