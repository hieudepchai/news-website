/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import nw.bean.AccountBean;
import nw.dao.AccountDAO;

/**
 *
 * @author Admin
 */
public class AccountLib {

    private static ArrayList<AccountBean> alAccount = new ArrayList<AccountBean>();
    private static ScheduledExecutorService articleScheduler = Executors.newSingleThreadScheduledExecutor();

    static {
        try {
            AccountDAO accDAO = new AccountDAO();
            alAccount = accDAO.getAccount();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountLib.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    static {
        articleScheduler.scheduleWithFixedDelay(
                new Runnable() {
            public void run() {
                try {
                    AccountDAO accDAO = new AccountDAO();
                    alAccount = accDAO.getAccount();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }
            }
        }, 0, 10, TimeUnit.MINUTES);
    }

    public static ArrayList<AccountBean> getAlAccount() {
        return alAccount;
    }
       
}
