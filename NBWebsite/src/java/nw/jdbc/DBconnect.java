/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.jdbc;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DBconnect {

    private static String DB_URL = "jdbc:mysql://27.78.25.175/news_minhhieu";
    private static String username = "news_minhhieu";
    private static String password = "news_minhhieunews_minhhieu";
    public static Connection conn;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, username, password);
//             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/news_minhhieu","root","1234");
//            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/news_minhhieu", "root", "1111");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        return conn;
    }

    public static void closeConnection() throws SQLException {
        conn.close();
    }

}
