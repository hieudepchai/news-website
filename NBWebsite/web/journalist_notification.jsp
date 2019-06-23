<%-- 
    Document   : journalist_notification
    Created on : May 31, 2019, 8:47:31 PM
    Author     : quan1
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Your Notification</title>

    <%@ include file="/css.jsp" %> 
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body id="page-top">
    <jsp:include page="/journalist_header.jsp" flush="true"/>
    <div id="wrapper">
        <!--Menu-->
        <jsp:include page="/journalist_navMenu.jsp" flush="true"/>

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

                <div class="container-fluid px-5">                    
                    
                    <div class="row">   
                        <div class="col-xl-12">
                            <div class="card-notify px-4 mb-4">
                                <!-- Page Heading-->
                                <div class="card-notify-header align-items-center justify-content-center">
                                    <h4 class="h4 mb-0 mr-auto text-gray-800 font-weight-bold">Your Notifications</h4>
                                </div>
                                <!--Content-->
                                <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
                                <c:forEach var="notify" items="${sessionScope.listNotification}">
                                    <c:choose>
                                        <c:when test="${notify.getKey() == 10 && notify.getValue().getCategory2() != 0}">
                                            <div class="">
                                                <a class="card-one-notify d-flex" href="${pageContext.request.contextPath}/articles/${cate.get(notify.getValue().getCategory1())}/${cate.get(notify.getValue().getCategory2())}/${notify.getValue().getArticleID()}">
                                                    <div class="d-flex">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>                                                        
                                                        <div class="text-gray-900">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <span class="medium">published your article </span>
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getHeading()}</span>
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-user-edit"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-500 small">${notify.getValue().getTime()}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 10 && notify.getValue().getCategory2() == 0}">
                                            <div class="">
                                                <a class="card-one-notify d-flex" href="${pageContext.request.contextPath}/articles/${cate.get(notify.getValue().getCategory1())}/${notify.getValue().getArticleID()}">
                                                    <div class="d-flex">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>                                                        
                                                        <div class="text-gray-900">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <span class="medium">published your article </span>
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getHeading()}</span>
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-user-edit"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-500 small">${notify.getValue().getTime()}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 7}">
                                            <div class="">
                                                <a class="card-one-notify d-flex" role="button">
                                                    <div class="d-flex">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>                                                        
                                                        <div class="text-gray-900">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <span class="medium">moved your article </span>
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getHeading()}</span>
                                                            <span class="medium"> to trash. </span>
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-user-edit"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-500 small">${notify.getValue().getTime()}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 11}">
                                            <div class="">
                                                <a class="card-one-notify d-flex" role="button">
                                                    <div class="d-flex">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>                                                        
                                                        <div class="text-gray-900">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <span class="medium"> send a feedback about your article </span>
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getHeading()}</span>
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-comment-dots"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-500 small">${notify.getValue().getTime()}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 12 && notify.getValue().getCategory2() != 0}">
                                            <div class="">
                                                <a class="card-one-notify d-flex" href="${pageContext.request.contextPath}/articles/${cate.get(notify.getValue().getCategory1())}/${cate.get(notify.getValue().getCategory2())}/${notify.getValue().getArticleID()}">
                                                    <div class="d-flex">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>                                                        
                                                        <div class="text-gray-900">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <c:choose>
                                                                <c:when test="${notify.getValue().getLevel() == 1}">
                                                                    <span class="medium"> commented on an your article </span>
                                                                </c:when>
                                                                <c:when test="${notify.getValue().getLevel() == 2}">
                                                                    <span class="medium"> replied on an your comment at the article </span>
                                                                </c:when>
                                                            </c:choose>
                                                            
                                                            <span class="my-0 medium font-weight-bold"><c:out value="${notify.getValue().getHeading()}"/></span>
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-book-reader"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-500 small">${notify.getValue().getTime()}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 12 && notify.getValue().getCategory2() == 0}">
                                            <div class="">
                                                <a class="card-one-notify d-flex" href="${pageContext.request.contextPath}/articles/${cate.get(notify.getValue().getCategory1())}/${notify.getValue().getArticleID()}">
                                                    <div class="d-flex">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="rounded-circle img-profile mt-1 mr-2" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>                                                        
                                                        <div class="text-gray-900">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <c:choose>
                                                                <c:when test="${notify.getValue().getLevel() == 1}">
                                                                    <span class="medium"> commented on an your article </span>
                                                                </c:when>
                                                                <c:when test="${notify.getValue().getLevel() == 2}">
                                                                    <span class="medium"> replied on an your comment at the article </span>
                                                                </c:when>
                                                            </c:choose>
                                                            
                                                            <span class="my-0 medium font-weight-bold"><c:out value="${notify.getValue().getHeading()}"/></span>
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-book-reader"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-500 small">${notify.getValue().getTime()}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                                                               
                            </div>
                        </div>
                    </div>

                </div>

                <!--footer-->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>-------------------Footer-----------------</span>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>
    
                                    <div id="previewContainer" class="fullscreen-container">
                                        <a class="close-btn mr-3"><i class="fas fa-times"></i></a>
                                        <div id="preview" class="form-popup">
                                            <div id="sign-up-header" class="form-popup-header">
                                                <h3 class="text-gray-800">Preview</h3>

                                            </div>
                                            <div class="pre-content flex-column">
                                                <div class="form-popup-form">
                                                    <img name="topicImg" class="mx-2 my-2" height="400" width="100%" />
                                                    <h3 name="subjectAr" class="font-weight-bold text-gray-900">anh yeu am</h3>
                                                    <h6 name="timeAr" class="text-gray-400 mt-0" style="text-transform:uppercase;"></h6>
                                                    <div class="mt-4 text-gray-900" name="contentAr"></div>
                                                    <div class="d-flex mt-4">
                                                        <a name="cate1" class="px-3 py-1" href="javascript:void(0)" style="border: 1px solid;">World</a>
                                                        <a name="cate2" class="ml-1 px-3 py-1" href="javascript:void(0)" style="border: 1px solid;">Asia</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>            

    
    <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>
    <script>
        $(".card-anAction").hover(function(){
            $(this).children(".col-4").children().next().css('display', 'block');
        }, function(){
            $(this).children(".col-4").children().next().css('display', 'none');
        });
        
        <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
        $("a[name = heading]").click(function(){
            var articleID = $(this).next().val();
            var topicImage = $(this).parent().prev().attr('src');
        $.ajax({
            type: "post",
            encType : "multipart/form-data",
            url : "Activities",
            cache : false,
            processData : false,
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            data: jQuery.param({
                ArticleID: articleID
            }),
                        
            success: function(responseJson){                
                var article = responseJson['key'];
                var category = responseJson['value'];
                var LastModified = new Date(Date.parse(article['LastModified']));
                $("h3[name = subjectAr]").text(article['Heading']);
                $("h6[name = timeAr]").text(LastModified.toDateString());
                $("img[name = topicImg]").attr("src", topicImage);
                var content = article['ShortDescription'] + article['Content'];
                $("div[name = contentAr]").text("");
                $("div[name = contentAr]").children().remove();
                $("div[name = contentAr]").append(content);
                var cate1 = category['key'];
                var cate2 = category['value'];
                if(category['value'] === '0'){
                    $("a[name = cate1]").text(cate1);
                    $("a[name = cate2]").hide();
                }   
                else{
                    $("a[name = cate1]").text(cate1);
                    $("a[name = cate2]").text(cate2);
                }
                $("#previewContainer").css({ "display": "block", "opacity": "1" });
            },
            error : function(msg) {
                alert("Couldn't delete file, error: " + msg);
            }
        });
        
        });
    </script>

</body>
</html>

