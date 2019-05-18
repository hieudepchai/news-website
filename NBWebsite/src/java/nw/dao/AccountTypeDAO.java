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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import nw.bean.AccountTypeBean;
import nw.jdbc.DBconnect;
import static nw.jdbc.DBconnect.getConnection;
import nw.utils.MyBiMap;
/**
 *
 * @author Admin
 */
public class AccountTypeDAO {

    public AccountTypeBean getAccountTypeByID(int AccountTypeID) throws ClassNotFoundException {
        try {
            AccountTypeBean AccountType = new AccountTypeBean();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM AccountType WHERE AccountTypeID = ?");
            ps.setInt(1, AccountTypeID);
            ResultSet rs = ps.executeQuery();
            if (!rs.first()) {
                return null;
            }
            AccountType.setAccountMng(rs.getInt("AccountMng"));
            AccountType.setAccountTypeID(rs.getInt("AccountTypeID"));
            AccountType.setAccountTypeMng(rs.getInt("AccountTypeMng"));
            AccountType.setAdminRight(rs.getInt("AdminRight"));
            AccountType.setArticleMng(rs.getInt("ArticleMng"));
            AccountType.setBookmarkMng(rs.getInt("BookmarkMng"));
            AccountType.setCommentMng(rs.getInt("CommentMng"));
            AccountType.setFeedbackMng(rs.getInt("FeedbackMng"));
            AccountType.setImageMng(rs.getInt("ImageMng"));
            AccountType.setJournalistRight(rs.getInt("JournalistRight"));
            AccountType.setName(rs.getString("Name"));
            AccountType.setReaderRight(rs.getInt("ReaderRight"));
            return AccountType;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public ArrayList<AccountTypeBean> getAccountType() {
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("Select* from AccountType");
            ArrayList<AccountTypeBean> alType = new ArrayList<AccountTypeBean>();
            while(rs.next())
            {
                AccountTypeBean type = new AccountTypeBean();
                type.setAccountMng(rs.getInt("AccountMng"));
                type.setAccountTypeID(rs.getInt("AccountTypeID"));
                type.setAccountTypeMng(rs.getInt("AccountTypeMng"));
                type.setAdminRight(rs.getInt("AdminRight"));
                type.setArticleMng(rs.getInt("ArticleMng"));
                type.setBookmarkMng(rs.getInt("BookmarkMng"));
                type.setCommentMng(rs.getInt("CommentMng"));
                type.setFeedbackMng(rs.getInt("FeedbackMng"));
                type.setImageMng(rs.getInt("ImageMng"));
                type.setJournalistRight(rs.getInt("JournalistRight"));
                type.setName(rs.getString("Name"));
                type.setReaderRight(rs.getInt("ReaderRight"));
                alType.add(type);
            }
            return alType;

        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
    }
    public ArrayList<AccountTypeBean> getAccountType(MyBiMap<Integer,String> map) {
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("Select* from AccountType");
            ArrayList<AccountTypeBean> alType = new ArrayList<AccountTypeBean>();
            while(rs.next())
            {
                AccountTypeBean type = new AccountTypeBean();
                type.setAccountMng(rs.getInt("AccountMng"));
                type.setAccountTypeID(rs.getInt("AccountTypeID"));
                type.setAccountTypeMng(rs.getInt("AccountTypeMng"));
                type.setAdminRight(rs.getInt("AdminRight"));
                type.setArticleMng(rs.getInt("ArticleMng"));
                type.setBookmarkMng(rs.getInt("BookmarkMng"));
                type.setCommentMng(rs.getInt("CommentMng"));
                type.setFeedbackMng(rs.getInt("FeedbackMng"));
                type.setImageMng(rs.getInt("ImageMng"));
                type.setJournalistRight(rs.getInt("JournalistRight"));
                type.setName(rs.getString("Name"));
                type.setReaderRight(rs.getInt("ReaderRight"));
                alType.add(type);
                map.add(type.getAccountTypeID(), type.getName());
            }
            return alType;

        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
    }
}
