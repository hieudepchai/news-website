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
import java.util.ArrayList;
import java.util.List;
import javafx.util.Pair;
import nw.bean.ActivityBean;
import nw.bean.UpdateArticleActivityBean;
import static nw.jdbc.DBconnect.getConnection;

/**
 *
 * @author quan1
 */
public class UpdateArticleActivityDAO {
    public boolean insertActivity(UpdateArticleActivityBean activity) throws ClassNotFoundException{
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO `UpdateArticleActivity` (ActionID, DoerID, ArticleID, Censored, Draft, Trash, Created, DateCreated) VALUES (null, ?,?,?,?,?,?, ?)");
            ps.setInt(1, activity.getDoerID());
            ps.setInt(2, activity.getArticleID());
            ps.setInt(3, activity.getCensored());
            ps.setInt(4, activity.getDraft());
            ps.setInt(5, activity.getTrash());
            ps.setInt(6, activity.getCreated());
            ps.setString(7, activity.getDateCreated());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
        return true;
    }
    
    public boolean insertListActivity(List<UpdateArticleActivityBean> listActivity) throws ClassNotFoundException{
        try {
            Connection conn = getConnection();
            for (int i = 0; i < listActivity.size(); i++) {
                PreparedStatement ps = conn.prepareStatement("INSERT INTO `UpdateArticleActivity` (ActionID, DoerID, ArticleID, Censored, Draft, Trash, Created, DateCreated) VALUES (null, ?,?,?,?,?,?, ?)");
                ps.setInt(1, listActivity.get(i).getDoerID());
                ps.setInt(2, listActivity.get(i).getArticleID());
                ps.setInt(3, listActivity.get(i).getCensored());
                ps.setInt(4, listActivity.get(i).getDraft());
                ps.setInt(5, listActivity.get(i).getTrash());
                ps.setInt(6, listActivity.get(i).getCreated());
                ps.setString(7, listActivity.get(i).getDateCreated());
                ps.executeUpdate();
            }
            

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
        return true;
    }
    
    public List<UpdateArticleActivityBean> getListActivityJournalistID(int journalistID) throws ClassNotFoundException{
        try {
            List<UpdateArticleActivityBean> listActivity = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM UpdateArticleActivity WHERE DoerID = ?;");
            ps.setInt(1, journalistID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                listActivity.add(new UpdateArticleActivityBean(rs.getInt("ActionID"), rs.getInt("DoerID"), rs.getInt("ArticleID"), rs.getInt("Censored"), rs.getInt("Draft"), rs.getInt("Trash"), rs.getInt("Created"), rs.getString("DateCreated")));
            }
            return listActivity;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }
    
    public List<Pair<Integer, ActivityBean>> getListAllActivity() throws ClassNotFoundException{
        try {
            List<Pair<Integer, ActivityBean>> listActivity = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM UpdateArticleActivity, (select ArticleID, Heading, ShortDescription, JournalistID from Article) as Article " +
                "WHERE UpdateArticleActivity.ArticleID = Article.ArticleID;");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ActivityBean action = new ActivityBean(rs.getInt("DoerID"), rs.getInt("ArticleID"), rs.getString("Heading"), rs.getString("ShortDescription"), rs.getInt("JournalistID"), rs.getString("DateCreated"));
                if(rs.getInt("Created") == 1 && rs.getInt("Draft") == 0){
                    listActivity.add(new Pair<>(1, action));
                }else if(rs.getInt("Created") == 1 && rs.getInt("Draft") == 1){
                    listActivity.add(new Pair<>(3, action));
                }else if(rs.getInt("Created") == 0 && rs.getInt("Draft") == 0 && rs.getInt("Trash") == 0){
                    listActivity.add(new Pair<>(6, action));
                }else if(rs.getInt("Created") == 0 && rs.getInt("Draft") == 1 && rs.getInt("Trash") == 0){
                    listActivity.add(new Pair<>(5, action));
                }else if(rs.getInt("Trash") == 1 && rs.getInt("Draft") == 0){
                    listActivity.add(new Pair<>(7, action));
                }else if(rs.getInt("Trash") == 1 && rs.getInt("Draft") == 1){
                    listActivity.add(new Pair<>(9, action));
                }
                //listActivity.add(new UpdateArticleActivityBean(rs.getInt("ActionID"), rs.getInt("DoerID"), rs.getInt("ArticleID"), rs.getInt("Censored"), rs.getInt("Draft"), rs.getInt("Trash"), rs.getInt("Created"), rs.getString("DateCreated")));
            }
            
            PreparedStatement ps3 = conn.prepareStatement("select Article.ArticleID, Article.ShortDescription, Article.Heading, Article.CategoryID, Article.SubCategoryID, Account.AccountID, Account.FirstName, Account.LastName, Account.ProfilePicture, Comment.CommentID, Comment.RepliedCommentID, Comment.Level, Comment.DateCreated " +
                "from (select ArticleID, Heading, ShortDescription, CategoryID, SubCategoryID from Article) as Article, (select AccountID, FirstName, LastName, ProfilePicture from Account) as Account, Comment " +
                "where Article.ArticleID = Comment.ArticleID and Account.AccountID = Comment.AccountID " +
                "order by Comment.DateCreated asc;");
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next()) {
                ActivityBean action;
               action = new ActivityBean(rs3.getInt("ArticleID"), rs3.getString("Heading"), rs3.getString("ShortDescription"), rs3.getInt("CategoryID"), rs3.getInt("SubCategoryID"), rs3.getInt("AccountID"), rs3.getString("FirstName"), rs3.getString("LastName"), rs3.getString("ProfilePicture"), rs3.getInt("CommentID"), rs3.getInt("RepliedCommentID"), rs3.getInt("Level"), rs3.getString("DateCreated"));
                
                listActivity.add(new Pair<>(12, action));
            }
            
            return listActivity;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }
    
