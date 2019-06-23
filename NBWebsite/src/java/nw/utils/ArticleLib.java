/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.utils;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import nw.bean.ArticleBean;
import nw.dao.ArticleDAO;


/**
 *
 * @author Admin
 */
public class ArticleLib {
    private static ArrayList<ArticleBean> listAllArticle = new ArrayList<>();
    private static HashMap<Integer, List<ArticleBean>> ListArticleJLMap = new HashMap<>();
    private static List<ArticleBean> listNewArticle = new ArrayList<>();
    private static List<ArticleBean> listEditedArticle = new ArrayList<>();
    
    private static Map<Integer, ArrayList<ArticleBean>> generalArticleMap = new HashMap<Integer, ArrayList<ArticleBean>>();
    private static Map<Integer, Map<Integer, ArrayList<ArticleBean>>> detailedArticleMap = new HashMap<Integer, Map<Integer, ArrayList<ArticleBean>>>();
    private static ScheduledExecutorService articleScheduler = Executors.newSingleThreadScheduledExecutor();

    public ArticleLib() {
    }


    static {
        ArticleDAO artDAO = new ArticleDAO();
        detailedArticleMap = artDAO.getArticleByCat(generalArticleMap);
        
        try {
            listAllArticle = artDAO.getAllArticles();
        } catch (SQLException ex) {
            Logger.getLogger(ArticleLib.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void update() {
        ArticleDAO artDAO = new ArticleDAO();
        detailedArticleMap = artDAO.getArticleByCat(generalArticleMap);
        
        try {
            listAllArticle = artDAO.getAllArticles();
        } catch (SQLException ex) {
            Logger.getLogger(ArticleLib.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        listNewArticle.clear();
        listEditedArticle.clear();
    }
        
    static {
        articleScheduler.scheduleWithFixedDelay(
                new Runnable() {
            public void run() {
                try {
                    update();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }
            }
        }, 0,10, TimeUnit.MINUTES);
    }
    public static Map<Integer, Map<Integer, ArrayList<ArticleBean>>> getDAM() {
        return detailedArticleMap;
    }

    public static Map<Integer, ArrayList<ArticleBean>> getGAM() {
        return generalArticleMap;
    }

    public static void insertArticle(ArticleBean article){
        listAllArticle.add(article);
        listNewArticle.add(article);
        ListArticleJLMap.get(article.getJournalistID()).add(article);
    }
    
    public static void publishArticle(int articleID){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        Date date = new Date(); 
        String currentTime = formatter.format(date);  
        
        ArticleBean article = new ArticleBean();
        for(int i=0; i<listAllArticle.size(); i++){
            if(listAllArticle.get(i).getArticleID() == articleID){
                listAllArticle.get(i).setCensored(1);
                listAllArticle.get(i).setDraft(0);
                listAllArticle.get(i).setTrash(0);
                listAllArticle.get(i).setLastModified(currentTime);
                article = listAllArticle.get(i);
                break;
            }
        }
        for(int i =0; i<ListArticleJLMap.get(article.getJournalistID()).size(); i++){
            if(ListArticleJLMap.get(article.getJournalistID()).get(i).getArticleID() == article.getArticleID())
            {
                ListArticleJLMap.get(article.getJournalistID()).set(i, article);
                break;
            }
        }
        
        generalArticleMap.get(article.getCategoryID()).add(article);
        detailedArticleMap.get(article.getCategoryID()).get(article.getSubCategoryID()).add(article);
    }
    
    public static void updateArticle(ArticleBean article){
        int position1 = 0;
        for(int i=0; i<listAllArticle.size(); i++){
            if(listAllArticle.get(i).getArticleID() == article.getArticleID()){
                position1 = i;
                break;
            }
        }
        listAllArticle.set(position1, article);
        listEditedArticle.add(article);
        
        int position2 = 0;
        for(int i =0; i<ListArticleJLMap.get(article.getJournalistID()).size(); i++){
            if(ListArticleJLMap.get(article.getJournalistID()).get(i).getArticleID() == article.getArticleID())
            {
                position2 = i;
                break;
            }
        }
        ListArticleJLMap.get(article.getJournalistID()).set(position2, article);
    }
    
    public static ArrayList<ArticleBean> getListAllArticle() {
        return listAllArticle;
    }
    
    public static void createListAticleJl(int JournalistID){
        List<ArticleBean> listArticle = new ArrayList<>();
        for(int i=0; i<listAllArticle.size(); i++){
            if(listAllArticle.get(i).getJournalistID() == JournalistID){
                listArticle.add(listAllArticle.get(i));
            }
        }
        ListArticleJLMap.put(JournalistID, listArticle);
    }
    
    public static List<ArticleBean> getListArticleJL(int journalistID){
        return ListArticleJLMap.get(journalistID);
    }
}
