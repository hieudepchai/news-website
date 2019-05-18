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
public class ArticleBean {
    private int ArticleID;
    private String Heading;
    private String ShortDescription;
    private String Content;
    private int CategoryID;
    private int SubCategoryID;
    private int JournalistID;
    private int Censored;
    private int Draft;
    private int Trash;
    private String DateCreated;
    private String LastModified;

    public ArticleBean() {
    }

    public ArticleBean(int ArticleID, String Heading, String ShortDescription, String Content, int CategoryID, int SubCategoryID, int JournalistID, int Censored, int Draft, int Trash, String DateCreated, String LastModified) {
        this.ArticleID = ArticleID;
        this.Heading = Heading;
        this.ShortDescription = ShortDescription;
        this.Content = Content;
        this.CategoryID = CategoryID;
        this.SubCategoryID = SubCategoryID;
        this.JournalistID = JournalistID;
        this.Censored = Censored;
        this.Draft = Draft;
        this.Trash = Trash;
        this.DateCreated = DateCreated;
        this.LastModified = LastModified;
    }

    public ArticleBean(String Heading, String ShortDescription, String Content, int CategoryID, int SubCategoryID, int JournalistID, int Censored, int Draft, int Trash){
        
        this.Heading = Heading;
        this.ShortDescription = ShortDescription;
        this.Content = Content;
        this.CategoryID = CategoryID;
        this.SubCategoryID = SubCategoryID;
        this.JournalistID = JournalistID;
        this.Censored = Censored;
        this.Draft = Draft;
        this.Trash = Trash;
    }
    
    public int getArticleID() {
        return ArticleID;
    }

    public void setArticleID(int ArticleID) {
        this.ArticleID = ArticleID;
    }

    public String getHeading() {
        return Heading;
    }

    public void setHeading(String Heading) {
        this.Heading = Heading;
    }

    public String getShortDescription() {
        return ShortDescription;
    }

    public void setShortDescription(String ShortDescription) {
        this.ShortDescription = ShortDescription;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
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

    public int getJournalistID() {
        return JournalistID;
    }

    public void setJournalistID(int JournalistID) {
        this.JournalistID = JournalistID;
    }

    public int getCensored() {
        return Censored;
    }

    public void setCensored(int Censored) {
        this.Censored = Censored;
    }

    public int getDraft() {
        return Draft;
    }

    public void setDraft(int Draft) {
        this.Draft = Draft;
    }

    public int getTrash() {
        return Trash;
    }

    public void setTrash(int Trash) {
        this.Trash = Trash;
    }

    public String getDateCreated() {
        return DateCreated;
    }

    public void setDateCreated(String DateCreated) {
        this.DateCreated = DateCreated;
    }

    public String getLastModified() {
        return LastModified;
    }

    public void setLastModified(String LastModified) {
        this.LastModified = LastModified;
    }
    
}
