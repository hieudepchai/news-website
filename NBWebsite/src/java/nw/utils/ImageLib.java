/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import nw.bean.Image;
import nw.dao.ImageDAO;

/**
 *
 * @author Admin
 */
public class ImageLib {

    private static ArrayList<Image> alImg = new ArrayList<Image>();
    private static HashMap<Integer, String> TopicImageMap = new HashMap<>();
    private static HashMap<Integer, List<Image>> ImageAccountMap = new HashMap<>();
    private static List<Image> listNewImg = new ArrayList<>();
    private static ScheduledExecutorService imgScheduler = Executors.newSingleThreadScheduledExecutor();

    static {
        try {
            ImageDAO imgDAO = new ImageDAO();
            alImg = imgDAO.getListImage();
            
            createTopicImgMap();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ImageLib.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void update() throws ClassNotFoundException {
        ImageDAO imgDAO = new ImageDAO();
        alImg = imgDAO.getListImage();
        
        //imgDAO.InsertListImage(listNewImg);
        listNewImg.clear();
        ImageAccountMap.clear();
    }

    private static void createTopicImgMap(){
        for(int i=0; i<alImg.size(); i++){
            if(alImg.get(i).getThumbnail() == 1)
                TopicImageMap.put(alImg.get(i).getArticleID(), alImg.get(i).getSource());
        }
    }
    
    static {
        imgScheduler.scheduleWithFixedDelay(
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
    public ArrayList<Image> getList()
    {
        return alImg;
    }
    public String getThumbnail(int ArticleID)
    {
        for(Image img: alImg )
        {
            if(img.getArticleID()==ArticleID && img.getThumbnail()==1)
                return img.getSource();
        }
        return null;
    }

    public static void insertNewImg(Image img){
        listNewImg.add(img);
        alImg.add(img);
        if(img.getThumbnail() == 1)
            TopicImageMap.put(img.getAccountID(), img.getSource());
        ImageAccountMap.get(img.getAccountID()).add(img);
    }
        
    public static void createListImageAccount(int AccountID){
        List<Image> listImg = new ArrayList<>();
        for(int i=0; i<alImg.size(); i++){
            if(alImg.get(i).getAccountID() == AccountID){
                listImg.add(alImg.get(i));
            }
        }
        ImageAccountMap.put(AccountID, listImg);
    }
    
    public static List<Image> getListImageAccount(int AccountID){
        return ImageAccountMap.get(AccountID);
    }
    
    public static HashMap<Integer, String> getTopicImageMap() {
        return TopicImageMap;
    }
    
}