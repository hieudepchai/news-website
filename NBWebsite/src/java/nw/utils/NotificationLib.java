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
import nw.bean.CommentBean;
import nw.dao.notificationDAO;

/**
 *
 * @author quan1
 */
public class NotificationLib {
    private static List<Pair<Integer, ActivityBean>> listAllNotification = new ArrayList<>();
    private static HashMap<Integer, List<Pair<Integer, ActivityBean>>> mapNotificationJournalist = new HashMap<>();
    private static HashMap<Integer, List<Pair<Integer, ActivityBean>>> mapNewNotification = new HashMap<>();
    //private static List<Pair<Integer, Integer>> listAccountLogged = new ArrayList<>(); // key = type account, accountID, 1: journalist
    private static ScheduledExecutorService notificationScheduler = Executors.newSingleThreadScheduledExecutor();
    
    static{
        try {
            notificationDAO notifyDAO = new notificationDAO();
            listAllNotification = notifyDAO.getAllNotification();
            
            for(int i=0; i<listAllNotification.size()-1; i++)
                for(int j=i+1; j<listAllNotification.size(); j++){
                    if (listAllNotification.get(i).getValue().getTime().compareTo(listAllNotification.get(j).getValue().getTime()) > 0) {
                    Pair<Integer, ActivityBean> temp = listAllNotification.get(i);
                    listAllNotification.set(i, listAllNotification.get(j));
                    listAllNotification.set(j, temp);
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NotificationLib.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private static void update(){
        try {
            notificationDAO notifyDAO = new notificationDAO();
            listAllNotification = notifyDAO.getAllNotification();
            
            mapNewNotification.clear();
            
//            for (int i=0; i<listAccountLogged.size(); i++){
//                if(listAccountLogged.get(i).getKey() == 1)
//                    createlistNotificationJournalist(listAccountLogged.get(i).getValue());
//            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NotificationLib.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    static {
        notificationScheduler.scheduleWithFixedDelay(
                new Runnable() {
            public void run() {
                try {
                    update();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }
            }
        }, 0, 60, TimeUnit.MINUTES);
    }
    
    public static void insertNotification(Pair<Integer, ActivityBean> notify){
        listAllNotification.add(notify);
        mapNotificationJournalist.get(notify.getValue().getDoerID()).add(0, notify);
        mapNewNotification.get(notify.getValue().getDoerID()).add(0, notify);
    }
    
    public static List<String> CalTimeListNotification(List<Pair<Integer, ActivityBean>> listNotifyAccount, HashMap<Integer, String> TopicImageMap){
        try {
            //List<Pair<Integer, ActivityBean>> listNotify = new ArrayList<>(listNotifyAccount);
            List<String> time = new ArrayList<>();
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();             
            
            for(int i=0; i<listNotifyAccount.size(); i++){
                
                Date Time = formatter.parse(listNotifyAccount.get(i).getValue().getTime());
                long diff = date.getTime() - Time.getTime();
                int diffMinutes = (int) (diff / (60 * 1000));
                int diffHours = (int) (diff / (60 * 60 * 1000));
                int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
                
                if(diffDays == 0 && diffHours == 0){
                    time.add(diffMinutes + "m");
                }else if(diffDays == 0 && diffHours != 0){
                    time.add(diffHours + "h");
                }else{
                    time.add(diffDays + "d");
                }
                listNotifyAccount.get(i).getValue().setTopicImage(TopicImageMap.get(listNotifyAccount.get(i).getValue().getArticleID()));
            }
            
            return time;
        } catch (ParseException ex) {
            Logger.getLogger(NotificationLib.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
            
    public static void createlistNotificationJournalist(int JournalistID){
        List<Pair<Integer, ActivityBean>> listNotifyAccount = new ArrayList<>();
        List<CommentBean> listAllCmt = CommentLib.getListAllComment();
        for(int i=listAllNotification.size()-1; i>=0; i--){
            if (listAllNotification.get(i).getValue().getDoerID() != JournalistID && listAllNotification.get(i).getValue().getJournalistID() == JournalistID){
                listNotifyAccount.add(listAllNotification.get(i));
            }else if(listAllNotification.get(i).getKey() == 12 && listAllNotification.get(i).getValue().getLevel() == 2){
                for(int j=0; j<listAllCmt.size(); j++)
                    if(listAllCmt.get(j).getCommentID() == listAllNotification.get(i).getValue().getRepliedID() && listAllCmt.get(j).getAccountID() == JournalistID){
                        listNotifyAccount.add(listAllNotification.get(i));
                    }
                
            }
        }
        //listAccountLogged.add(new Pair<>(1, JournalistID));
        mapNotificationJournalist.put(JournalistID, listNotifyAccount);
        mapNewNotification.put(JournalistID, null);
    }
    
    public static void clearListNewNotificationJl(int JournalistID){
        if(mapNewNotification.get(JournalistID) != null)
            mapNewNotification.get(JournalistID).clear();
    }
    
    public static List<Pair<Integer, ActivityBean>> getListNotifyAccount(int AccountID){
        return mapNotificationJournalist.get(AccountID);
    }
    
    public static List<Pair<Integer, ActivityBean>> getListNewNotifyAccount(int AccountID){
        return mapNewNotification.get(AccountID);
    }
}
