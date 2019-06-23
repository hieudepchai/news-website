package nw.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import nw.bean.CommentBean;
import nw.dao.CommentDAO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author quan1
 */
public class CommentLib {
    private static List<CommentBean> listAllComment = new ArrayList<>();
    private static List<CommentBean> listNewComment = new ArrayList<>();
    private static HashMap<Integer, List<CommentBean>> mapCommentJournalist = new HashMap<>();
    private static ScheduledExecutorService commentScheduler = Executors.newSingleThreadScheduledExecutor();
    
    static{
        CommentDAO cmtDAO = new CommentDAO();
        listAllComment = cmtDAO.getAllComment();
    }
    
    private static void update(){
        CommentDAO cmtDAO = new CommentDAO();
        cmtDAO.insertListCmt(listNewComment);
        listAllComment = cmtDAO.getAllComment();
        
        listNewComment.clear();
    }
    
    static {
        commentScheduler.scheduleWithFixedDelay(
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
    
    public CommentLib(){}
    
    public static boolean insertComment(CommentBean cmt){  //date created != null
        try {
            listAllComment.add(cmt);
            listNewComment.add(cmt);
            return true;
        } catch (Exception e) {
           System.out.println(e.toString());
           return false;
        }
    }
    
    public static void createListCommentJournalist(int journalistID){
        List<CommentBean> listCmtJournalist = new ArrayList<>();
        for(int i = listAllComment.size() - 1; i >= 0 ; i--){
            if(listAllComment.get(i).getJournalistID() == journalistID){
                listCmtJournalist.add(listAllComment.get(i));
            }
        }
        mapCommentJournalist.put(journalistID, listCmtJournalist);
    }

    public static List<CommentBean> getListAllComment() {
        return listAllComment;
    }
    
    public static List<CommentBean> getCommentJournalist(int JournalistID){
        return mapCommentJournalist.get(JournalistID);
    }
}
