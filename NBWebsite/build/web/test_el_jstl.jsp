<%-- 
    Document   : test_el_jstl
    Created on : May 13, 2019, 11:07:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="">
            <input type = "text" name = "inputname">
            <input type ="submit" value ="submit">
        </form>
        <c:if test="${param.inputname!=null}">
            <h1>concac</h1>
            ${param.inputname}
        </c:if>
        <c:forEach var="i" begin="0" end="4">
            <div>${i}</div> 
        </c:forEach>
    </body>
</html>
