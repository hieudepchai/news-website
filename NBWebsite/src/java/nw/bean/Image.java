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
public class Image {
    private int ImageID;
    private String Source;
    private int ArticleID;
    private int AccountID;
    private String DateCreated;
    private int Thumbnail;

    public Image() {
    }

    public Image(int ImageID, String Source, int ArticleID, int AccountID, String DateCreated, int Thumbnail) {
        this.ImageID = ImageID;
        this.Source = Source;
        this.ArticleID = ArticleID;
        this.AccountID = AccountID;
        this.DateCreated = DateCreated;
        this.Thumbnail = Thumbnail;
    }
    
    public Image(String Source, int ArticleID, int AccountID, int Thumbnail) {
        this.Source = Source;
        this.ArticleID = ArticleID;
        this.AccountID = AccountID;
        this.Thumbnail = Thumbnail;
    }

    public int getImageID() {
        return ImageID;
    }

    public void setImageID(int ImageID) {
        this.ImageID = ImageID;
    }

    public String getSource() {
        return Source;
    }

    public void setSource(String Source) {
        this.Source = Source;
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

    public String getDateCreated() {
        return DateCreated;
    }

    public void setDateCreated(String DateCreated) {
        this.DateCreated = DateCreated;
    }

    public int getThumbnail() {
        return Thumbnail;
    }

    public void setThumbnail(int Thumbnail) {
        this.Thumbnail = Thumbnail;
    }
    
}
