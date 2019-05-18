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
import java.util.List;
import nw.bean.ArticleBean;
import static nw.jdbc.DBconnect.getConnection;

/**
 *
 * @author quan1
 */
public class ArticleDAO {
    
    public List<ArticleBean> getAllArticles() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArticleBean getArticle(int articleID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public int getArticleID(String heading, int JournaID) throws ClassNotFoundException {
        try{
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT ArticleID FROM Article WHERE Heading = ? and JournalistID = ?");
        ps.setString(1, heading);
        ps.setInt(2, JournaID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()){
            return rs.getInt("ArticleID");
        }
        
        }
        catch(SQLException e){
             System.out.println(e.toString());
             
        }  
        return 0;
    }

    public boolean insertArticle(ArticleBean article) throws ClassNotFoundException {
        try{
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO `Article` (ArticleID, Heading, ShortDescription, Content, CategoryID, SubCategoryID, JournalistID, Censored, Draft, Trash, DateCreated, LastModified) VALUES (null, ?,?,?,?,?,?,?,?,?, null, null)");
        ps.setString(1,article.getHeading());
        ps.setString(2, article.getShortDescription());
        ps.setString(3, article.getContent());
        ps.setInt(4, article.getCategoryID());
        if (article.getSubCategoryID() == 0){
            ps.setString(5, null);
        } else{
            ps.setInt(5, article.getSubCategoryID());
        }       
        ps.setInt(6, article.getJournalistID());
        ps.setInt(7, article.getCensored()); 
        ps.setInt(8, article.getDraft());
        ps.setInt(9, article.getTrash());
        ps.executeUpdate();
        
        }
        catch(SQLException e){
             System.out.println(e.toString());
             return false;
        }  
        return true;
    }

    public boolean updateArticle(ArticleBean article) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean deleteArticle(ArticleBean article) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
