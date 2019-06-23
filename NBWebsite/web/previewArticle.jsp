<%-- 
    Document   : previewArticle
    Created on : Jun 6, 2019, 10:07:56 PM
    Author     : DUNG
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">


        <!-- Bootstrap Core CSS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="${pageContext.request.contextPath}/css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" >
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dung-style.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.content.css" />

    </head>
    <body>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class= "row">
                    <form id="message_form" action="${pageContext.request.contextPath}/manage/admin/preview/submit" method="POST" >                                        
                        <div id="previewContainer" class="fullscreen-container" style="display: block">
                            <a class="back-btn" href="${pageContext.request.contextPath}/manage/admin/List-article-waiting"><i><span class="pull-left"> < Back</span></i></a>
                            <div id="preview" class="form-popup">
                                <div id="sign-up-header" class="form-popup-header">
                                    <h2 class="text-black-800">Preview</h2>
                                </div>
                                <c:set var="bimap" value="${sessionScope.CategoryMap}"></c:set>
                                <c:set var="article" value="${sessionScope.ArticlePreview}"></c:set>
                                <input type="hidden" name="ReceiverIDJournalist" value="${article.getJournalistID()}" />
                                <input type="hidden" name="SenderID" value="${sessionScope.CurrentAccount.getAccountID()}" />

                                <c:set var="img" value="${sessionScope.ImageSoucre}"></c:set>
                                <input type="hidden" name="ArticleIDPreview" value="${article.getArticleID()}"/>
                                <div class="pre-content flex-column">
                                    <div class="form-popup-form">
                                        <img name="topicImg" class="mx-2 my-2" height="400" width="100%" src="${pageContext.request.contextPath}/${img}"/>
                                        <h3 name="subjectAr" class="font-weight-bold text-gray-900">${article.getHeading()}</h3>
                                        <h6 name="timeAr" class="text-gray-400 mt-0" style="text-transform:uppercase;">anh yeu em</h6>

                                        <div class="mt-4 text-gray-900" name="contentAr">${article.getShortDescription()} ${article.getContent()}</div>
                                        <div class="d-flex mt-4">
                                            <a name="cate1" class="btn btn-primary" href="#" >${bimap.getForward(article.getCategoryID())}</a>
                                            <c:choose>
                                                <c:when test="${article.getSubCategoryID()!=0}">
                                                    <a name="cate2" class="btn btn-info" href="#" >${bimap.getForward(article.getSubCategoryID())}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a name="cate2" class="btn btn-info" href="#" hidden></a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3  panel panel-primary">
                                        <div class="panel-heading">Note</div>
                                        <div class="panel-body">
                                            <ul class="chat">
                                                <c:set  var="admin" value="${sessionScope.AdminEditor1}"></c:set>
                                                <c:forEach items="${sessionScope.listMessage1}" var="mess">
                                                    <input type="hidden" name="MessageID" value="${mess.getMessageID()}" />
                                                    <input type="hidden" name="ReceiverID" value="${mess.getSenderID()}" />
                                                    <c:choose>
                                                        <c:when test="${admin.get(mess.getSenderID()) != null}">
                                                            <li class="left clearfix">
                                                                <span class="chat-img pull-left">
                                                                    <c:choose>
                                                                        <c:when test="${admin.get(mess.getSenderID()).getProfilePicture() == null}">
                                                                            <img class="img-profile rounded-circle " src="${pageContext.request.contextPath}/img/profilepic/pric1.png" alt="User Avatar">
                                                                        </c:when>
                                                                        <c:when test="${admin.get(mess.getSenderID()).getProfilePicture() != null}">
                                                                            <img class="img-profile rounded-circle " src="${pageContext.request.contextPath}/${admin.get(mess.getSenderID()).getProfilePicture()}" alt="User Avatar">
                                                                        </c:when>
                                                                    </c:choose>                                                    
                                                                </span>
                                                                <div class="chat-body clearfix">
                                                                    <div class="header">
                                                                        <strong class="primary-font">${admin.get(mess.getSenderID()).getLastName()} ${admin.get(mess.getSenderID()).getFirstName()}</strong> 
                                                                    </div>
                                                                    <p title="${mess.getDateCreated()}">
                                                                        ${mess.getContent()}                                                        
                                                                    </p>
                                                                </div>
                                                            </li>
                                                        </c:when>
                                                        <c:when test="${admin.get(mess.getSenderID()) == null}">
                                                            <li class="right clearfix"><span class="chat-img pull-right">
                                                                    <c:choose>
                                                                        <c:when test="${sessionScope.CurrentAccount.getProfilePicture() == null}">
                                                                            <img class="img-profile rounded-circle " src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                                        </c:when>
                                                                        <c:when test="${sessionScope.CurrentAccount.getProfilePicture() != null}">
                                                                            <img class="img-profile rounded-circle " src="${pageContext.request.contextPath}/${sessionScope.CurrentAccount.getProfilePicture()}" alt="User Avatar">
                                                                        </c:when>
                                                                    </c:choose>                                                    
                                                                </span>
                                                                <div class="chat-body clearfix">
                                                                    <div class="header">

                                                                        <strong class="pull-right primary-font">${sessionScope.CurrentAccount.getLastName()} ${sessionScope.CurrentAccount.getFirstName()} </strong>
                                                                    </div>
                                                                    <p title="${mess.getDateCreated()}">
                                                                        ${mess.getContent()}                                                        
                                                                    </p>
                                                                    </p>
                                                                </div>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="panel-footer">
                                            <div class="input-group">
                                                <input id="inputMessage" name ="inputMessage"  type="text" class="form-control msg-input" placeholder="Type your message here..." />
                                                <span class="input-group-btn">
                                                    <button class="btn btn-warning send-btn" id="btn-send">
                                                        Send</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>        
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="${pageContext.request.contextPath}/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/js/startmin.js"></script>
        <script>

            $(document).ready(function () {
                console.log("ready!");
                var dNow = new Date();
                $("h6[name = timeAr]").text(dNow.toDateString());
            });

            $("#btn-send").click(function () {
                if ($("#inputMessage").val().length === 0)
                {
                    alert("Please input something to send!");
                } else
                {
                    $("#message_form").submit();
                }
            });
            $(document).keyup(function (e) {
                if (e.keyCode === 13)
                    $('.send-btn').click(); // enter
            });
            
            $(document).keyup(function (e) {
                if (e.keyCode === 27)
                    $('.back-btn').click(); // esc
            });

        </script>
    </body>
</html>
