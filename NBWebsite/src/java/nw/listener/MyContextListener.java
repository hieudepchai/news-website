/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.listener;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import nw.bean.ArticleBean;
import nw.dao.ArticleDAO;
import nw.jdbc.*;
import nw.utils.ActivityLib;
import nw.utils.ArticleLib;
import nw.utils.CategoryLib;
import nw.utils.CommentLib;
import nw.utils.ImageLib;

/**
 * Web application lifecycle listener.
 *
 * @author DELL
 */
public class MyContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection conn1 = DBconnect.conn;
        new ArticleLib();
        new ImageLib();
        new CategoryLib();
        new CommentLib();
        new ActivityLib();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
