<%-- 
    Document   : articleByCensor
    Created on : Jun 9, 2019, 10:46:06 PM
    Author     : quan1
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="application/pdf" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.io.*" %>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ page import="nw.jdbc.DBconnect" %>
<%
    Connection conn = DBconnect.getConnection();
    //load report file
    String jrxmlFile = session.getServletContext().getRealPath("/ArticleByCensor.jrxml");
    InputStream input = new FileInputStream(new File(jrxmlFile));
    //generate report
    JasperReport jasperReport = JasperCompileManager.compileReport(input);
    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null,conn);
    //export report as pdf
    JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
    response.getOutputStream().flush();
    response.getOutputStream().close();
%>
