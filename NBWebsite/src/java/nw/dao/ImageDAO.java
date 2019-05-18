/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import nw.bean.*;
import static nw.jdbc.DBconnect.getConnection;

/**
 *
 * @author quan1
 */
public class ImageDAO {
    public ArrayList<Image> getAllImage(int accID) throws ClassNotFoundException{
    try{
        ArrayList<Image> listImage = new ArrayList<>();
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Image WHERE AccountID = ?");
        ps.setInt(1, accID);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            listImage.add(new Image(rs.getInt("ImageID"), rs.getString("Source"), rs.getInt("ArticleID"), rs.getInt("AccountID"), rs.getString("DateCreated")));
        }
        return listImage;
        }
        catch(SQLException e){
             System.out.println(e.toString());
             
        }  
        return null;
    }
    
    public boolean InsertImage(Image img) throws ClassNotFoundException{
        try{
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO `Image` (ImageID, Source, ArticleID, AccountID, DateCreated) VALUES (null ,?, ?, ?, null)");
        ps.setString(1, img.getSource());
        ps.setInt(2, img.getArticleID());
        ps.setInt(3, img.getAccountID());
        
        ps.executeUpdate();
        
        }
        catch(SQLException e){
             System.out.println(e.toString());
             return false;
        }  
        return true;
    }
}
