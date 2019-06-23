<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : admin_index
    Created on : May 9, 2019, 4:04:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Dashboard Admin</title>

        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="${pageContext.request.contextPath}/css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="${pageContext.request.contextPath}/css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/css/startmin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="${pageContext.request.contextPath}/css/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" >
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dung-style.css" >

    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top my-top-nav" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/manage/admin"><i class="fa fa-home fa-fw"></i>Homepage</a>
                </div>
                <button id="navbar-btn" type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <ul class="nav navbar-right navbar-top-links">
                    
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-3 d-none d-lg-inline text-gray-800 small"><c:out value="${sessionScope.CurrentAccount.getFirstName()}"></c:out> <c:out value="${sessionScope.CurrentAccount.getLastName()}"></c:out></span>
                            <c:set var="ProfilePicSrc" value="${sessionScope.CurrentAccount.getProfilePicture()}"/>
                            <c:choose>
                                <c:when test="${ProfilePicSrc!=null}">

                                    <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/${ProfilePicSrc}">

                                </c:when>
                                <c:when test="${ProfilePicSrc==null}">
                                    <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/img/user_pro_pic.png">
                                </c:when>
                            </c:choose>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="mydivider"></li>
                            <li> <form id="logout-form" action="${pageContext.request.contextPath}/manage/logout" method="POST"></form><a id="logout-a"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar my-sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav sidebar-ul" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search.${pageContext.request.contextPath}">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/manage/admin" class="active" ><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Account<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>

                                        <a href="${pageContext.request.contextPath}/manage/admin/account">Account manage</a>

                                    </li>
                                    <li>

                                        <a href="${pageContext.request.contextPath}/manage/admin/accounttype">Account type</a>

                                    </li>                                    
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-files-o fa-fw"></i> Article<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/manage/admin/List-article-waiting">Waiting for censor</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/manage/admin/List-of-articles" >List of all Articles</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/manage/admin/bookmark" ><i class="fa fa-bookmark "></i> Bookmark</a>                                
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/manage/admin/category" ><i class="fa fa-archive "></i> Category</a>                                
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/manage/admin/comment" ><i class="fa fa-comments "></i> Comment</a>                                
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Dashboard</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-comments fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"> <c:out value="${sessionScope.countComment}"/>  </div>
                                            <div>Comments!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="${pageContext.request.contextPath}/manage/admin/comment">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-user fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><c:out value="${sessionScope.countAccount}"/></div>
                                            <div>Account!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="${pageContext.request.contextPath}/manage/admin/account">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-yellow">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-newspaper-o fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><c:out value="${sessionScope.countArticle}"/></div>
                                            <div>Articles</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="${pageContext.request.contextPath}/manage/admin/List-of-articles">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                    <!-- /.row -->
                    <div class="row">

                            <!-- /.panel-heading -->

                            <!-- /.panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-clock-o fa-fw"></i> <strong>Recently</strong>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <!-- Posted history-->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="panel-heading">Recently posted</div>
                                        </div>
                                    </div>
                                    <!--End tittle-->
                                    <c:forEach items="${sessionScope.listArticle}" var="item" varStatus="stt">
                                        <c:if test="${stt.last}">        
                                            <div class="row">
                                                <br>
                                                <div class="col-md-4">
                                                    <p>
                                                        <small class="text-muted"> ${item.getDateCreated()}
                                                        </small>
                                                    </p>
                                                </div>
                                                <div class="col-md-8">
                                                    <a href="${pageContext.request.contextPath}/manage/admin/List-of-articles">${item.getHeading()}</a>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <!---->
                                    <!--Comment history-->                                    
                                    <hr>
                                    <c:forEach items="${sessionScope.listComment}" var="cmt" varStatus="stt">
                                        <c:if test="${stt.last}">        

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="panel-heading">Recently commented</div>
                                                </div>
                                            </div>
                                            <!--end title-->
                                            <div class="row">
                                                <br>
                                                <div class=" col-md-4">
                                                    <p>
                                                        <small class="text-muted"> ${cmt.getDateCreated()}
                                                        </small>
                                                    </p>
                                                </div>          
                                                <c:forEach items="${sessionScope.listArticle}" var="item">    
                                                    <c:if test="${item.getArticleID()== cmt.getArticleID()}">
                                                        <c:forEach var="acc" items="${sessionScope.listAccount}">
                                                            <c:if test="${acc.getAccountID()== cmt.getAccountID()}">
                                                                <div class=" col-md-8">
                                                                    <p>By <a href="${pageContext.request.contextPath}/manage/admin/account">${acc.getUsername()}</a> in <a href="${pageContext.request.contextPath}/manage/admin/List-of-articles">${item.getHeading()}</a></p>                                            
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->

                        <!-- /.col-lg-4 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="${pageContext.request.contextPath}/js/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="${pageContext.request.contextPath}/js/raphael.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/js/startmin.js"></script>
        <!--dung js-->
        <script src="${pageContext.request.contextPath}/js/dung.js"></script>
    </body>
</html>
