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
public class ImageDAO {

    public ArrayList<Image> getAllImage(int accID) throws ClassNotFoundException { // list of image by AccountID
        try {
            ArrayList<Image> listImage = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Image WHERE AccountID = ? group by source;");
            ps.setInt(1, accID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listImage.add(new Image(rs.getInt("ImageID"), rs.getString("Source"), rs.getInt("ArticleID"), rs.getInt("AccountID"), rs.getString("DateCreated"), rs.getInt("Thumbnail")));
            }
            return listImage;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }
        public ArrayList<Image> getListImage() throws ClassNotFoundException { // list of image 
        try {
            ArrayList<Image> listImage = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Image");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listImage.add(new Image(rs.getInt("ImageID"), rs.getString("Source"), rs.getInt("ArticleID"), rs.getInt("AccountID"), rs.getString("DateCreated"), rs.getInt("Thumbnail")));
            }
            return listImage;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }
        public ArrayList<Image> getListImagebyThumbnail() throws ClassNotFoundException { // list of image 
        try {
            ArrayList<Image> listImage = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Image where Thumbnail=1");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listImage.add(new Image(rs.getInt("ImageID"), rs.getString("Source"), rs.getInt("ArticleID"), rs.getInt("AccountID"), rs.getString("DateCreated"), rs.getInt("Thumbnail")));
            }
            return listImage;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }

    public boolean InsertListImage(List<Image> listimg) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();
            for (int i = 0; i < listimg.size(); i++) {
                PreparedStatement ps = conn.prepareStatement("INSERT INTO `Image` (ImageID, Source, ArticleID, AccountID, DateCreated, Thumbnail) VALUES (null ,?, ?, ?, ?, ?)");
                ps.setString(1, listimg.get(i).getSource());
                if (listimg.get(i).getArticleID() == 0) {
                    ps.setString(2, null);
                } else {
                    ps.setInt(2, listimg.get(i).getArticleID());
                }
                ps.setInt(3, listimg.get(i).getAccountID());
                ps.setString(4, listimg.get(i).getDateCreated());
                ps.setInt(5, listimg.get(i).getThumbnail());
                ps.executeUpdate();
            }
            

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
        return true;
    }   
    
    public boolean InsertImage(Image img) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO `Image` (ImageID, Source, ArticleID, AccountID, DateCreated, Thumbnail) VALUES (null ,?, ?, ?, ?, ?)");
            ps.setString(1, img.getSource());
            if(img.getArticleID() == 0)
                ps.setString(2, null);
            else
                ps.setInt(2, img.getArticleID());
            ps.setInt(3, img.getAccountID());
            ps.setString(4, img.getDateCreated());
            ps.setInt(5, img.getThumbnail());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
        return true;
    }

    public ArrayList<Image> getImgArticle(int ArticleID) throws ClassNotFoundException {
        try {
            ArrayList<Image> listImage = new ArrayList<>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Image WHERE ArticleID = ?;");
            ps.setInt(1, ArticleID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listImage.add(new Image(rs.getInt("ImageID"), rs.getString("Source"), rs.getInt("ArticleID"), rs.getInt("AccountID"), rs.getString("DateCreated"), rs.getInt("Thumbnail")));
            }
            return listImage;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }

    public boolean updateListImageArticle(ArrayList<Image> listImg) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();

            for (int i = 0; i < listImg.size(); i++) {
                if (listImg.get(i).getThumbnail() == 1) {
                    PreparedStatement ps1 = conn.prepareStatement("SELECT ImageID, Source FROM Image WHERE ArticleID = ? and Thumbnail = 1;");
                    ps1.setInt(1, listImg.get(i).getArticleID());
                    ResultSet rs1 = ps1.executeQuery();
                    if (rs1.next()) {
                        if (!listImg.get(i).getSource().equals(rs1.getString("Source"))) {
                            int imageID = rs1.getInt("ImageID");
                            PreparedStatement ps2 = conn.prepareStatement("delete from Image where ImageID = ?;");
                            ps2.setInt(1, imageID);
                            ps2.executeUpdate();
                            this.InsertImage(listImg.get(i));
                        }
                    }
                } else {
                    int insert = 1;
                    PreparedStatement ps = conn.prepareStatement("SELECT Source FROM Image WHERE ArticleID = ? and Thumbnail = 0;");
                    ps.setInt(1, listImg.get(0).getArticleID());
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        if (listImg.get(i).getSource().equals(rs.getString("Source"))) {
                            insert = 0;
                        }
                    }
                    if (insert == 1) {
                        this.InsertImage(listImg.get(i));
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        }
        return true;
    }
}