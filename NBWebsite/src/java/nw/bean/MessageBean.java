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
    private int MessageID;
    private int ArticleID;
    private int SenderID;
    private int ReceiverID;
    private int RepliedMessageID;
    private String Content;
    private String DateCreated;
    
    public MessageBean() {
    }

    public MessageBean(int MessageID, int ArticleID, int SenderID, int ReceiverID, int RepliedMessageID, String Content, String DateCreated) {
        this.MessageID = MessageID;
        this.ArticleID = ArticleID;
        this.SenderID = SenderID;
        this.ReceiverID = ReceiverID;
        this.RepliedMessageID = RepliedMessageID;
        this.Content = Content;
        this.DateCreated = DateCreated;
    }
    
    public MessageBean(int ArticleID, int SenderID, int ReceiverID, int RepliedMessageID, String Content) {
        this.ArticleID = ArticleID;
        this.SenderID = SenderID;
        this.ReceiverID = ReceiverID;
        this.RepliedMessageID = RepliedMessageID;
        this.Content = Content;
    }

    public int getMessageID() {
        return MessageID;
    }

    public void setMessageID(int MessageID) {
        this.MessageID = MessageID;
    }

    public int getArticleID() {
        return ArticleID;
    }

    public void setArticleID(int ArticleID) {
        this.ArticleID = ArticleID;
    }

    public int getSenderID() {
        return SenderID;
    }

    public void setSenderID(int SenderID) {
        this.SenderID = SenderID;
    }

    public int getReceiverID() {
        return ReceiverID;
    }

    public void setReceiverID(int ReceiverID) {
        this.ReceiverID = ReceiverID;
    }

    public int getRepliedMessageID() {
        return RepliedMessageID;
    }

    public void setRepliedMessageID(int RepliedMessageID) {
        this.RepliedMessageID = RepliedMessageID;
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
