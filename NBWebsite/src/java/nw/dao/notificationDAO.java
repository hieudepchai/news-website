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
import nw.bean.notificationBean;
import static nw.jdbc.DBconnect.getConnection;

/**
 *
 * @author quan1
 */
public class notificationDAO {
    public List<Pair<Integer, notificationBean>> getListNotificationJournalistID(int journalistID) throws ClassNotFoundException{
        try {
            List<Pair<Integer, notificationBean>> listNotification = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps1 = conn.prepareStatement("select Article.ArticleID, Article.Heading, Account.FirstName, Account.LastName, Account.ProfilePicture, datediff(now(), UpdateArticleActivity.DateCreated) as DateCreated1, TIMESTAMPDIFF(hour, UpdateArticleActivity.DateCreated, NOW()) as DateCreated2, TIMESTAMPDIFF(minute, UpdateArticleActivity.DateCreated, NOW()) as DateCreated3, UpdateArticleActivity.Censored, UpdateArticleActivity.Trash "+
                    "from (select * from UpdateArticleActivity where UpdateArticleActivity.DoerID <> ?) as UpdateArticleActivity, (select ArticleID, Heading from Article where JournalistID = ?) as Article, Account where UpdateArticleActivity.ArticleID = Article.ArticleID and UpdateArticleActivity.DoerID = Account.AccountID;");
            ps1.setInt(1, journalistID);
            ps1.setInt(2, journalistID);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()) {
                notificationBean notification;
                if(rs1.getInt("DateCreated1") == 0 && rs1.getInt("DateCreated2") == 0){
                    notification = new notificationBean(rs1.getInt("ArticleID"), rs1.getString("Heading"), rs1.getString("FirstName"), rs1.getString("LastName"), rs1.getString("ProfilePicture"), rs1.getString("DateCreated3") + "m");
                }else if (rs1.getInt("DateCreated1") == 0){
                    notification = new notificationBean(rs1.getInt("ArticleID"), rs1.getString("Heading"), rs1.getString("FirstName"), rs1.getString("LastName"), rs1.getString("ProfilePicture"), rs1.getString("DateCreated2") + "h");
                }else{
                    notification = new notificationBean(rs1.getInt("ArticleID"), rs1.getString("Heading"), rs1.getString("FirstName"), rs1.getString("LastName"), rs1.getString("ProfilePicture"), rs1.getString("DateCreated1") + "d");
                }
                
                if(rs1.getInt("Censored") == 1){
                    listNotification.add(new Pair<>(1, notification));
                }else if(rs1.getInt("Trash") == 1){
                    listNotification.add(new Pair<>(2, notification));
                }
            }
            
            PreparedStatement ps2 = conn.prepareStatement("select Message.ArticleID, Article.Heading, Message.Content, Account.FirstName, Account.LastName, Account.ProfilePicture, datediff(now(), Message.DateCreated) as DateCreated1, TIMESTAMPDIFF(hour, Message.DateCreated, NOW()) as DateCreated2, TIMESTAMPDIFF(minute, Message.DateCreated, NOW()) as DateCreated3 "+
                    "from (select ArticleID, Heading from Article where JournalistID = ?) as Article, Account, (select * from Message where Message.ReceiverID = ?) as Message where Account.AccountID = Message.SenderID and Article.ArticleID = Message.ArticleID;");
            ps2.setInt(1, journalistID);
            ps2.setInt(2, journalistID);
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()) {
                notificationBean notification;
                if(rs2.getInt("DateCreated1") == 0 && rs2.getInt("DateCreated2") == 0){
                    notification = new notificationBean(rs2.getInt("ArticleID"), rs2.getString("Heading"), rs2.getString("Content"), rs2.getString("FirstName"), rs2.getString("LastName"), rs2.getString("ProfilePicture"), rs2.getString("DateCreated3") + "m");
                }else if(rs2.getInt("DateCreated1") == 0){
                    notification = new notificationBean(rs2.getInt("ArticleID"), rs2.getString("Heading"), rs2.getString("Content"), rs2.getString("FirstName"), rs2.getString("LastName"), rs2.getString("ProfilePicture"), rs2.getString("DateCreated2") + "h");
                }else{
                    notification = new notificationBean(rs2.getInt("ArticleID"), rs2.getString("Heading"), rs2.getString("Content"), rs2.getString("FirstName"), rs2.getString("LastName"), rs2.getString("ProfilePicture"), rs2.getString("DateCreated1") + "d");
                }
                
                listNotification.add(new Pair<>(3, notification));
            }
            
