<%-- 
    Document   : journalist_listOfArticles
    Created on : May 17, 2019, 1:31:13 PM
    Author     : quan1
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="/WEB-INF/tlds/functions" prefix="my" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>List of article</title>
     <%@ include file="/css.jsp" %> 
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/editor.css" />
    
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="/journalist_header.jsp" flush="true"/>
    <div id="wrapper">
        <!--Menu-->
        <jsp:include page="/journalist_navMenu.jsp" flush="true"/>

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

                <!--content-->
                <div class="card-tools bg-white">
                    <div id="select" title="Select" class="btn-group py-1 px-1 br-3">
                        <input title="Select" class="radio py-1 px-1 br-3" type="checkbox" name="select" />
                        <a title="Select" class="dropdown-toggle py-1 px-1 br-3" href="javascript:void(0)" data-toggle="dropdown" aria-expanded="false">
                            <span class="caret mb-2"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a name="all" tabindex="-1" href="javascript:void(0)">All</a>
                            </li>
                            <li>
                                <a name="none" tabindex="-1" href="javascript:void(0)">None</a>
                            </li>

                        </ul>
                    </div>
                    <div id="refresh" title="Refresh" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Refresh">
                            <i class="fas fa-redo-alt"></i>
                        </a>
                    </div>
                    <div id="delete" title="Delete" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Delete">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </div>
                    <div class="btn-group ml-3">
                        <p name="cItem" class="text-gray-900 my-0"></p>
                    </div>
                </div>
                <form id="form1" method="post" action="${pageContext.request.contextPath}/manage/journalist/List-of-Articles" autocomplete="off">
                <div id="aline" class="card-tools-body bg-white" name="article">
                    <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
                    <c:set  var="nCmt" value="${nCmtMap}"></c:set>
                    <c:forEach items="${sessionScope.listArticle}" var="item">
                        <c:if test="${item.getTrash() != 1}">
                        <div class="aline">
                            <div class="col-1">
                                <input class="radio" type="checkbox" name="categories" />
                                <input type="hidden" name="ArticleID" value="${item.getArticleID()}" />
                            </div>
                            <div class="col-5">
                                <c:choose>
                                    <c:when test = "${item.getCensored() == 1}">
                                        <c:choose>
                                            <c:when test = "${item.getSubCategoryID() != 0}">
                                                <a name="heading" class="text-gray-900 " href="${pageContext.request.contextPath}/articles/${cate.get(item.getCategoryID())}/${cate.get(item.getSubCategoryID())}/${item.getArticleID()}">
                                                    ${item.getHeading()}
                                                </a>
                                            </c:when>
                                            <c:when test = "${item.getSubCategoryID() == 0}">
                                                <a name="heading" class="text-gray-900 " href="${pageContext.request.contextPath}/articles/${cate.get(item.getCategoryID())}/${item.getArticleID()}">
                                                    ${item.getHeading()}
                                                </a>
                                            </c:when>
                                        </c:choose>
                                        
                                    </c:when>
                                    <c:otherwise>
                                        <a name="heading" class="text-gray-900 " href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles/edit-article&amp;id=${item.getArticleID()}?h=${my:urlEncode(item.getHeading(), 'UTF-8')}">
                                            ${item.getHeading()}
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                
                            </div>
                            <div class="col-2">
                                    <c:choose >
                                        <c:when test = "${item.getSubCategoryID() != 0}">
                                            <a class="ml-1 text-gray-900" name="subject">${cate.get(item.getCategoryID())}, ${cate.get(item.getSubCategoryID())}</a>                                            
                                        </c:when>
                                        <c:otherwise>
                                            <a class="ml-1 text-gray-900" name="subject">${cate.get(item.getCategoryID())}</a>                                            
                                        </c:otherwise>
                                    </c:choose>
                                
                            </div>
                            <div class="col-1">
                                <c:choose>
                                    <c:when test = "${item.getCensored() == 1}">
                                        <a class="ml-1 text-gray-900" name="status">Published</a>
                                    </c:when>
                                    <c:when test = "${item.getDraft() == 1}">
                                        <a class="ml-1 text-gray-900" name="status">Draft</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="ml-1 text-gray-900" name="status">Uncensored</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="col-1">
                                <a class="ml-1" href="${pageContext.request.contextPath}/manage/journalist/comments">
                                    <i class="iconCommentArticle fas fa-comment"></i>
                                    <span class="NumberCommentArticle">${nCmt.get(item.getArticleID())}</span>
                                </a>
                            </div>
                            <div class="col-2">
                                
                                <c:choose>
                                    <c:when test = "${item.getCensored() == 1}">
                                        <p class="ml-1 mt-0 mb-0">Published: <br> <c:out value = "${item.getLastModified()}"/></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="ml-1 mt-0 mb-0">Last modified: <br> <c:out value = "${item.getLastModified()}"/></p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>   
                        </c:if>
                        
                    </c:forEach>  
                    <input type='hidden' name='ArticleIDChosen' />
                    <!--footer-->
                    <footer class="sticky-footer bg-white mt-auto">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>-------------------Footer-----------------</span>
                            </div>
                        </div>
                    </footer>
                </div>
                </form>
                
                
            </div>
        </div>
    </div>


    <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>
    <script src="${pageContext.request.contextPath}/js/editor.js"></script>
    <script>

    $(document).ready(function(){
        $("#accordionSidebar li[name = dropdown]").addClass("active"); 
        $("#listofarticle").addClass("active"); 
        var nArticle = $(".aline:visible");
            if (nArticle.length < 8){
                $("footer").addClass("bottom-fixed");
            } else{
                $("footer").removeClass("bottom-fixed");
            }
    });
        //delete an article
    $("#delete").click(function () {
        var listArticleID = new Array();
        $.each($(".aline > div > input:checked").next(), function(){
            listArticleID.push($(this).val());
        });

        $.ajax({
            type: "post",
            encType : "multipart/form-data",
            url : "${pageContext.request.contextPath}/manage/journalist/List-of-Articles",
            cache : false,
            processData : false,
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            data: jQuery.param({
                json: listArticleID
            }),
                        
            success: function(){
                $(".aline > div > input:checked").parentsUntil("#aline").remove();
                var nItems = $(".aline:visible").length;
                $('p[name = cItem]').text(nItems + " Items");    
            },
            error : function(msg) {
                alert("Couldn't delete file, error: " + msg);
            }
        });
       
    });
    </script>
</body>
</html>
