/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.jdbc;

import java.sql.*;
/**
 *
 * @author Admin
 */
public class DBconnect {  
     public static Connection getConnection() throws SQLException, ClassNotFoundException
   {
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection(DB_URL,username,password);
       return conn;
   }
   private static String DB_URL = "jdbc:mysql://27.78.25.175/news_minhhieu";
   private static String username = "news_minhhieu";
   private static String password = "news_minhhieunews_minhhieu";
  
}
