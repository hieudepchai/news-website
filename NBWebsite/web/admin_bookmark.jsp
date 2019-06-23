<%-- 
    Document   : admin_bookmark
    Created on : Jun 10, 2019, 1:32:32 PM
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

        <title>Bookmark Management</title>

        <!-- Bootstrap Core CSS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Account Magement</title>

        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="${pageContext.request.contextPath}/css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" >
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dung-style.css" />
    </head>
<body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse  my-top-nav" role="navigation">
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
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
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
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/manage/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                <a href="${pageContext.request.contextPath}/manage/admin"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Account<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/manage/admin/account" >Account manage</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/manage/admin/accounttype" >Account type</a>
                                    </li>                                    
                                </ul>

                            </li>

                            <li>
                                <a href="#" ><i class="fa fa-files-o fa-fw"></i> Article<span class="fa arrow"></span></a>
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
                                <a href="${pageContext.request.contextPath}/manage/admin/bookmark" class="active"><i class="fa fa-bookmark "></i> Bookmark</a>                                
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
            <!--Navbar-->

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">List of bookmark</h1>
                        </div>
                    </div>
                    <!--Body-->

                        <div class="row">
                            <form id="form1" method="post" action="${pageContext.request.contextPath}/manage/admin/bookmark" autocomplete="off">
                            <div class="aline">
                                <div class="table-responsive">
                                    <table id="table-bookmark" class="table table-bordered table-striped">
                                        <!--Table head-->
                                        <thead>
                                            <tr> 
                                            <th scope="col"><input class="checkbox" id="select_all" type="checkbox"></th>                                 
                                            <th scope="col">Bookmark ID</th>                                  
                                            <th scope="col">Account ID</th>
                                            <th scope="col">Article ID</th>                                  
                                            <th scope="col">Title</th>
                                            <th scope="col">Date Created</th>                                            
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.listBookmark}" var="bm">   
                                            <tr>
                                                <td>
                                                    <input class="checkbox" type="checkbox" name="check[]">
                                                    <input type="hidden" name="BookmarkID" value="${bm.getBookmarkID()}" />
                                                </td>
                                                <td class="td-BookmarkID">${bm.getBookmarkID()}</td>
                                                <td class="td-AccountID">${bm.getAccountID()}</td>
                                                <td class="td-ArticleID">${bm.getArticleID()}</td>
                                                <td class="td-Title">${bm.getTitle()}</td>
                                                <td class="td-DateCreated">${bm.getDateCreated()}</td>
                                            </tr>                                            
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!--Container-fluid-->
                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="save"></label>
                                    <div class="col-md-8" id="btn-row">
                                        <div class="btn btn-danger" id="mybtn-delete">Delete</div>
                                    </div>
                                </div>        
                            </div>
                        </form>
                    </div>
                    <!--Page wrapper-->
                </div>
                <!--Wrapper-->
            </div>
        </div>

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="${pageContext.request.contextPath}/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/js/startmin.js"></script>
        <script src="${pageContext.request.contextPath}/js/dung.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin_bookmark.js"></script>
        <script>
            $('#table-bookmark').ddTableFilter();
        </script>
        <script>
            $("#btn-row").click(function () {
                var ctx = "${pageContext.request.contextPath}"
                var listBookmarkID = new Array();
                $.each($("input[name='check[]']:checked").next(), function () {
                    listBookmarkID.push($(this).val());
                });
                $.ajax({
                    type: "post",
                    encType: "multipart/form-data",
                    url: "bookmark",
                    cache: false,
                    processData: false,
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: jQuery.param({
                        deleteBookmark: listBookmarkID
                    }),
                    success: function () {
                        alert("Delete successful!");
                        location.reload();
                    },
                    error: function (msg) {
                        alert("Couldn't delete file, error: " + msg);
                    }
                });
            });

        </script>
    </body>
</html>
