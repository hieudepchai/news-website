<%-- 
    Document   : journalist_dashboard
    Created on : May 17, 2019, 1:30:46 PM
    Author     : quan1
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Dashboard</title>

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

                <div class="container-fluid">
                    <!-- Page Heading-->
                    <div class="d-flex align-items-center justify-content-center mb-4">
                        <h3 class="h3 mb-0 mr-auto text-gray-800">Dashboard</h3>
                    </div>
                    <!--Content-->
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 mb-3">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">

                                        <div class="col ml-4">
                                            <i class="fas fa-pen-alt fa-4x text-gray-700"></i>
                                        </div>
                                        <div class="col-auto mr-4">
                                            <div class="text-lg font-weight-bold text-primary text-uppercase mb-2"><a href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">Articles</a></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 float-right">${nArticle}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 mb-3">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">

                                        <div class="col ml-4">
                                            <i class="far fa-file fa-4x text-gray-700"></i>
                                        </div>
                                        <div class="col-auto mr-4">
                                            <div class="text-lg font-weight-bold text-primary text-uppercase mb-2"><a href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">Drafts</a></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 float-right">${nDraft}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 mb-3">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">

                                        <div class="col ml-4">
                                            <i class="fas fa-comments fa-4x text-gray-700"></i>
                                        </div>
                                        <div class="col-auto mr-4">
                                            <div class="text-lg font-weight-bold text-primary text-uppercase mb-2"><a href="${pageContext.request.contextPath}/manage/journalist/comments">Comments</a></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 float-right">${nComments}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 mb-3">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">

                                        <div class="col ml-4">
                                            <i class="fas fa-trash fa-4x text-gray-700"></i>
                                        </div>
                                        <div class="col-auto mr-4">
                                            <div class="text-lg font-weight-bold text-primary text-uppercase mb-2"><a href="${pageContext.request.contextPath}/manage/journalist/Trash">Trash</a></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 float-right">${nTrash}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">                       
                        <div class="col-xl-10">
                            <div class="card mb-4 shadow">
                                <!--Card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Activities</h6>
                                </div>
                                <!--Card body-->
                                <div class="card-body">
                                    <div class="d-flex mb-1">
                                        <h5 class="h5 mb-0 mt-0 text-gray-800 float-left">Recent</h5>
                                    </div>
                                    <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
                                    <c:forEach var="action" items="${listActivity}">
                                        <c:choose>
                                            <c:when test="${action.getKey() == 1}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-user mt-2 mr-2" style="color:#a2b0cd;"></i>
                                                        <div>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                            <span class="text-gray-800 ml-1">composed the article</span>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">${action.getValue().getHeading()}</a>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 2}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-user mt-2 mr-2" style="color:#a2b0cd;"></i>
                                                        <div>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                            <span class="text-gray-800 ml-1">edited the article</span>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">${action.getValue().getHeading()}</a>
                                                        </div>                                
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 3}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-user mt-2 mr-2" style="color:#a2b0cd;"></i>
                                                        <div>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                            <span class="text-gray-800 ml-1"> wrote the draft article </span>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">${action.getValue().getHeading()}</a>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 4}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-user mt-2 mr-2" style="color:#a2b0cd;"></i>
                                                        <div>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                            <span class="text-gray-800 ml-1"> edited the draft article </span>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">${action.getValue().getHeading()}</a>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 5}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-user mt-2 mr-2" style="color:#a2b0cd;"></i>
                                                        <div>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                            <span class="text-gray-800 ml-1"> transfered the article </span>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">${action.getValue().getHeading()}</a>
                                                            <span class="text-gray-800 ml-1"> to draft article </span>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 6}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-user mt-2 mr-2" style="color:#a2b0cd;"></i>
                                                        <div>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                            <span class="text-gray-800 ml-1"> transfered the draft article </span>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">${action.getValue().getHeading()}</a>
                                                            <span class="text-gray-800 ml-1"> to unapproved article </span>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 9}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-user mt-2 mr-2" style="color:#a2b0cd;"></i>
                                                        <div>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                            <span class="text-gray-800 ml-1"> reverted the trash article </span>
                                                            <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">${action.getValue().getHeading()}</a>
                                                            <span class="text-gray-800 ml-1"> to unapproved article </span>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 8}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10">
                                                        <i class="fas fa-user" style="color:#a2b0cd;"></i>
                                                        <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                        <span class="text-gray-800 ml-1"> added a picture </span>
                                                        <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/libary">${action.getValue().getFileName()}</a>
                                                        <span class="text-gray-800 ml-1"> to his libary </span>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 7}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex"> 
                                                        <i class="far fa-newspaper mt-2 mr-1" style="color:#a2b0cd;"></i>
                                                        <div>
                                                            <span class="text-gray-800 ml-1">The article </span>
                                                            <a class="mb-0 mt-0 ml-1" href="#">${action.getValue().getHeading()}</a>
                                                            <span class="text-gray-800 ml-1"> was moved to the trash </span>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 12 && action.getValue().getCategory2() != 0}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-comment-alt-dots" style="color:#a2b0cd;"></i>
                                                        <c:choose>
                                                            <c:when test="${action.getValue().getLevel() == 1}">
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1"> commented on the article </span>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${cate.get(action.getValue().getCategory2())}/${action.getValue().getArticleID()}">${action.getValue().getHeading()}</a>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${action.getValue().getLevel() == 2}">
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1"> replied on ${action.getValue().getFullNameReceiver()}'s comment at the article </span>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${cate.get(action.getValue().getCategory2())}/${action.getValue().getArticleID()}">${action.getValue().getHeading()}</a>
                                                                </div>
                                                            </c:when>
                                                        </c:choose>
                                                        
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${action.getKey() == 12 && action.getValue().getCategory2() == 0}">
                                                <div class="row no-gutters align-items-center mb-3">
                                                    <div class="col-2 ml-0">
                                                        <p class="text-gray-500 mb-0 mt-0">${action.getValue().getTime()}</p>
                                                    </div>
                                                    <div class="col-10 d-flex">
                                                        <i class="fas fa-comment-alt-dots" style="color:#a2b0cd;"></i>
                                                        <c:choose>
                                                            <c:when test="${action.getValue().getLevel() == 1}">
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1"> commented on the article </span>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${action.getValue().getArticleID()}">${action.getValue().getHeading()}</a>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${action.getValue().getLevel() == 2}">
                                                                <div>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</a>
                                                                    <span class="text-gray-800 ml-1"> replied on ${action.getValue().getFullNameReceiver()}'s comment at the article </span>
                                                                    <a class="mb-0 mt-0 ml-1" href="${pageContext.request.contextPath}/articles/${cate.get(action.getValue().getCategory1())}/${action.getValue().getArticleID()}">${action.getValue().getHeading()}</a>
                                                                </div>
                                                            </c:when>
                                                        </c:choose>
                                                        
                                                        
                                                    </div>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    
                                </div>
                                <a class="dropdown-item text-center small mt-3" href="${pageContext.request.contextPath}/manage/journalist/Activities" style="color: #4e73df">Show All Activities</a>
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

    
    <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>
    <script>
        $(document).ready(function(){
           $("#accordionSidebar li[name = dashboard]").addClass("active"); 
        });
    </script>
</body>
</html>