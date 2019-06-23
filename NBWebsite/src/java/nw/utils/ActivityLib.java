/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import nw.bean.ActivityBean;
import nw.bean.ArticleBean;
import nw.bean.CommentBean;
import nw.bean.Image;
import nw.bean.UpdateArticleActivityBean;
import nw.controller.journalistAllActivityServlet;
import nw.dao.UpdateArticleActivityDAO;

/**
 *
 * @author quan1
 */
public class ActivityLib {
    private static List<Pair<Integer, ActivityBean>> listAllActivity = new ArrayList<>();
    private static List<UpdateArticleActivityBean> listNewActivity = new ArrayList<>();
    private static HashMap<Integer, List<Pair<Integer, ActivityBean>>> activityJournalistMap = new HashMap<>();
    private static ScheduledExecutorService activityScheduler = Executors.newSingleThreadScheduledExecutor();
    
    static{
        try {
            UpdateArticleActivityDAO activityDAO = new UpdateArticleActivityDAO();
            listAllActivity = activityDAO.getListAllActivity();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ActivityLib.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private static void update(){
        try {
            UpdateArticleActivityDAO activityDAO = new UpdateArticleActivityDAO();
            activityDAO.insertListActivity(listNewActivity);
            listAllActivity = activityDAO.getListAllActivity();
            
            listNewActivity.clear();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ActivityLib.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    static {
        activityScheduler.scheduleWithFixedDelay(
                new Runnable() {
            public void run() {
                try {
                    update();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }
            }
        }, 0, 10, TimeUnit.MINUTES);
    }
    
    public ActivityLib(){}
    
    public static Pair<Integer, ActivityBean> getKindAction(UpdateArticleActivityBean activity, String Heading, String ShortDes, int JournalistID){
        ActivityBean action = new ActivityBean(activity.getDoerID(), activity.getArticleID(), Heading, ShortDes, JournalistID, activity.getDateCreated());
        if(activity.getCreated() == 1 && activity.getDraft() == 0){
            return new Pair<>(1, action);
        }else if(activity.getCreated() == 1 && activity.getDraft() == 1){
            return new Pair<>(3, action);
        }else if(activity.getCreated() == 0 && activity.getDraft() == 0 && activity.getTrash() == 0){
            return new Pair<>(6, action);
        }else if(activity.getCreated() == 0 && activity.getDraft() == 1 && activity.getTrash() == 0){
            return new Pair<>(5, action);
        }else if(activity.getTrash() == 1 && activity.getDraft() == 0){
            return new Pair<>(7, action);
        }else if(activity.getTrash() == 1 && activity.getDraft() == 1){
            return new Pair<>(9, action);
        }
        return null;
    }
    
    public static void insertActivity(UpdateArticleActivityBean activity, String Heading, String ShortDes, int JournalistID){
        listNewActivity.add(activity);
        
        Pair<Integer, ActivityBean> kindAction = getKindAction(activity, Heading, ShortDes, JournalistID);
        listAllActivity.add(kindAction);
        activityJournalistMap.get(activity.getDoerID()).add(0, kindAction);
        
    }
    
    public static void createListActivityJournalist(int journalistID, List <ArticleBean> listArticle, List<Image> listImage){
        List<Pair<Integer, ActivityBean>> listActivity = new ArrayList<>();
        List<CommentBean> listAllCmt = CommentLib.getListAllComment();
        for(int i = listAllActivity.size() - 1; i >= 0 ; i--){
            if(listAllActivity.get(i).getValue().getDoerID() == journalistID){
                if(listAllActivity.get(i).getKey() == 12 && listAllActivity.get(i).getValue().getLevel() == 2){
                    for(int j=0; j<listAllCmt.size(); j++){
                        if(listAllCmt.get(j).getCommentID() == listAllActivity.get(i).getValue().getRepliedID()){
                            listAllActivity.get(i).getValue().setReceiverID(listAllCmt.get(j).getAccountID());
                            listAllActivity.get(i).getValue().setFullNameReceiver(listAllCmt.get(j).getFirstName() + " " + listAllCmt.get(j).getLastName());
                        }
                    }
                }
                listActivity.add(listAllActivity.get(i));
            }
        }
        
        //recent activity of article
        for (int i = 0; i < listArticle.size(); i++) {
            try {
                Date createdDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(listArticle.get(i).getDateCreated());
                Date lastModified = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(listArticle.get(i).getLastModified());

//                    if (listArticle.get(i).getDraft() != 1){
//                        ActivityBean articleAction = new ActivityBean(listArticle.get(i).getArticleID(), listArticle.get(i).getHeading(), listArticle.get(i).getShortDescription(), listArticle.get(i).getDateCreated());
//                        listActivity.add(new Pair<>(1, articleAction)); //1: insert new article
//                    } else {
//                        ActivityBean articleAction = new ActivityBean(listArticle.get(i).getArticleID(), listArticle.get(i).getHeading(), listArticle.get(i).getShortDescription(), listArticle.get(i).getDateCreated());
//                        listActivity.add(new Pair<>(3, articleAction)); //3: insert a draft
//                    }
//                    
//                    if((!createdDate.equals(lastModified)) && listArticle.get(i).getCensored() != 1){
//                        if(listArticle.get(i).getTrash() == 1){
//                            ActivityBean articleAction = new ActivityBean(listArticle.get(i).getArticleID(), listArticle.get(i).getHeading(), listArticle.get(i).getShortDescription(), listArticle.get(i).getLastModified());
//                            listActivity.add(new Pair<>(6, articleAction)); //6: move article to trash
//                        }else if(listArticle.get(i).getDraft() == 1){ //update draft
//                            ActivityBean articleAction = new ActivityBean(listArticle.get(i).getArticleID(), listArticle.get(i).getHeading(), listArticle.get(i).getShortDescription(), listArticle.get(i).getLastModified());
//                            listActivity.add(new Pair<>(4, articleAction)); //4: update a draft
//                        }else{ //update article
//                            ActivityBean articleAction = new ActivityBean(listArticle.get(i).getArticleID(), listArticle.get(i).getHeading(), listArticle.get(i).getShortDescription(), listArticle.get(i).getLastModified());
//                            listActivity.add(new Pair<>(2, articleAction)); //2: update an article
//                        }
//                    }
                if (listArticle.get(i).getArticleID() <= 93) {
                    if (listArticle.get(i).getCensored() == 1) {
                        ActivityBean articleAction = new ActivityBean(listArticle.get(i).getJournalistID(), listArticle.get(i).getArticleID(), listArticle.get(i).getHeading(), listArticle.get(i).getShortDescription(), listArticle.get(i).getJournalistID(), listArticle.get(i).getDateCreated());
                        listActivity.add(new Pair<>(1, articleAction)); //1: insert new article
                    }
                }
                if ((!createdDate.equals(lastModified)) && listArticle.get(i).getCensored() == 0 && listArticle.get(i).getTrash() == 0) {
                    if (listArticle.get(i).getDraft() == 0) {
                        ActivityBean articleAction = new ActivityBean(listArticle.get(i).getJournalistID(), listArticle.get(i).getArticleID(), listArticle.get(i).getHeading(), listArticle.get(i).getShortDescription(), listArticle.get(i).getJournalistID(), listArticle.get(i).getLastModified());
                        listActivity.add(new Pair<>(2, articleAction)); //2: update an article
                    } else if (listArticle.get(i).getDraft() == 1) {
                        ActivityBean articleAction = new ActivityBean(listArticle.get(i).getJournalistID(), listArticle.get(i).getArticleID(), listArticle.get(i).getHeading(), listArticle.get(i).getShortDescription(), listArticle.get(i).getJournalistID(), listArticle.get(i).getLastModified());
                        listActivity.add(new Pair<>(4, articleAction)); //4: update a draft
                    }
                }
            } catch (ParseException ex) {
                Logger.getLogger(journalistAllActivityServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        for (int i = 0; i < listImage.size(); i++) {
            if (listImage.get(i).getArticleID() == 0) {
                String[] sourcePart = listImage.get(i).getSource().split("/");
                String fileName = sourcePart[sourcePart.length - 1];

                ActivityBean imageAction = new ActivityBean(fileName, listImage.get(i).getSource(), listImage.get(i).getDateCreated());
                listActivity.add(new Pair<>(8, imageAction));
            }
        }

        for (int i = 0; i < listActivity.size() - 1; i++) {
            for (int j = i + 1; j < listActivity.size(); j++) {
                if (listActivity.get(i).getValue().getTime().compareTo(listActivity.get(j).getValue().getTime()) < 0) {
                    Pair<Integer, ActivityBean> temp = listActivity.get(i);
                    listActivity.set(i, listActivity.get(j));
                    listActivity.set(j, temp);
                }
            }
        }

        activityJournalistMap.put(journalistID, listActivity);
    }
    
    public static List<Pair<Integer, ActivityBean>> getActivityJournalist(int JournalistID){
        return activityJournalistMap.get(JournalistID);
    }
}
