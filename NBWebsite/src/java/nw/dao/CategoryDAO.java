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

/**
 *
 * @author quan1
 */
public class CategoryDAO {
    public List<CategoryBean> getAllCategorys(){
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public int getIDCategory(String CategoryName) throws ClassNotFoundException{
        try{
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT CategoryID FROM Category WHERE Name = ?");
        ps.setString(1, CategoryName);
        ResultSet rs = ps.executeQuery();
        if (rs.next()){
            return rs.getInt("CategoryID");
        }
        
        }
        catch(SQLException e){
             System.out.println(e.toString());
             
        }  
        return 0;
    }
}
