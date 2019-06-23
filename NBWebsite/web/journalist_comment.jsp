<%-- 
    Document   : journalist_comment
    Created on : Jun 2, 2019, 8:37:12 PM
    Author     : quan1
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Comments</title>

    <%@ include file="/css.jsp" %> 
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body id="page-top">
    <jsp:include page="/journalist_header.jsp" flush="true"/>

    <div id="wrapper">
        <jsp:include page="/journalist_navMenu.jsp" flush="true"/>
        <div id="content-wrapper" class="d-flex flex-row">
            <div id="content">
                <div class="card-tools d-flex">
                    <form action="/action_page.php" class="ml-auto">
                        <input class="w-250" type="search" name="inboxsearch" placeholder="Search inbox">
                        <input class="text-lg btn-input" type="submit" value="search">
                    </form>

                </div>
                <div class="card-tools bg-white d-flex">
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
                            <li>
                                <a name="starred" tabindex="-1" href="javascript:void(0)">Starred</a>
                            </li>
                            <li>
                                <a name="unstarred" tabindex="-1" href="javascript:void(0)">Unstarred</a>
                            </li>
                        </ul>
                    </div>
                    <div id="unread" title="Mark as unread" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Mark as unread">
                            <i class="fas fa-envelope-open"></i>
                        </a>
                    </div>
                    <div id="delete" title="Delete" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Delete">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </div>
                    <div class="toolbar-divider"></div>
                    <div id="refresh" title="Refresh" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Refresh">
                            <i class="fas fa-redo-alt"></i>
                        </a>
                    </div>
                    <div class="ml-auto">
                        <div class="btn-group ml-3 mt-1">
                            <p name="nItems" class="text-gray-600 my-0"></p>
                        </div>
                        <div id="pre" title="Older" class="btn-group py-1 px-2 br-50">
                            <a class="text-gray-600" title="Older">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </div>
                        <div id="next" title="Newer" class="btn-group py-1 px-2 br-50">
                            <a class="text-gray-600" title="Newer">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div id="aline" name="comment" class="card-tools-body-inbox">
                     <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
                    <c:forEach var="cmt" items="${listCmt}">
                        <c:if test="${cmt.getLevel() == 1}">
                            <div class="aline">
                                <a name="link" class="d-flex align-items-center text-gray-900" href="javascript:void(0)" style="width: 100%;">
                                    <c:choose>
                                        <c:when test="${cmt.getSubCategoryID() == 0}">
                                            <input type="hidden" value="${pageContext.request.contextPath}/articles/${cate.get(cmt.getCategoryID())}/${cmt.getArticleID()}">
                                        </c:when>
                                        <c:when test="${cmt.getSubCategoryID() != 0}">
                                            <input type="hidden" value="${pageContext.request.contextPath}/articles/${cate.get(cmt.getCategoryID())}/${cate.get(cmt.getSubCategoryID())}/${cmt.getArticleID()}">
                                        </c:when>
                                    </c:choose>
                                    
                                <div class="col-1 d-flex">
                                    <input class="radio" type="checkbox" name="categories" />
                                    
                                </div>
                                <div class="col-2 d-flex">
                                    <div class="img-profile">
                                        <c:choose>
                                            <c:when test="${cmt.getProfilePicture() != null}">
                                                <img class="rounded-circle" src="${pageContext.request.contextPath}/${cmt.getProfilePicture()}">
                                                <div class="status-indicator bg-success"></div>
                                            </c:when>
                                            <c:when test="${cmt.getProfilePicture() == null}">
                                                <img class="rounded-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                <div class="status-indicator bg-success"></div>
                                            </c:when>
                                        </c:choose>    
                                    </div>
                                    <span class="ml-2 mt-2">${cmt.getFirstName()} ${cmt.getLastName()}</span>
                                </div>
                                <div class="col-3">
                                    <span class="ml-1" name="">${cmt.getContent()}</span>
                                </div>
                                <div class="col-4">
                                    <span class="ml-1" name="heading" style="cursor: pointer;">${cmt.getHeading()}</span>
                                </div>

                                <div class="col-2">
                                    <p class="ml-1 mt-0 mb-0">${cmt.getDateCreated()}</p>
                                </div>
                            </a>
                                
                            </div>
                        </c:if>
                    </c:forEach>

                    <!--footer-->
                    <footer class="sticky-footer bg-white mt-5">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>-------------------Footer-----------------</span>
                            </div>
                        </div>
                    </footer>
                </div>
                
            </div>          
        </div>
    </div>

    
    <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>
    <script>
        $(document).ready(function(){
           $("#accordionSidebar li[name = comments]").addClass("active"); 
           
           var nArticle = $(".aline:visible");
            if (nArticle.length < 8){
                $("footer").addClass("bottom-fixed");
            } else{
                $("footer").removeClass("bottom-fixed");
            }
        });
        
        $("a[name = link]").click(function(){
            $(this).attr('href', $(this).children().eq(0).val());
        });
    </script>
   
</body>
</html>
