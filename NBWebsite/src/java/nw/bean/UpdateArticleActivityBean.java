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
public class UpdateArticleActivityBean {
    private int ActionID;
    private int DoerID;
    private int ArticleID;
    private int Censored;
    private int Draft;
    private int Trash;
    private int Created;
    private String DateCreated;
    
    public UpdateArticleActivityBean(){}
    
    public UpdateArticleActivityBean(int ActionID, int DoerID, int ArticleID, int Censored, int Draft, int Trash, int Created, String DateCreated){
        this.ActionID = ActionID;
        this.DoerID = DoerID;
        this.ArticleID = ArticleID;
        this.Censored = Censored;
        this.Draft = Draft;
        this.Trash = Trash;
        this.Created = Created;
        this.DateCreated = DateCreated;
    }
    
    public UpdateArticleActivityBean(int DoerID, int ArticleID, int Censored, int Draft, int Trash, int Created, String DateCreated){
        this.DoerID = DoerID;
        this.ArticleID = ArticleID;
        this.Censored = Censored;
        this.Draft = Draft;
        this.Trash = Trash;
        this.Created = Created;
        this.DateCreated = DateCreated;
    }
    
    public UpdateArticleActivityBean(int DoerID, int ArticleID, int Censored, int Draft, int Trash, int Created){
        this.DoerID = DoerID;
        this.ArticleID = ArticleID;
        this.Censored = Censored;
        this.Draft = Draft;
        this.Trash = Trash;
        this.Created = Created;
    }

    public int getActionID() {
        return ActionID;
    }

    public void setActionID(int ActionID) {
        this.ActionID = ActionID;
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

    public int getCreated() {
        return Created;
    }

    public void setCreated(int Created) {
        this.Created = Created;
    }
    
}
