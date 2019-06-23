/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import nw.bean.ArticleBean;
import static nw.jdbc.DBconnect.getConnection;
import nw.utils.MyBiMap;
import org.apache.commons.lang.SerializationUtils;
import java.sql.Statement;
import nw.utils.ArticleLib;

/**
 *
 * @author quan1
 */
public class ArticleDAO {

        public int CountArticle() throws SQLException, ClassNotFoundException {
        int count = 0;
        Connection conn = getConnection();
        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery("select * from Article");
        while (rs.next()) {
            count += 1;
        }
        return count;
    }

    public ArrayList<ArticleBean> getAllArticles() throws SQLException {
        ArrayList<ArticleBean> listArt = new ArrayList<>();
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Article");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listArt.add(new ArticleBean(rs.getInt("ArticleID"), rs.getString("Heading"), rs.getString("ShortDescription"), rs.getString("Content"), rs.getInt("CategoryID"), rs.getInt("SubCategoryID"), rs.getInt("JournalistID"), rs.getInt("Censored"), rs.getInt("Draft"), rs.getInt("Trash"), rs.getString("DateCreated"), rs.getString("LastModified")));
            }
            return listArt;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.toString());
            return null;
        }
    }
    public ArrayList<ArticleBean> getAllArticlesWating() throws SQLException {
        ArrayList<ArticleBean> listArt = new ArrayList<>();
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Article where Censored=0 and  Draft =0 and Trash =0 ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listArt.add(new ArticleBean(rs.getInt("ArticleID"), rs.getString("Heading"), rs.getString("ShortDescription"), rs.getString("Content"), rs.getInt("CategoryID"), rs.getInt("SubCategoryID"), rs.getInt("JournalistID"), rs.getInt("Censored"), rs.getInt("Draft"), rs.getInt("Trash"), rs.getString("DateCreated"), rs.getString("LastModified")));
            }
            return listArt;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.toString());
            return null;
        }
    }

    public ArrayList<ArticleBean> getAllArticles(Map<Integer, ArticleBean> onemap) throws SQLException {
        ArrayList<ArticleBean> listArt = new ArrayList<>();
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Article");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ArticleBean art = new ArticleBean(rs.getInt("ArticleID"), rs.getString("Heading"), rs.getString("ShortDescription"), rs.getString("Content"), rs.getInt("CategoryID"), rs.getInt("SubCategoryID"), rs.getInt("JournalistID"), rs.getInt("Censored"), rs.getInt("Draft"), rs.getInt("Trash"), rs.getString("DateCreated"), rs.getString("LastModified"));
                listArt.add(art);
                onemap.put(art.getArticleID(), art);
            }
            return listArt;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.toString());
            return null;
        }
    }


    /**
     *
     * @return
     */
    public Map<Integer, Map<Integer, ArrayList<ArticleBean>>> getArticleByCat(Map<Integer, ArrayList<ArticleBean>> SimpleCatMap) {

        try {
            int CurrCatID = 0;
            int CurrSubID = 0;
            int NewCatID = 0;
            int NewSubID = 0;
            Map<Integer, Map<Integer, ArrayList<ArticleBean>>> res = new HashMap<Integer, Map<Integer, ArrayList<ArticleBean>>>();
            Map<Integer, ArrayList<ArticleBean>> temp = new HashMap<Integer, ArrayList<ArticleBean>>();
            ArrayList<ArticleBean> al = new ArrayList<ArticleBean>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("select a.ArticleID, a.Heading, a.ShortDescription, a.Content, CONCAT(ac.FirstName,\" \", ac.LastName) as Author, a.CategoryID, SubCategoryID, DATE_FORMAT(a.LastModified,'%d/%m/%Y') as LastModified\n"
                    + " from Article a, Account ac where  a.JournalistID = ac.AccountID and a.Censored=1\n"
                    + " ORDER BY a.CategoryID, a.SubCategoryID, a.LastModified desc;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ArticleBean art = new ArticleBean();
                art.setArticleID(rs.getInt("ArticleID"));
                art.setHeading(rs.getString("Heading"));
                art.setShortDescription(rs.getString("ShortDescription"));
                art.setContent(rs.getString("Content"));
                art.setAuthor(rs.getString("Author"));
                art.setCategoryID(rs.getInt("CategoryID"));
                art.setSubCategoryID(rs.getInt("SubCategoryID"));
                art.setLastModified(rs.getString("LastModified"));
                NewCatID = art.getCategoryID();
                NewSubID = art.getSubCategoryID();
                if (NewCatID != CurrCatID) {
                    temp.put(CurrSubID, al);
                    res.put(CurrCatID, (Map<Integer, ArrayList<ArticleBean>>) SerializationUtils.clone((Serializable) temp));
                    temp.clear();
                    al.clear();
                    CurrCatID = NewCatID;
                    CurrSubID = NewSubID;
                } else {
                    if (NewSubID != CurrSubID) {
                        temp.put(CurrSubID, (ArrayList<ArticleBean>) al.clone());
                        al.clear();
                        CurrSubID = NewSubID;
                    }

                }
                al.add(art);
            }
            temp.put(CurrSubID, al);
            res.put(CurrCatID, (Map<Integer, ArrayList<ArticleBean>>) SerializationUtils.clone((Serializable) temp));
            for (Integer reskey : res.keySet()) {
                ArrayList<ArticleBean> alArtByCat = new ArrayList<ArticleBean>();
                Map<Integer, ArrayList<ArticleBean>> submap = res.get(reskey);
                for (Integer tempkey : submap.keySet()) {
                    ArrayList<ArticleBean> tempal = submap.get(tempkey);
                    for (ArticleBean artbean : tempal) {
                        alArtByCat.add(artbean);
                    }
                }
                SimpleCatMap.put(reskey, (ArrayList<ArticleBean>) SerializationUtils.clone(alArtByCat));
                alArtByCat.clear();
            }

            return res;
        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }

    }

    public List<ArticleBean> getListArticles(int journalistID) throws ClassNotFoundException, SQLException {
        ArrayList<ArticleBean> listArt = new ArrayList<>();
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Article WHERE JournalistID = ?");
            ps.setInt(1, journalistID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                listArt.add(new ArticleBean(rs.getInt("ArticleID"), rs.getString("Heading"), rs.getString("ShortDescription"), rs.getString("Content"), rs.getInt("CategoryID"), rs.getInt("SubCategoryID"), rs.getInt("JournalistID"), rs.getInt("Censored"), rs.getInt("Draft"), rs.getInt("Trash"), rs.getString("DateCreated"), rs.getString("LastModified")));
            }
            return listArt;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.toString());
        }
        return null;
    }

    public ArticleBean getArticle(int articleID) throws SQLException {
        try {
            ArticleBean article = new ArticleBean();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Article WHERE ArticleID = ?");
            ps.setInt(1, articleID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                article.setArticleID(articleID);
                article.setHeading(rs.getString("Heading"));
                article.setShortDescription(rs.getString("ShortDescription"));
                article.setContent(rs.getString("Content"));
                article.setCategoryID(rs.getInt("CategoryID"));
                article.setSubCategoryID(rs.getInt("SubCategoryID"));
                article.setJournalistID(rs.getInt("JournalistID"));
                article.setCensored(rs.getInt("Censored"));
                article.setDraft(rs.getInt("Draft"));
                article.setTrash(rs.getInt("Trash"));
            }
            return article;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.toString());
        }
        return null;
    }
    public ArticleBean getArticle() throws SQLException {
        try {
            ArticleBean article = new ArticleBean();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Article WHERE ");
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                article.setArticleID(rs.getInt("ArticleID"));
                article.setHeading(rs.getString("Heading"));
                article.setShortDescription(rs.getString("ShortDescription"));
                article.setContent(rs.getString("Content"));
                article.setCategoryID(rs.getInt("CategoryID"));
                article.setSubCategoryID(rs.getInt("SubCategoryID"));
                article.setJournalistID(rs.getInt("JournalistID"));
                article.setCensored(rs.getInt("Censored"));
                article.setDraft(rs.getInt("Draft"));
                article.setTrash(rs.getInt("Trash"));
            }
            return article;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.toString());
        }
        return null;
    }

    public int getArticleID(String heading, int JournaID) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT ArticleID FROM Article WHERE Heading = ? and JournalistID = ?");
            ps.setString(1, heading);
            ps.setInt(2, JournaID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("ArticleID");
            }

        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return 0;
    }

    public boolean insertArticle(ArticleBean article) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO `Article` (ArticleID, Heading, ShortDescription, Content, CategoryID, SubCategoryID, JournalistID, Censored, Draft, Trash, DateCreated, LastModified) VALUES (null, ?,?,?,?,?,?,?,?,?, null, null)");
            ps.setString(1, article.getHeading());
            ps.setString(2, article.getShortDescription());
            ps.setString(3, article.getContent());
            ps.setInt(4, article.getCategoryID());
            if (article.getSubCategoryID() == 0) {
                ps.setString(5, null);
            } else {
                ps.setInt(5, article.getSubCategoryID());
            }
            ps.setInt(6, article.getJournalistID());
            ps.setInt(7, article.getCensored());
            ps.setInt(8, article.getDraft());
            ps.setInt(9, article.getTrash());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
        return true;
    }

    public boolean updateArticle(ArticleBean article) throws SQLException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE Article set Heading = ?, ShortDescription = ?, Content = ?, CategoryID = ?, SubCategoryID = ?, Censored = ?, Draft = ? where ArticleID = ?;");
            ps.setString(1, article.getHeading());
            ps.setString(2, article.getShortDescription());
            ps.setString(3, article.getContent());
            ps.setInt(4, article.getCategoryID());
            ps.setInt(5, article.getSubCategoryID());
            ps.setInt(6, article.getCensored());
            ps.setInt(7, article.getDraft());
            ps.setInt(8, article.getArticleID());
            ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    public boolean moveArticleToTrash(int articleID) throws SQLException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE Article set Trash = 1 where ArticleID = ?");
            ps.setInt(1, articleID);
            ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean revertArticle(int articleID) throws SQLException { //uncensored
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE Article set Censored = 0, Draft = 0, Trash = 0 where ArticleID = ?");
            ps.setInt(1, articleID);
            ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean publishArticle(int articleID) throws SQLException {
        try {
            ArticleLib.publishArticle(articleID);
            
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE Article set Censored = 1 where ArticleID = ?");
            ps.setInt(1, articleID);
            ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean draftArticle(int articleID) throws SQLException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE Article set Draft = 1 where ArticleID = ?");
            ps.setInt(1, articleID);
            ps.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    public boolean deleteArticle(int articleID) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("delete from Article where ArticleID = ?");
            ps.setInt(1, articleID);
            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
}
