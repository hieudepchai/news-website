/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.bean;

/**
 *
 * @author Admin
 */
public class CommentBean {
    private int CommentID;
    private int ArticleID;
    private int AccountID;
    private String Content;
    private int NoOfLikes;
    private int Level;
    private String DateCreated;

    public CommentBean() {
    }

    public CommentBean(int CommentID, int ArticleID, int AccountID, String Content, int NoOfLikes, int Level, String DateCreated) {
        this.CommentID = CommentID;
        this.ArticleID = ArticleID;
        this.AccountID = AccountID;
        this.Content = Content;
        this.NoOfLikes = NoOfLikes;
        this.Level = Level;
        this.DateCreated = DateCreated;
    }

    public int getCommentID() {
        return CommentID;
    }

    public void setCommentID(int CommentID) {
        this.CommentID = CommentID;
    }

    public int getArticleID() {
        return ArticleID;
    }

    public void setArticleID(int ArticleID) {
        this.ArticleID = ArticleID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public int getNoOfLikes() {
        return NoOfLikes;
    }

    public void setNoOfLikes(int NoOfLikes) {
        this.NoOfLikes = NoOfLikes;
    }

    public int getLevel() {
        return Level;
    }

    public void setLevel(int Level) {
        this.Level = Level;
    }

    public String getDateCreated() {
        return DateCreated;
    }

    public void setDateCreated(String DateCreated) {
        this.DateCreated = DateCreated;
    }
    
}
