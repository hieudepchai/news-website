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
public class notificationBean {
    private int ArticleID;
    private String Heading;
    private String Content;
    private String FirstName;
    private String LastName;
    private String AccountProfileImg;
    private String Time;
    
    public notificationBean(){}
    
    public notificationBean(int ArticleID, String Heading, String Time){ //article
        this.ArticleID = ArticleID;
        this.Heading = Heading;
        this.Time = Time;
    }
    
    public notificationBean(int ArticleID, String Heading, String Content, String FirstName, String LastName, String AccountProfileImg, String Time){ //Message
        this.ArticleID = ArticleID;
        this.Heading = Heading;
        this.Content = Content;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.AccountProfileImg = AccountProfileImg;
        this.Time = Time;
    }
    
    public notificationBean(int ArticleID, String Heading, String FirstName, String LastName, String AccountProfileImg, String Time){ //Comment
        this.ArticleID = ArticleID;
        this.Heading = Heading;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.AccountProfileImg = AccountProfileImg;
        this.Time = Time;
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

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }
    
    public String getAccountProfileImg() {
        return AccountProfileImg;
    }

    public void setAccountProfileImg(String AccountProfileImg) {
        this.AccountProfileImg = AccountProfileImg;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String Time) {
        this.Time = Time;
    }
    
}