    public List<Pair<Integer, ActivityBean>> getListActivityJournalist(int journalistID) throws ClassNotFoundException{
        try {
            List<Pair<Integer, ActivityBean>> listActivity = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT UpdateArticleActivity.ArticleID, Article.Heading, Article.ShortDescription, Article.JournalistID, UpdateArticleActivity.Censored, UpdateArticleActivity.Draft, UpdateArticleActivity.Trash, UpdateArticleActivity.Created, UpdateArticleActivity.DateCreated FROM UpdateArticleActivity, Article WHERE DoerID = ? and UpdateArticleActivity.ArticleID = Article.ArticleID;");
            ps.setInt(1, journalistID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ActivityBean action = new ActivityBean(rs.getInt("DoerID"), rs.getInt("ArticleID"), rs.getString("Heading"), rs.getString("ShortDescription"), rs.getInt("JournalistID"), rs.getString("DateCreated"));
                if(rs.getInt("Created") == 1 && rs.getInt("Draft") == 0){
                    listActivity.add(new Pair<>(1, action));
                }else if(rs.getInt("Created") == 1 && rs.getInt("Draft") == 1){
                    listActivity.add(new Pair<>(3, action));
                }else if(rs.getInt("Created") == 0 && rs.getInt("Draft") == 0){
                    listActivity.add(new Pair<>(6, action));
                }else if(rs.getInt("Created") == 0 && rs.getInt("Draft") == 1 && rs.getInt("Trash") == 0){
                    listActivity.add(new Pair<>(5, action));
                }else if(rs.getInt("Trash") == 1 && rs.getInt("Draft") == 0){
                    listActivity.add(new Pair<>(7, action));
                }else if(rs.getInt("Trash") == 1 && rs.getInt("Draft") == 1){
                    listActivity.add(new Pair<>(9, action));
                }
                //listActivity.add(new UpdateArticleActivityBean(rs.getInt("ActionID"), rs.getInt("DoerID"), rs.getInt("ArticleID"), rs.getInt("Censored"), rs.getInt("Draft"), rs.getInt("Trash"), rs.getInt("Created"), rs.getString("DateCreated")));
            }
            return listActivity;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }
    
    public List<UpdateArticleActivityBean> getListActivityArticle(int journalistID) throws ClassNotFoundException{
        try {
            List<UpdateArticleActivityBean> listActivity = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from UpdateArticleActivity where DoerID <> ? and ArticleID in (select ArticleID from Article where JournalistID = ?);");
            ps.setInt(1, journalistID);
            ps.setInt(2, journalistID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                listActivity.add(new UpdateArticleActivityBean(rs.getInt("ActionID"), rs.getInt("DoerID"), rs.getInt("ArticleID"), rs.getInt("Censored"), rs.getInt("Draft"), rs.getInt("Trash"), rs.getInt("Created"), rs.getString("DateCreated")));
            }
            return listActivity;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }
}
