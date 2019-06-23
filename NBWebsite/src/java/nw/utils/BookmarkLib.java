/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.utils;

import java.util.ArrayList;
import nw.bean.BookmarkBean;

/**
 *
 * @author Admin
 */
public class BookmarkLib {
    private ArrayList<BookmarkBean> alBMByAccount;
    public void setBookmarkByAccount(ArrayList<BookmarkBean> alBM){
        alBMByAccount = alBM;
    }
    public BookmarkBean getBmByArticle(int ArticleID){
        for(BookmarkBean bm : alBMByAccount){
            if(bm.getArticleID()==ArticleID)
                return bm;
        }
        return null;
    }
    public  ArrayList<BookmarkBean> getAllBookmark(){
        return alBMByAccount;
    }
    
}
