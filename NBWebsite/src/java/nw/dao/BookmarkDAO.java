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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import nw.bean.BookmarkBean;
import nw.jdbc.DBconnect;

/**
 *
 * @author DUNG
 */
public class BookmarkDAO {

    public ArrayList<BookmarkBean> getBookmark() throws ClassNotFoundException {
        try {
            ArrayList<BookmarkBean> res = new ArrayList<BookmarkBean>();
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from Bookmark");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookmarkBean bookmark = new BookmarkBean(rs.getInt("BookmarkID"), rs.getInt("AccountID"), rs.getInt("ArticleID"), rs.getString("Title"), rs.getString("DateCreated"));
                res.add(bookmark);
            }
            return res;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public int deleteBookmarkByID(int BookmarkID) {
        try {
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("delete from Bookmark where BookmarkID = ?");
            ps.setInt(1, BookmarkID);
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
            return -1;
        }
    }

    public ArrayList<BookmarkBean> getBookmarkByAccount(int AccountID) throws ClassNotFoundException {
        try {
            ArrayList<BookmarkBean> res = new ArrayList<BookmarkBean>();
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(" select b.BookmarkID, b.AccountID, b.ArticleID, a.Heading, a.CategoryID, a.SubCategoryID, b.Title, b.DateCreated from Bookmark b, Article a where b.ArticleID = a.ArticleID and b.AccountID = ?");
            ps.setInt(1, AccountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookmarkBean bookmark = new BookmarkBean(rs.getInt("BookmarkID"), rs.getInt("AccountID"), rs.getInt("ArticleID"), rs.getString("Title"), rs.getString("DateCreated"), rs.getString("Heading"), rs.getInt("CategoryID"), rs.getInt("SubCategoryID"));
                res.add(bookmark);
            }
            return res;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public int insertBookmark(BookmarkBean bm) {
        try {
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into Bookmark(AccountID,ArticleID,Title) values(?,?,?);");
            ps.setInt(1, bm.getAccountID());
            ps.setInt(2, bm.getArticleID());
            ps.setString(3, bm.getTitle());
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
            return -1;
        }
    }

    public int updateBookmark(BookmarkBean bm) {
        try {
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("update Bookmark set Title = ? where BookmarkID = ?");
            ps.setString(1, bm.getTitle());
            ps.setInt(2, bm.getBookmarkID());
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
            return -1;
        }
    }

}
