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

        <title>Dashboard</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
<!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
         <link type="text/css" rel="stylesheet" href="css/font-awesome.min.css" >
        <link type="text/css" rel="stylesheet" href="css/dung-style.css" >

    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top my-top-nav" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin"><i class="fa fa-home fa-fw"></i>Homepage</a>
                </div>
                <button id="navbar-btn" type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown navbar-inverse">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-comment fa-fw"></i> New Comment
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-tasks fa-fw"></i> New Task
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-3 d-none d-lg-inline text-gray-800 small"><c:out value="${sessionScope.CurrentAccount.getFirstName()}"></c:out> <c:out value="${sessionScope.CurrentAccount.getLastName()}"></c:out></span>
                            <c:set var="ProfilePicSrc" value="${sessionScope.CurrentAcount.getProfilePicture()}"/>
                            <c:choose>
                                <c:when test="${ProfilePicSrc!=null}">
                                    <img class="img-profile rounded-circle" src="sessionScope.CurrentAcount.getProfilePicture()">
                                </c:when>
                                <c:when test="${ProfilePicSrc==null}">
                                    <img class="img-profile rounded-circle" src="img/user_pro_pic.png">
                                </c:when>
                            </c:choose>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="mydivider"></li>
                            <li> <form id="logout-form" action="logout" method="POST"></form><a id="logout-a"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="index.html" class="active" ><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Account<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="admin/account">Account manage</a>
                                    </li>
                                    <li>
                                        <a href="accounttype.html">Account type</a>
                                    </li>                                    
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-files-o fa-fw"></i> Article<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="articles_waiting.html">Waiting for censor</a>
                                    </li>
                                    <li>
                                        <a href="published.html">Published</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="bookmark.html" ><i class="fa fa-bookmark "></i> Bookmark</a>                                
                            </li>
                            <li>
                                <a href="category.html" ><i class="fa fa-archive "></i> Category</a>                                
                            </li>
                            <li>
                                <a href="comment.html" ><i class="fa fa-comments "></i> Comment</a>                                
                            </li>
                            <li>
                                <a href="feedback.html"  ><i class="fa fa-flag "></i> Feedback</a>                                
                            </li>
                            <li>
                                <a href="image.html" ><i class="fa fa-image "></i> Image</a>                                
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
                                            <div class="huge">26</div>
                                            <div>Comments!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="comments.html">
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
                                            <div class="huge">12</div>
                                            <div>Account!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="account.html">
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
                                            <div class="huge">124</div>
                                            <div>Articles</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="published.html">
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
                        <div class="col-lg-8">

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
                                    <div class="row">
                                        <br>
                                        <div class="col-xs-6 col-md-4">
                                            <p>
                                                <small class="text-muted"> Time uploaded
                                                </small>
                                            </p>
                                        </div>
                                        <div class="col-xs-12 col-md-8">
                                            <a href="#">Tittle</a>
                                        </div>
                                    </div>
                                    <!---->
                                    <div class="row">
                                        <br>
                                        <div class="col-xs-6 col-md-4">
                                            <p>
                                                <small class="text-muted"> Time uploaded
                                                </small>
                                            </p>
                                        </div>
                                        <div class="col-xs-12 col-md-8">
                                            <a href="#">Tittle</a>
                                        </div>
                                    </div>
                                    <!--Comment history-->                                    
                                    <hr>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="panel-heading">Recently commented</div>
                                        </div>
                                    </div>
                                    <!--end title-->
                                    <div class="row">
                                        <br>
                                        <div class="col-xs-6 col-md-4">
                                            <p>
                                                <small class="text-muted"> Time uploaded
                                                </small>
                                            </p>
                                        </div>
                                        <div class="col-xs-12 col-md-8">
                                            <p>By <a href="#">#username</a> in <a href="#">Thread</a> <br>Comments</p>                                            
                                        </div>
                                    </div>

                                    <div class="row">
                                        <br>
                                        <div class="col-xs-6 col-md-4">
                                            <p>
                                                <small class="text-muted"> Time uploaded
                                                </small>
                                            </p>
                                        </div>
                                        <div class="col-xs-12 col-md-8">
                                            <p>By <a href="#">#username</a> in <a href="#">Thread</a> <br>Comments</p>                                            
                                        </div>
                                    </div>

                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>                        <!-- /.col-lg-8 -->
                        <div class="col-lg-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-bell fa-fw"></i> Notifications Panel
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-comment fa-fw"></i> New Comment
                                            <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-files-o fa-fw"></i> New articles
                                            <span class="pull-right text-muted small"><em>10:57 AM</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-envelope fa-fw"></i> Message Sent
                                            <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-tasks fa-fw"></i> New Task
                                            <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                            <span class="pull-right text-muted small"><em>11:32 AM</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                            <span class="pull-right text-muted small"><em>11:13 AM</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                            <span class="pull-right text-muted small"><em>10:57 AM</em>
                                            </span>
                                        </a>

                                    </div>
                                    <!-- /.list-group -->
                                    <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                            <!-- /.panel -->

                            <!-- /.panel .chat-panel -->
                        </div>
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
        <script src="js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="js/raphael.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>
        <!--dung js-->
        <script src="js/dung.js"></script>
    </body>
</html>
