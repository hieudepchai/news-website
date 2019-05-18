/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.bean;

/**
 *
 * @author quan1
 */
public class MessageBean {
    private int FeedbackID;
    private int ArticleID;
    private int AdminID;
    private String Content;
    private String DateCreated;
    
    public MessageBean() {
    }

    public MessageBean(int FeedbackID, int ArticleID, int AdminID, String Content, String DateCreated) {
        this.FeedbackID = FeedbackID;
        this.ArticleID = ArticleID;
        this.AdminID = AdminID;
        this.Content = Content;
        this.DateCreated = DateCreated;
    }
    public int getFeedbackID() {
        return FeedbackID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }

    public int getArticleID() {
        return ArticleID;
    }

    public void setArticleID(int ArticleID) {
        this.ArticleID = ArticleID;
    }

    public int getAdminID() {
        return AdminID;
    }

    public void setAdminID(int AdminID) {
        this.AdminID = AdminID;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getDateCreated() {
        return DateCreated;
    }

    public void setDateCreated(String DateCreated) {
        this.DateCreated = DateCreated;
    }
}
