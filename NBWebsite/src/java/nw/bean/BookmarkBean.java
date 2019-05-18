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
public class BookmarkBean {
    private int BookmarkID;
    private int ACcountID;
    private int ArticleID;
    private String Title;
    private String DateTime;

    public BookmarkBean() {
    }

    public BookmarkBean(int BookmarkID, int ACcountID, int ArticleID, String Title, String DateTime) {
        this.BookmarkID = BookmarkID;
        this.ACcountID = ACcountID;
        this.ArticleID = ArticleID;
        this.Title = Title;
        this.DateTime = DateTime;
    }

    public int getBookmarkID() {
        return BookmarkID;
    }

    public void setBookmarkID(int BookmarkID) {
        this.BookmarkID = BookmarkID;
    }

    public int getACcountID() {
        return ACcountID;
    }

    public void setACcountID(int ACcountID) {
        this.ACcountID = ACcountID;
    }

    public int getArticleID() {
        return ArticleID;
    }

    public void setArticleID(int ArticleID) {
        this.ArticleID = ArticleID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDateTime() {
        return DateTime;
    }

    public void setDateTime(String DateTime) {
        this.DateTime = DateTime;
    }
    
}
