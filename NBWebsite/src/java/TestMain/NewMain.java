/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestMain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.*;
import nw.jdbc.DBconnect;
import nw.bean.*;
import nw.dao.*;
import java.util.*;

/**
 *
 * @author Admin
 */
public class NewMain {

    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
//        ArrayList<CommentBean> alCmt = new ArrayList<CommentBean>();
//        CommentDAO cmtDAO = new CommentDAO();
//        Map<Integer, ArrayList<CommentBean>> testmap = new HashMap<Integer, ArrayList<CommentBean>>();
//        alCmt = cmtDAO.getCommentLv1(38,testmap);
//        Map<Integer, AccountBean> testacc = new AccountDAO().getAccountByComment(38);
//        int cmttest = cmtDAO.insertComment(new CommentBean(38,0,91,"i hi hi hi u hu huhu",0,1));
        String s = "Here's the truth about those $7,000 tiny houses for sale on Amazon";
//        String x =URLEncoder.encode(s, "UTF-8").replaceAll("\\%28", "(")                          
//			   .replaceAll("\\%29", ")")   		
//			   .replaceAll("\\+", "%20")                          
//			   .replaceAll("\\%27", "'")   			   
//			   .replaceAll("\\%21", "!")
//			   .replaceAll("\\%7E", "~"); 
        String x = URLEncoder.encode(s, "UTF-8");
        System.out.println("abcdddddd");

    }

}