            PreparedStatement ps3 = conn.prepareStatement("select Article.ArticleID, Article.Heading, Account.FirstName, Account.LastName, Account.ProfilePicture, datediff(now(), Comment.DateCreated) as DateCreated1, TIMESTAMPDIFF(hour, Comment.DateCreated, NOW()) as DateCreated2, TIMESTAMPDIFF(minute, Comment.DateCreated, NOW()) as DateCreated3 "+
                    "from (select ArticleID, Heading from Article where JournalistID = ?) as Article, Account, Comment where Article.ArticleID = Comment.ArticleID and Account.AccountID = Comment.AccountID;");
            ps3.setInt(1, journalistID);
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next()) {
                notificationBean notification;
                if(rs3.getInt("DateCreated1") == 0 && rs3.getInt("DateCreated2") == 0){
                    notification = new notificationBean(rs3.getInt("ArticleID"), rs3.getString("Heading"), rs3.getString("FirstName"), rs3.getString("LastName"), rs3.getString("ProfilePicture"), rs3.getString("DateCreated3") + "m");
                }else if(rs3.getInt("DateCreated1") == 0){
                    notification = new notificationBean(rs3.getInt("ArticleID"), rs3.getString("Heading"), rs3.getString("FirstName"), rs3.getString("LastName"), rs3.getString("ProfilePicture"), rs3.getString("DateCreated2") + "h");
                }else{
                    notification = new notificationBean(rs3.getInt("ArticleID"), rs3.getString("Heading"), rs3.getString("FirstName"), rs3.getString("LastName"), rs3.getString("ProfilePicture"), rs3.getString("DateCreated1") + "d");    
                }
                
                listNotification.add(new Pair<>(4, notification));
            }
            return listNotification;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }
    
    public List<Pair<Integer, ActivityBean>> getAllNotification() throws ClassNotFoundException{
        try {
            List<Pair<Integer, ActivityBean>> listNotification = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps1 = conn.prepareStatement("select Article.ArticleID, Article.JournalistID, Article.Heading, Article.CategoryID, Article.SubCategoryID, Account.AccountID, Account.FirstName, Account.LastName, Account.ProfilePicture, UpdateArticleActivity.Censored, UpdateArticleActivity.Draft, UpdateArticleActivity.Trash, UpdateArticleActivity.Created, UpdateArticleActivity.DateCreated " +
                    "from UpdateArticleActivity, (select ArticleID, Heading, JournalistID, CategoryID, SubCategoryID from Article) as Article, (select AccountID, FirstName, LastName, ProfilePicture from Account) as Account " +
                    "where UpdateArticleActivity.ArticleID = Article.ArticleID and UpdateArticleActivity.DoerID = Account.AccountID " +
                    "order by UpdateArticleActivity.DateCreated asc;");
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()) {
                ActivityBean notification;
                notification = new ActivityBean(rs1.getInt("ArticleID"), rs1.getInt("JournalistID"), rs1.getString("Heading"), rs1.getInt("CategoryID"), rs1.getInt("SubCategoryID"), rs1.getInt("AccountID"), rs1.getString("FirstName"), rs1.getString("LastName"), rs1.getString("ProfilePicture"), rs1.getString("DateCreated"));
                
                if(rs1.getInt("Censored") == 1){
                    listNotification.add(new Pair<>(10, notification));
                }else if(rs1.getInt("Created") == 1 && rs1.getInt("Draft") == 0){
                    listNotification.add(new Pair<>(1, notification));
                }else if(rs1.getInt("Created") == 1 && rs1.getInt("Draft") == 1){
                    listNotification.add(new Pair<>(3, notification));
                }else if(rs1.getInt("Created") == 0 && rs1.getInt("Draft") == 0 && rs1.getInt("Trash") == 0){
                    listNotification.add(new Pair<>(6, notification));
                }else if(rs1.getInt("Created") == 0 && rs1.getInt("Draft") == 1 && rs1.getInt("Trash") == 0){
                    listNotification.add(new Pair<>(5, notification));
                }else if(rs1.getInt("Trash") == 1 && rs1.getInt("Draft") == 0){
                    listNotification.add(new Pair<>(7, notification));
                }
            }
            
            PreparedStatement ps2 = conn.prepareStatement("select Message.ArticleID, Article.JournalistID, Article.Heading, Message.Content, Account.AccountID, Account.FirstName, Account.LastName, Account.ProfilePicture, Message.DateCreated " +
                    "from (select ArticleID, Heading, JournalistID from Article) as Article, (select AccountID, FirstName, LastName, ProfilePicture from Account) as Account, Message " +
                    "where Account.AccountID = Message.SenderID and Article.ArticleID = Message.ArticleID " +
                    "order by Message.DateCreated asc;");
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()) {
                ActivityBean notification;
                notification = new ActivityBean(rs2.getInt("ArticleID"), rs2.getInt("JournalistID"), rs2.getString("Heading"), rs2.getString("Content"), rs2.getInt("AccountID"), rs2.getString("FirstName"), rs2.getString("LastName"), rs2.getString("ProfilePicture"), rs2.getString("DateCreated"));
                
                listNotification.add(new Pair<>(11, notification));
            }
            
            PreparedStatement ps3 = conn.prepareStatement("select Article.ArticleID, Article.JournalistID, Article.Heading, Article.CategoryID, Article.SubCategoryID, Account.AccountID, Account.FirstName, Account.LastName, Account.ProfilePicture, Comment.CommentID, Comment.RepliedCommentID, Comment.Level, Comment.DateCreated " +
                "from (select ArticleID, Heading, JournalistID, CategoryID, SubCategoryID from Article) as Article, (select AccountID, FirstName, LastName, ProfilePicture from Account) as Account, Comment " +
                "where Article.ArticleID = Comment.ArticleID and Account.AccountID = Comment.AccountID " +
                "order by Comment.DateCreated asc;");
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next()) {
                ActivityBean notification;
               notification = new ActivityBean(rs3.getInt("ArticleID"), rs3.getInt("JournalistID"), rs3.getString("Heading"), rs3.getInt("CategoryID"), rs3.getInt("SubCategoryID"), rs3.getInt("AccountID"), rs3.getString("FirstName"), rs3.getString("LastName"), rs3.getString("ProfilePicture"), rs3.getInt("CommentID"), rs3.getInt("RepliedCommentID"), rs3.getInt("Level"), rs3.getString("DateCreated"));
                
                listNotification.add(new Pair<>(12, notification));
            }
            return listNotification;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }
}
