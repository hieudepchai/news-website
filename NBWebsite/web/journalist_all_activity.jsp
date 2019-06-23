<%-- 
    Document   : journalist_all_activity
    Created on : May 30, 2019, 10:43:51 AM
    Author     : quan1
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Activity Log</title>

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
                    <!-- Page Heading-->
                    <div class="d-flex align-items-center justify-content-center mb-4">
                        <h4 class="h4 ml-3 mb-0 mr-auto text-gray-800 font-weight-bold">Activity Log</h4>
                    </div>
                    <!--Content-->
                    <div class="row">   
                        <c:set var="activity" value="${activityMapMonth}"/>
                        <c:set var="topicImage" value="${sessionScope.TopicImageMap}"/>
                        <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
                        
                        <div class="col-xl-12">
                            <c:forEach var="month" items="${listTimeMonth}">
                            <div class="card mb-4">
                                <!--Card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 text-gray-900 font-weight-bold text-uppercase text-center">${month.getKey()}</h6>
                                </div>
                                <!--Card body-->
                                <div class="card-body-activity">
                                    <c:forEach var="date" items="${month.getValue()}">
                                    <div class="row card-date">
                                        <span class="text-gray-900 text-uppercase font-weight-bold ml-3">${date}</span>
                                    </div>
                                        <c:forEach var="action" items="${activity.get(month.getKey()).get(date)}">
                                            <c:choose>
                                                <c:when test="${action.getKey() == 1}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4 ">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1">composed the article</span>                                                           
                                                                </div>
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a name="heading" class="text-gray-800 font-weight-bold" href="javascript:void(0)">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <input type="hidden" value="${action.getValue().getJournalistID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 2}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1">edited the article</span>                                                           
                                                                </div>
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a name="heading" class="text-gray-800 font-weight-bold" href="javascript:void(0)">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <input type="hidden" value="${action.getValue().getJournalistID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 3}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1">wrote the draft article</span>                                                           
                                                                </div>
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a name="heading" class="text-gray-800 font-weight-bold" href="javascript:void(0)">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <input type="hidden" value="${action.getValue().getJournalistID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 4}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1">edited the draft article</span>                                                           
                                                                </div>
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a name="heading" class="text-gray-800 font-weight-bold" href="javascript:void(0)">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <input type="hidden" value="${action.getValue().getJournalistID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 5}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1">transfered this article to draft article</span>                                                           
                                                                </div>
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a name="heading" class="text-gray-800 font-weight-bold" href="javascript:void(0)">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <input type="hidden" value="${action.getValue().getJournalistID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 6}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1">transfered draft article to uncensored article.</span>                                                           
                                                                </div>
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a name="heading" class="text-gray-800 font-weight-bold" href="javascript:void(0)">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <input type="hidden" value="${action.getValue().getJournalistID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 7}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4">
                                                            <div class="d-flex">
                                                                <i class="far fa-newspaper mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1"> moved the article to trash</span>                                                           
                                                                </div>
                                                            </div>   
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a name="heading" class="text-gray-800 font-weight-bold" href="javascript:void(0)">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <input type="hidden" value="${action.getValue().getJournalistID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 8}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4 ">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1">added new picture to his libary</span>                                                           
                                                                </div>
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${action.getValue().getSource()}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 9}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4 ">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1">reverted the trash article</span>                                                           
                                                                </div>
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a name="heading" class="text-gray-800 font-weight-bold" href="javascript:void(0)">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <input type="hidden" value="${action.getValue().getJournalistID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 12 && action.getValue().getCategory2() != 0}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4 ">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <c:choose>
                                                                    <c:when test="${action.getValue().getLevel() == 1}">
                                                                        <div>
                                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                            <span class="text-gray-800 ml-1">commented on ${action.getValue().getFirstName()} ${action.getValue().getLastName()}'s </span> 
                                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${cate.get(action.getValue().getCategory2())}/${action.getValue().getArticleID()}">article.</a>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${action.getValue().getLevel() == 2}">
                                                                        <div>
                                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                            <span class="text-gray-800 ml-1">replied on ${action.getValue().getFullNameReceiver()}'s </span> 
                                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${cate.get(action.getValue().getCategory2())}/${action.getValue().getArticleID()}">comment.</a>
                                                                        </div>
                                                                    </c:when>
                                                                </c:choose>
                                                                
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a class="text-gray-800 font-weight-bold" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${cate.get(action.getValue().getCategory2())}/${action.getValue().getArticleID()}">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                                <c:when test="${action.getKey() == 12 && action.getValue().getCategory2() == 0}">
                                                    <div class="row card-anAction">
                                                        <div class="col-4 ">
                                                            <div class="d-flex">
                                                                <i class="fas fa-user mt-1 mr-1" style="color:#a2b0cd;"></i>
                                                                <c:choose>
                                                                    <c:when test="${action.getValue().getLevel() == 1}">
                                                                        <div>
                                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                            <span class="text-gray-800 ml-1">commented on ${action.getValue().getFirstName()} ${action.getValue().getLastName()}'s </span> 
                                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${action.getValue().getArticleID()}">article.</a>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${action.getValue().getLevel() == 2}">
                                                                        <div>
                                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                            <span class="text-gray-800 ml-1">replied on ${action.getValue().getFullNameReceiver()}'s </span> 
                                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${action.getValue().getArticleID()}">comment.</a>
                                                                        </div>
                                                                    </c:when>
                                                                </c:choose>
                                                                
                                                            </div>
                                                            <span class="ml-3 small" style="display: none;">${action.getValue().getTime()}</span>
                                                        </div>
                                                        <div class="col-8 d-flex">
                                                            <img class="" src="${pageContext.request.contextPath}/${topicImage.get(action.getValue().getArticleID())}" title="${action.getValue().getFileName()}" height="180" width="200" />      
                                                            <div class="ml-3">
                                                                <a class="text-gray-800 font-weight-bold" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${action.getValue().getArticleID()}">${action.getValue().getHeading()}</a>
                                                                <input type="hidden" value="${action.getValue().getArticleID()}"/>
                                                                <p class="text-gray-700 mb-1 my-0">${action.getValue().getShortDescription()}</p>
                                                            </div>
                                                        </div>
                                                    </div>   
                                                </c:when>
                                            </c:choose>
                                            
                                        </c:forEach>
                                    
                                    </c:forEach>
                                                                                                            
                                </div>
                            </div>    
                            </c:forEach>
                            
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
   
                                    //preview article
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
            var JournalistID = $(this).next().next().val();
            var topicImage = $(this).parent().prev().attr('src');
        $.ajax({
            type: "post",
            encType : "multipart/form-data",
            url : "Activities",
            cache : false,
            processData : false,
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            data: jQuery.param({
                ArticleID: articleID,
                JournalistID: JournalistID
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
                alert("Couldn't open this article, error: " + msg);
            }
        });
        
        });
    </script>

</body>
</html>
