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
public class ActivityBean {
    //article
    private int ArticleID;
    private int JournalistID;
    private String Heading;
    private String ShortDescription;
    private String TopicImage;
    private int category1;
    private int category2;
    //image
    private String fileName; //image name
    private String Source;
    //message
    private String FeedbackContent;
    //account
    private int DoerID;
    private String FirstName;
    private String LastName;
    private String AccountProfileImg;
    //comment
    private int CommentID;
    private int RepliedID;
    private int Level;
    private int ReceiverID;
    private String FullNameReceiver;
    
    private String Time;
    
    //activity
    public ActivityBean(int DoerID, int ArticleID, String Heading, String ShortDes, int JournalistID, String time){
        this.DoerID = DoerID;
        this.ArticleID = ArticleID;
        this.Heading = Heading;
        this.ShortDescription = ShortDes;
        this.JournalistID = JournalistID;
        this.Time = time;
    }
    
    public ActivityBean(String fileName, String Source, String time){
        this.fileName = fileName;
        this.Source = Source;
        this.Time = time;
    }
    
    public ActivityBean(int ArticleID, String Heading, String ShortDes, int cate1, int cate2, int DoerID, String FirstName, String LastName, String AccountProfileImg, int CommentID, int RepliedID, int Level, String Time){ //type12: comment
        this.ArticleID = ArticleID;
        this.Heading = Heading;
        this.ShortDescription = ShortDes;
        this.category1 = cate1;
        this.category2 = cate2;
        this.DoerID = DoerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.AccountProfileImg = AccountProfileImg;
        this.CommentID = CommentID;
        this.RepliedID = RepliedID;
        this.Level = Level;
        this.Time = Time;
    }
    
    //notification
    public ActivityBean(int ArticleID, int JournalistID, String Heading, int cate1, int cate2, int DoerID, String FirstName, String LastName, String ProfilePicture, String Time){
        this.ArticleID = ArticleID;
        this.JournalistID = JournalistID;
        this.Heading = Heading;
        this.category1 = cate1;
        this.category2 = cate2;
        this.DoerID = DoerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.AccountProfileImg = ProfilePicture;
        this.Time = Time;
    }
    
    public ActivityBean(int ArticleID, int JournalistID, String Heading, String FeedbackContent, int DoerID, String FirstName, String LastName, String AccountProfileImg, String Time){ //type 11: message
        this.ArticleID = ArticleID;
        this.JournalistID = JournalistID;
        this.Heading = Heading;
        this.FeedbackContent = FeedbackContent;
        this.DoerID = DoerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.AccountProfileImg = AccountProfileImg;
        this.Time = Time;
    }
    
    public ActivityBean(int ArticleID, int JournalistID, String Heading, int cate1, int cate2, int DoerID, String FirstName, String LastName, String AccountProfileImg, int CommentID, int RepliedID, int Level, String Time){ //type12: comment
        this.ArticleID = ArticleID;
        this.JournalistID = JournalistID;
        this.Heading = Heading;
        this.category1 = cate1;
        this.category2 = cate2;
        this.DoerID = DoerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.AccountProfileImg = AccountProfileImg;
        this.CommentID = CommentID;
        this.RepliedID = RepliedID;
        this.Level = Level;
        this.Time = Time;
    }

    public int getDoerID() {
        return DoerID;
    }

    public void setDoerID(int DoerID) {
        this.DoerID = DoerID;
    }

    public int getArticleID() {
        return ArticleID;
    }

    public void setArticleID(int ArticleID) {
        this.ArticleID = ArticleID;
    }

    public int getJournalistID() {
        return JournalistID;
    }

    public void setJournalistID(int JournalistID) {
        this.JournalistID = JournalistID;
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

    public int getCategory1() {
        return category1;
    }

    public void setCategory1(int category1) {
        this.category1 = category1;
    }

    public int getCategory2() {
        return category2;
    }

    public void setCategory2(int category2) {
        this.category2 = category2;
    }

    public String getTopicImage() {
        return TopicImage;
    }

    public void setTopicImage(String TopicImage) {
        this.TopicImage = TopicImage;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getSource() {
        return Source;
    }

    public void setSource(String Source) {
        this.Source = Source;
    }

    public String getFeedbackContent() {
        return FeedbackContent;
    }

    public void setFeedbackContent(String FeedbackContent) {
        this.FeedbackContent = FeedbackContent;
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

    public int getCommentID() {
        return CommentID;
    }

    public void setCommentID(int CommentID) {
        this.CommentID = CommentID;
    }

    public int getRepliedID() {
        return RepliedID;
    }

    public void setRepliedID(int RepliedID) {
        this.RepliedID = RepliedID;
    }

    public int getLevel() {
        return Level;
    }

    public void setLevel(int Level) {
        this.Level = Level;
    }

    public int getReceiverID() {
        return ReceiverID;
    }

    public void setReceiverID(int ReceiverID) {
        this.ReceiverID = ReceiverID;
    }

    public String getFullNameReceiver() {
        return FullNameReceiver;
    }

    public void setFullNameReceiver(String FullNameReceiver) {
        this.FullNameReceiver = FullNameReceiver;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String time) {
        this.Time = time;
    }
        
}
