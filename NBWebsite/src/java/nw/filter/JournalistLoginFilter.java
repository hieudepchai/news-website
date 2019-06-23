/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.util.Pair;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nw.bean.AccountBean;
import nw.bean.AccountTypeBean;
import nw.bean.ActivityBean;
import nw.bean.ArticleBean;
import nw.bean.CommentBean;
import nw.bean.Image;
import nw.controller.journalistListOfArticlesServlet;
import nw.dao.*;
import nw.utils.ArticleLib;
import nw.utils.CommentLib;
import nw.utils.ImageLib;
import nw.utils.NotificationLib;


/**
 *
 * @author Admin
 */
public class JournalistLoginFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public JournalistLoginFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("JournalistLoginFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("JournalistLoginFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        String requestURI = req.getRequestURI();
        AccountBean CurrentAccount = (AccountBean) session.getAttribute("CurrentAccount");
        AccountTypeBean CurrentAccountType = (AccountTypeBean) session.getAttribute("CurrentAccountType");
        if (CurrentAccount == null || CurrentAccountType.getJournalistRight() != 1) {
            resp.sendRedirect(req.getContextPath() + "/manage/login");

        } else {
            //ArticleDAO artiDAO = new ArticleDAO();
            CategoryDAO cateDAO = new CategoryDAO();
            //ImageDAO imgDAO = new ImageDAO();
            int journalistID = CurrentAccount.getAccountID();

            try {
                List<ArticleBean> listArticle = ArticleLib.getListArticleJL(journalistID);
                if (listArticle == null) {
                    ArticleLib.createListAticleJl(journalistID);
                    listArticle = ArticleLib.getListArticleJL(journalistID);
                }
                HashMap<Integer, String> listCate = cateDAO.getAllCategory();

                session.setAttribute("listArticle", listArticle);
                session.setAttribute("listCate", listCate);

                List<Image> listImg = ImageLib.getListImageAccount(journalistID);
                if (listImg == null) {
                    ImageLib.createListImageAccount(journalistID);
                    listImg = ImageLib.getListImageAccount(journalistID);
                }
                session.setAttribute("listImage", listImg);

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(journalistListOfArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //comment
            List<CommentBean> listCmt = CommentLib.getCommentJournalist(journalistID);
            if(listCmt == null){
                CommentLib.createListCommentJournalist(journalistID);
                listCmt = CommentLib.getCommentJournalist(journalistID);
            }
            session.setAttribute("listComment", listCmt);

            //notification
            if (session.getAttribute("listNotification") == null) {
                List<Pair<Integer, ActivityBean>> listNotification = NotificationLib.getListNotifyAccount(journalistID);
                HashMap<Integer, String> TopicImageMap = ImageLib.getTopicImageMap(); //map store topic image(thumbnail = 1)
                if (listNotification == null) {
                    NotificationLib.createlistNotificationJournalist(journalistID);
                    listNotification = NotificationLib.getListNotifyAccount(journalistID);
                }
                //List<Pair<Integer, ActivityBean>> listNotify = new ArrayList<>(listNotification);
                //HashMap<Integer, String> time = NotificationLib.CalTimeListNotification(listNotify, TopicImageMap);
                NotificationLib.clearListNewNotificationJl(journalistID);
                session.setAttribute("TopicImageMap", TopicImageMap);
                session.setAttribute("listNotification", listNotification);
            }

            chain.doFilter(request, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("JournalistLoginFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("JournalistLoginFilter()");
        }
        StringBuffer sb = new StringBuffer("JournalistLoginFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
