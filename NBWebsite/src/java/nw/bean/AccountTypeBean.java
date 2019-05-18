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
public class AccountTypeBean {
    private int AccountTypeID;
    private String Name;
    private int ReaderRight;
    private int JournalistRight;
    private int AdminRight;
    private int AccountMng;
    private int AccountTypeMng;
    private int ArticleMng;
    private int CommentMng;
    private int BookmarkMng;
    private int FeedbackMng;
    private int ImageMng;

    public AccountTypeBean() {
    }

    public AccountTypeBean(int AccountTypeID, String Name, int ReaderRight, int JournalistRight, int AdminRight, int AccountMng, int AccountTypeMng, int ArticleMng, int CommentMng, int BookmarkMng, int FeedbackMng, int ImageMng) {
        this.AccountTypeID = AccountTypeID;
        this.Name = Name;
        this.ReaderRight = ReaderRight;
        this.JournalistRight = JournalistRight;
        this.AdminRight = AdminRight;
        this.AccountMng = AccountMng;
        this.AccountTypeMng = AccountTypeMng;
        this.ArticleMng = ArticleMng;
        this.CommentMng = CommentMng;
        this.BookmarkMng = BookmarkMng;
        this.FeedbackMng = FeedbackMng;
        this.ImageMng = ImageMng;
    }

    public int getAccountTypeID() {
        return AccountTypeID;
    }

    public void setAccountTypeID(int AccountTypeID) {
        this.AccountTypeID = AccountTypeID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getReaderRight() {
        return ReaderRight;
    }

    public void setReaderRight(int ReaderRight) {
        this.ReaderRight = ReaderRight;
    }

    public int getJournalistRight() {
        return JournalistRight;
    }

    public void setJournalistRight(int JournalistRight) {
        this.JournalistRight = JournalistRight;
    }

    public int getAdminRight() {
        return AdminRight;
    }

    public void setAdminRight(int AdminRight) {
        this.AdminRight = AdminRight;
    }

    public int getAccountMng() {
        return AccountMng;
    }

    public void setAccountMng(int AccountMng) {
        this.AccountMng = AccountMng;
    }

    public int getAccountTypeMng() {
        return AccountTypeMng;
    }

    public void setAccountTypeMng(int AccountTypeMng) {
        this.AccountTypeMng = AccountTypeMng;
    }

    public int getArticleMng() {
        return ArticleMng;
    }

    public void setArticleMng(int ArticleMng) {
        this.ArticleMng = ArticleMng;
    }

    public int getCommentMng() {
        return CommentMng;
    }

    public void setCommentMng(int CommentMng) {
        this.CommentMng = CommentMng;
    }

    public int getBookmarkMng() {
        return BookmarkMng;
    }

    public void setBookmarkMng(int BookmarkMng) {
        this.BookmarkMng = BookmarkMng;
    }

    public int getFeedbackMng() {
        return FeedbackMng;
    }

    public void setFeedbackMng(int FeedbackMng) {
        this.FeedbackMng = FeedbackMng;
    }

    public int getImageMng() {
        return ImageMng;
    }

    public void setImageMng(int ImageMng) {
        this.ImageMng = ImageMng;
    }
    
    
}
