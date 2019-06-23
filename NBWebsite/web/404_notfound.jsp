<%-- 
    Document   : 404_notfound
    Created on : Jun 5, 2019, 9:06:58 AM
    Author     : quan1
--%>

<%@ include file="/init.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="/css.jsp" %> 
    </head>
    <body id="page-top">
        <div id="wrapper">
            <div class="d-flex error-page-notfound">
                <image src="${pageContext.request.contextPath}/img/semrush-404-page-not-found-face.png"/>
                <div class="ml-5">
                    <div class="error mx-3" data-text="404">404</div>
                    <h3 class="h3 my-3 text-gray-800 font-weight-bold">Page Not Found</h3>
                    <span>We can't find the page you're looking for.</span>
                    <p class="my-0">You can either return to the previous page, visit our homepage or contact our support team.</p>
                    <a class="btn btn-sm btn-primary shadow-sm mt-3 ml-2" href="${pageContext.request.contextPath}/manage/journalist">Visit Homepage</a>
                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>
        </body>
</html>
