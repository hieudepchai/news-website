/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestMain;
import java.sql.*;
import nw.jdbc.DBconnect;
import nw.bean.*;
import nw.dao.*;
import java.util.*;
/**
 *
 * @author Admin
 */
public class NewMain {

    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        // TODO code application logic here
       AccountDAO accDAO = new AccountDAO();
        ArrayList<AccountBean> AL = accDAO.getAccount();
        AL.forEach((tempBean) -> {
            System.out.println(tempBean.getFirstName());
        });
       AccountBean accBean1 = new AccountBean();
       //username, password, firstname, lastname, email,phone, accounttypeid, valid
       accBean1.setUsername("eihnimadmin");
       accBean1.setPassword("1");
       accBean1.setFirstName("Hieu");
       accBean1.setLastName("Nguyen");
       accBean1.setEmail("eihnim@gmail.com");
       accBean1.setPhone("1212121212");
       accBean1.setAccountTypeID(5);
       accBean1.setValid(1);
       int resInsert = accDAO.insertAccount(accBean1);
       System.out.println(resInsert);
       
      
       AccountBean accBean2 = new AccountBean();
       int resGetByPw = accDAO.getAccountByPassword("eihnim", "2", accBean2);
       System.out.println(accBean2.getPassword());
      
       CategoryDAO cateDAO = new CategoryDAO();
       int cateID = cateDAO.getIDCategory("Business");
       System.out.println("Category id: " + cateID);
    }
    
}
