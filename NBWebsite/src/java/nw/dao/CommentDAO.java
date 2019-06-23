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
import java.util.List;
import java.util.Map;
import nw.bean.CommentBean;
import nw.jdbc.DBconnect;
import static nw.jdbc.DBconnect.getConnection;

/**
 *
 * @author Admin
 */
public class CommentDAO {

        public int CountComment() throws SQLException, ClassNotFoundException {
        int count = 0;
        Connection conn = getConnection();
        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery("select * from Comment");
        while (rs.next()) {
            count += 1;
        }
        return count;
    }

    public ArrayList<CommentBean> getCommentLv1(int ArticleID, Map<Integer, ArrayList<CommentBean>> lv2map) {
        try {
            ArrayList<CommentBean> res = new ArrayList<CommentBean>();
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("select* from Comment where ArticleID = ? order by Level asc, RepliedCommentID asc, DateCreated asc");
            ps.setInt(1, ArticleID);
            ResultSet rs = ps.executeQuery();
            int row = 0;
            while (rs.next() && rs.getInt("Level") == 1) {
                CommentBean cmt = new CommentBean(rs.getInt("CommentID"), rs.getInt("ArticleID"), rs.getInt("RepliedCommentID"), rs.getInt("AccountID"), rs.getString("Content"), rs.getInt("NoOfLikes"), rs.getInt("Level"), rs.getString("DateCreated"));
                res.add(cmt);
                row = row + 1;
            }
            ArrayList<CommentBean> alTemp = new ArrayList<CommentBean>();
            int currRpID = 0;
            if (rs.absolute(row + 1)) {
                currRpID = rs.getInt("RepliedCommentID");
                do {
                    int newRpID = rs.getInt("RepliedCommentID");
                    if (newRpID == currRpID) {
                        alTemp.add(new CommentBean(rs.getInt("CommentID"), rs.getInt("ArticleID"), rs.getInt("RepliedCommentID"), rs.getInt("AccountID"), rs.getString("Content"), rs.getInt("NoOfLikes"), rs.getInt("Level"), rs.getString("DateCreated")));
                    } else {
                        lv2map.put(currRpID, new ArrayList<CommentBean>(alTemp));
                        alTemp.clear();
                        currRpID = newRpID;
                        alTemp.add(new CommentBean(rs.getInt("CommentID"), rs.getInt("ArticleID"), rs.getInt("RepliedCommentID"), rs.getInt("AccountID"), rs.getString("Content"), rs.getInt("NoOfLikes"), rs.getInt("Level"), rs.getString("DateCreated")));
                    }
                } while (rs.next());
            }
            lv2map.put(currRpID, new ArrayList<CommentBean>(alTemp));
            return res;
        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public ArrayList<CommentBean> getCommentByAccount(int AccountID) {
        try {
            ArrayList<CommentBean> alCmt = new ArrayList<CommentBean>();
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("select c.CommentID, c.Content,c.AccountID, a.ArticleID, a.Heading, a.CategoryID, a.SubCategoryID, c.DateCreated\n"
                    + "from Comment c, Article a where c.ArticleID = a.ArticleID and AccountID = ? order by DateCreated desc");
            ps.setInt(1, AccountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CommentBean cmt = new CommentBean(rs.getInt("CommentID"), rs.getInt("ArticleID"), rs.getInt("AccountID"), rs.getString("Content"), rs.getString("DateCreated"), rs.getString("Heading"), rs.getInt("CategoryID"), rs.getInt("SubCategoryID"));
                alCmt.add(cmt);
            }
            return alCmt;
        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public int insertComment(CommentBean cmt) {
        try {
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into Comment(ArticleID, RepliedCommentID, AccountID, Content, NoOfLikes, Level) values(?,?,?,?,?,?)");            
            ps.setInt(1, cmt.getArticleID());
            ps.setInt(2, cmt.getRepliedCommentID());
            ps.setInt(3, cmt.getAccountID());
            ps.setString(4, cmt.getContent());
            ps.setInt(5, cmt.getNoOfLikes());
            ps.setInt(6, cmt.getLevel());
            int res = ps.executeUpdate();
            PreparedStatement ps2 = conn.prepareStatement("SELECT LAST_INSERT_ID() as ID;");
            return res;
        } catch (Exception e) {
            System.out.println(e.toString());
            return -1;
        }
    }

    public ArrayList<CommentBean> getComment() throws ClassNotFoundException {
        try {
            ArrayList<CommentBean> res = new ArrayList<CommentBean>();
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from Comment");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CommentBean cmt = new CommentBean(rs.getInt("CommentID"), rs.getInt("ArticleID"), rs.getInt("RepliedCommentID"), rs.getInt("AccountID"), rs.getString("Content"), rs.getInt("NoOfLikes"), rs.getInt("Level"), rs.getString("DateCreated"));
                res.add(cmt);
            }
            return res;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public int deleteCommentbyID(int CommentID) {
        try {
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("delete from Comment where CommentID = ?");
            ps.setInt(1, CommentID);
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
            return -1;
        }
    }

    public int deleteComment(int CommentID) {
        try {
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps1 = conn.prepareStatement("delete from Comment where CommentID = ?");
            ps1.setInt(1, CommentID);
            int delete1 = ps1.executeUpdate();
            //           
            PreparedStatement ps2 = conn.prepareStatement("delete from Comment where RepliedCommentID = ?");
            ps2.setInt(1, CommentID);
            int delete2 = ps2.executeUpdate();
            return delete1;
        } catch (Exception e) {
            System.out.println(e.toString());
            return -1;
        }
    }

    public List<CommentBean> getAllComment() {
        try {
            List<CommentBean> listComment = new ArrayList<>();
            Connection conn = DBconnect.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from Comment, (select ArticleID, Heading, JournalistID, CategoryID, SubCategoryID from Article) as Article, (select AccountID, FirstName, LastName, ProfilePicture from Account) as Account "
                    + "where Comment.ArticleID = Article.ArticleID and Comment.AccountID = Account.AccountID order by DateCreated asc;");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CommentBean cmt = new CommentBean(rs.getInt("CommentID"), rs.getInt("ArticleID"), rs.getString("Heading"), rs.getInt("JournalistID"), rs.getInt("CategoryID"), rs.getInt("SubCategoryID"), rs.getInt("RepliedCommentID"), rs.getInt("AccountID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("ProfilePicture"), rs.getString("Content"), rs.getInt("NoOfLikes"), rs.getInt("Level"), rs.getString("DateCreated"));
                listComment.add(cmt);
            }
            return listComment;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public boolean insertListCmt(List<CommentBean> listComment) {
        try {
            Connection conn = DBconnect.getConnection();
            for (int i = 0; i < listComment.size(); i++) {
                PreparedStatement ps = conn.prepareStatement("insert into Comment(ArticleID, RepliedCommentID, AccountID, Content, NoOfLikes, Level, DateCreated) values(?,?,?,?,?,?, ?)");
                ps.setInt(1, listComment.get(i).getArticleID());
                ps.setInt(2, listComment.get(i).getRepliedCommentID());
                ps.setInt(3, listComment.get(i).getAccountID());
                ps.setString(4, listComment.get(i).getContent());
                ps.setInt(5, listComment.get(i).getNoOfLikes());
                ps.setInt(6, listComment.get(i).getLevel());
                ps.setString(7, listComment.get(i).getDateCreated());
                ps.executeUpdate();
            }
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.toString());
            return false;
        }
    }
}
