///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package nw.utils;
//
//import com.google.common.cache.CacheBuilder;
//import com.google.common.cache.CacheLoader;
//import com.google.common.cache.LoadingCache;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.concurrent.ExecutionException;
//import java.util.concurrent.Executors;
//import java.util.concurrent.ScheduledExecutorService;
//import java.util.concurrent.TimeUnit;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.servlet.ServletContext;
//import nw.bean.ArticleBean;
//import nw.dao.ArticleDAO;
//
///**
// *
// * @author DELL
// */
//public class ArticleCacheManager {
//    //article cache
//
//    private static Map<Integer, ArticleBean> articleMap = new HashMap<Integer, ArticleBean>();
//
//    static {
//        ArticleDAO articleDAO = new ArticleDAO();
//        try {
//            ArrayList<ArticleBean> alArticle = articleDAO.getAllArticles(articleMap);
//        } catch (SQLException ex) {
//            Logger.getLogger(ArticleCacheManager.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    private static CacheLoader<Integer, ArticleBean> articleLoader;
//
//    static {
//        articleLoader = new CacheLoader<Integer, ArticleBean>() {
//            public ArticleBean load(Integer id) throws SQLException {
//                updateArticleMap();
//                return articleMap.get(id);
//            }
//        };
//    }
//
//    public static LoadingCache<Integer, ArticleBean> articleCache;
//
//    static {
//        articleCache = CacheBuilder.newBuilder()
//                .expireAfterWrite(15, TimeUnit.MINUTES).maximumSize(1000)
//                .build(articleLoader);
//        try {
//            updateArticleCache();
//        } catch (SQLException ex) {
//            Logger.getLogger(ArticleCacheManager.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (ExecutionException ex) {
//            Logger.getLogger(ArticleCacheManager.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    private static ScheduledExecutorService ses = Executors.newSingleThreadScheduledExecutor();
//
//    //detailed and general ArticleMap, cache---------------------------------------------------------------------------
//    public static Map<Integer, ArrayList<ArticleBean>> generalArticleMap = new HashMap<Integer, ArrayList<ArticleBean>>();
//    private static Map<Integer, Map<Integer, ArrayList<ArticleBean>>> detailedArticleMap = new HashMap<Integer, Map<Integer, ArrayList<ArticleBean>>>();
//
//    static {
//        ArticleDAO artDAO = new ArticleDAO();
//        detailedArticleMap = artDAO.getArticleByCat(generalArticleMap);
//    }
//    private static CacheLoader<Integer, Map<Integer, ArrayList<ArticleBean>>> detailedLoader;
//
//    static {
//        detailedLoader = new CacheLoader<Integer, Map<Integer, ArrayList<ArticleBean>>>() {
//            @Override
//            public Map<Integer, ArrayList<ArticleBean>> load(Integer k) throws Exception {
//                return detailedArticleMap.get(k);
//            }
//        };
//    }
//    public static LoadingCache<Integer, Map<Integer, ArrayList<ArticleBean>>> detailedArticleCache;
//
//    static {
//        try {
//            detailedArticleCache = CacheBuilder.newBuilder()
//                    .expireAfterWrite(30, TimeUnit.MINUTES).maximumSize(1000)
//                    .build(detailedLoader);
//            updateDetailedArticleCache();
//        } catch (ExecutionException ex) {
//            Logger.getLogger(ArticleCacheManager.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    //---------------------------
//    static {
//        ses.scheduleWithFixedDelay(
//                new Runnable() {
//            public void run() {
//                try {
//                    System.out.println("----------------------------------------------");
//                    System.out.println("----------------------------------------------");
//                    System.out.println(articleCache.size());
//                    System.out.println(detailedArticleCache.size());
//                    System.out.println("----------------------------------------------");
//                    System.out.println("----------------------------------------------");
//                    updateArticleCache();
//                    updateDetailedArticleCache();
//                    System.out.println("----------------------------------------------");
//                } catch (SQLException ex) {
//                    Logger.getLogger(ArticleCacheManager.class.getName()).log(Level.SEVERE, null, ex);
//                } catch (ExecutionException ex) {
//                    Logger.getLogger(ArticleCacheManager.class.getName()).log(Level.SEVERE, null, ex);
//                }
//            }
//        }, 0, 5, TimeUnit.MINUTES);
//    }
//
//    public static void updateArticleMap() throws SQLException {
//        ArticleDAO articleDAO = new ArticleDAO();
//        ArrayList<ArticleBean> alArticle = articleDAO.getAllArticles(articleMap);
//    }
//
//    public static void updateArticleCache() throws SQLException, ExecutionException {
//        updateArticleMap();
//        for (Integer id : articleMap.keySet()) {
//            articleCache.get(id);
//        }
//
//    }
//
//    public static void updateDetailedMap() {
//        ArticleDAO artDAO = new ArticleDAO();
//        detailedArticleMap = artDAO.getArticleByCat(generalArticleMap);
//    }
//
//    public static void updateDetailedArticleCache() throws ExecutionException {
//        updateDetailedMap();
//        for (Integer id : detailedArticleMap.keySet()) {
//            detailedArticleCache.get(id);
//        }
//    }
//
//    //2:28AM, 0526
//}
