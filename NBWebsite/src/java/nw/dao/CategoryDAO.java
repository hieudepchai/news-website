
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
import java.util.List;
import nw.bean.CategoryBean;
import static nw.jdbc.DBconnect.getConnection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import nw.bean.*;
import static nw.jdbc.DBconnect.getConnection;
import nw.utils.MyBiMap;

/**
 *
 * @author quan1
 */
public class CategoryDAO {

    public HashMap<Integer, String> getAllCategory() throws SQLException, ClassNotFoundException {
        HashMap<Integer, String> listCate = new HashMap<>();
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Category");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listCate.put(rs.getInt("CategoryID"), rs.getString("Name"));
            }
            return listCate;
        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }

    public MyBiMap<Integer, String> getListCategory() {
        try {
            MyBiMap<Integer, String> res = new MyBiMap<Integer, String>();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Category");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                res.add(rs.getInt("CategoryID"), rs.getString("Name"));
            }
            return res;
        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public ArrayList<CategoryBean> getCategory() {
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("Select* from Category");
            ArrayList<CategoryBean> alType = new ArrayList<CategoryBean>();
            while (rs.next()) {
                CategoryBean category = new CategoryBean();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setName(rs.getString("Name"));
                category.setParentCategoryID(rs.getInt("ParentCategoryID"));
                alType.add(category);
            }
            return alType;
        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public int getIDCategory(String CategoryName) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT CategoryID FROM Category WHERE Name = ?");
            ps.setString(1, CategoryName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("CategoryID");
            }

        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return 0;
    }

    public String getNameCategory(int categoryID) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT Name FROM Category WHERE CategoryID = ?");
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("Name");
            }

        } catch (SQLException e) {
            System.out.println(e.toString());

        }
        return null;
    }

    public ArrayList<CategoryBean> getCategory(MyBiMap<Integer, String> map) {
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("Select* from Category");
            ArrayList<CategoryBean> alType = new ArrayList<CategoryBean>();
            while (rs.next()) {
                CategoryBean category = new CategoryBean();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setName(rs.getString("Name"));
                category.setParentCategoryID(rs.getInt("ParentCategoryID"));
                alType.add(category);
                map.add(category.getCategoryID(), category.getName());
            }
            return alType;

        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public CategoryBean getCategoryByID(int CategoryID) throws ClassNotFoundException {
        try {
            CategoryBean category = new CategoryBean();
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Category WHERE CategoryID = ?");
            ps.setInt(1, CategoryID);
            ResultSet rs = ps.executeQuery();
            if (!rs.first()) {
                return null;
            }
            category.setCategoryID(rs.getInt("CategoryID"));
            category.setName(rs.getString("Name"));
            category.setParentCategoryID(rs.getInt("ParentCategoryID"));
            return category;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }
    }

    public int insertCategory(CategoryBean category) throws SQLException, ClassNotFoundException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO `Category` (`CategoryID`, `Name`, `ParentCategoryID`) VALUES (NULL,?,?)");
            ps.setString(1, category.getName());
            ps.setInt(2, category.getParentCategoryID());
            System.out.println(ps);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.toString());
            return -1;
        }
    }

    public int deleteCategoryByID(int id) throws ClassNotFoundException {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("delete from Category where CategoryID = ?");
            ps.setInt(1, id);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.toString());
            return -1;
        }
    }

    public int updateCategory(CategoryBean category) {
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("Update Category set Name=?, ParentCategoryID=? where CategoryID=? ");
            ps.setString(1, category.getName());
            ps.setInt(2, category.getParentCategoryID());
            ps.setInt(3, category.getCategoryID());
            return ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
            return -1;
        }
    }
}

