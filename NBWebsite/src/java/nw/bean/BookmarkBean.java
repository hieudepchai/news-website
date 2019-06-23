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
    private int AccountID;
    private int ArticleID;
    private String Title;
    private String DateCreated;
    private String Heading;
    private int CategoryID;
    private int SubCategoryID;
    public BookmarkBean() {
    }

    public BookmarkBean(int BookmarkID, int AccountID, int ArticleID, String Title, String DateCreated, String Heading, int CategoryID, int SubCategoryID) {
        this.BookmarkID = BookmarkID;
        this.AccountID = AccountID;
        this.ArticleID = ArticleID;
        this.Title = Title;
        this.DateCreated = DateCreated;
        this.Heading = Heading;
        this.CategoryID = CategoryID;
        this.SubCategoryID = SubCategoryID;
    }

    public BookmarkBean(int BookmarkID, int ACcountID, int ArticleID, String Title, String DateTime) {
        this.BookmarkID = BookmarkID;
        this.AccountID = ACcountID;
        this.ArticleID = ArticleID;
        this.Title = Title;
        this.DateCreated = DateTime;
    }

    public BookmarkBean(int BookmarkID, int AccountID, int ArticleID, String Title) {
        this.BookmarkID = BookmarkID;
        this.AccountID = AccountID;
        this.ArticleID = ArticleID;
        this.Title = Title;
    }

    public BookmarkBean(int AccountID, int ArticleID, String Title) {
        this.AccountID = AccountID;
        this.ArticleID = ArticleID;
        this.Title = Title;
    }

    public int getBookmarkID() {
        return BookmarkID;
    }

    public void setBookmarkID(int BookmarkID) {
        this.BookmarkID = BookmarkID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int ACcountID) {
        this.AccountID = ACcountID;
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

    public String getDateCreated() {
        return DateCreated;
    }

    public void setDateCreated(String DateTime) {
        this.DateCreated = DateTime;
    }
        public String getHeading() {
        return Heading;
    }

    public void setHeading(String Heading) {
        this.Heading = Heading;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getSubCategoryID() {
        return SubCategoryID;
    }

    public void setSubCategoryID(int SubCategoryID) {
        this.SubCategoryID = SubCategoryID;
    }

}
