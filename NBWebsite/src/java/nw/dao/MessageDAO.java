/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import nw.bean.*;
import static nw.jdbc.DBconnect.getConnection;

/**
 *
 * @author quan1
 */
public class MessageDAO {
    public boolean insertMessage(MessageBean message) throws ClassNotFoundException {
        try{
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("INSERT INTO `Message` (`MessageID`, `ArticleID`, `SenderID`, `ReceiverID`, `RepliedMessageID`, `Content`, `DateCreated`) VALUES (NULL, ?,?,?,?,?, NULL)");
        ps.setInt(1, message.getArticleID());
        ps.setInt(2, message.getSenderID());
        if (message.getReceiverID() == 0){
            ps.setString(3, null);
        }else{
            ps.setInt(3, message.getReceiverID());
        }
        if (message.getRepliedMessageID() == 0){
            ps.setString(4, null);
        }else{
            ps.setInt(4, message.getRepliedMessageID());
        }
        ps.setString(5, message.getContent());
        ps.executeUpdate();
        
        }
        catch(SQLException e){
             System.out.println(e.toString());
             return false;
        }  
        return true;
    }
    
    public ArrayList<MessageBean> getListMsgArticle(int ArticleID) throws ClassNotFoundException{
        try{
        ArrayList<MessageBean> listMsg = new ArrayList<>();
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Message WHERE ArticleID = ?");
        ps.setInt(1, ArticleID);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            listMsg.add(new MessageBean(rs.getInt("MessageID"), rs.getInt("ArticleID"), rs.getInt("SenderID"), rs.getInt("ReceiverID"), rs.getInt("RepliedMessageID"), rs.getString("Content"), rs.getString("DateCreated")));
        }
        return listMsg;
        }
        catch(SQLException e){
             System.out.println(e.toString());
             
        }  
        return null;
    }
    
    public ArrayList<MessageBean> getListMsgJournalist(int journalistID) throws ClassNotFoundException{
        try{
        ArrayList<MessageBean> listMsg = new ArrayList<>();
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Message WHERE ReceiverID = ?");
        ps.setInt(1, journalistID);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            listMsg.add(new MessageBean(rs.getInt("MessageID"), rs.getInt("ArticleID"), rs.getInt("SenderID"), rs.getInt("ReceiverID"), rs.getInt("RepliedMessageID"), rs.getString("Content"), rs.getString("DateCreated")));
        }
        return listMsg;
        }
        catch(SQLException e){
             System.out.println(e.toString());
             
        }  
        return null;
    }
}
