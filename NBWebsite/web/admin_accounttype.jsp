<%-- 
    Document   : admin_accounttype
    Created on : May 19, 2019, 9:31:12 AM
    Author     : DUNG
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
               <style type="text/css">
	label.error {
		display: inline-block;
		color:red;
		width: 200px;
	}
	</style>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Account Type Management</title>

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
        <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Custom Fonts -->
        <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dung-style.css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
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
                                <a href="${pageContext.request.contextPath}/manage/admin"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Account<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/manage/admin/account">Account manage</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/manage/admin/accounttype" class="active">Account type</a>
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
                            <h1 class="page-header">Account Type</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->

                    <div class="row">

                        <!-- /.panel-heading -->

                        <!-- /.panel -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-clock-o fa-fw"></i> <strong>List of account type</strong>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table id="accounttype_table" class="table table-striped tabletype">
                                    <thead>
                                        <tr>
                                            <th scope="col">Account type ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Reader Right</th>
                                            <th scope="col">Journalist Right</th>
                                            <th scope="col">Admin Right</th>
                                            <th scope="col">Account Manage</th>
                                            <th scope="col">Account type Manage </th>
                                            <th scope="col">Article Manage</th>
                                            <th scope="col">Comment Manage</th>
                                            <th scope="col">Bookmark Manage</th>
                                            <th scope="col">Feedback Manage</th>
                                            <th scope="col">Image Manage</th>   
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="accounttype" items="${sessionScope.ListType}">  
                                            <tr>
                                                <td class="td-TypeID">${accounttype.getAccountTypeID()}</td>
                                                <td class="td-Name">${accounttype.getName()}</td>
                                                <td class="td-ReaderRight">${accounttype.getReaderRight()}</td>
                                                <td class="td-JRight">${accounttype.getJournalistRight()}</td>
                                                <td class="td-AdminRight">${accounttype.getAdminRight()}</td>
                                                <td class="td-AccountMng">${accounttype.getAccountMng()}</td>
                                                <td class="td-AccountTypeMng">${accounttype.getAccountTypeMng()}</td>
                                                <td class="td-ArticleMng">${accounttype.getArticleMng()}</td>
                                                <td class="td-CommentMng">${accounttype.getCommentMng()}</td>
                                                <td class="td-BookmarkMng">${accounttype.getBookmarkMng()}</td>
                                                <td class="td-FeedbackMng">${accounttype.getFeedbackMng()}</td>
                                                <td class="td-ImgMng">${accounttype.getImageMng()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <div class="row">     <!-- /.col-lg-8 -->
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-bell fa-fw"></i> Add a new account type
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                  
                                    <form class="form-horizontal"  id="type_form" action="${pageContext.request.contextPath}/manage/admin/accounttype/submit"  method="GET">
                                        <div class="row">
                                            <span class="col-md-4 pull-left "><em>Account Type ID</em></span> 
                                            <span class=" col-md-8 pull-right text-muted small"><em><input type="text" class="form-control" name="AccountTypeID"
                                                                                                           id="inputTypeID" disabled required/></em></span>
                                        </div>

                                        <div class="row">
                                            <span class="col-md-4 pull-left "><em>Name of permission</em></span> 
                                            <span class=" col-md-8 pull-right text-muted small"><em><input type="text" class="form-control" name="Name"
                                                                                                           id="inputNametype"  required/></em></span>
                                        </div>
                                        <br>
               
                                            <div class ="col-md-4 pull-left">
                                                Permission Allowed
                                            </div>
                                            <div class="col-md-8 pull right" id="checkbox-list">
                                                <div class="row"><label><input type="checkbox" name="ReaderRight" id="cb-ReaderRight" value="1"/> Reader Right</label></div>
                                                <div class="row"><label><input type="checkbox" name="JournalistRight" id="cb-JLRight" value="1"/> Journalist Right</label></div>
                                                <div class="row"><label><input type="checkbox" name="AdminRight" id="cb-AdminRight" /> Admin Right</label></div>
                                                <div class="row"><label><input type="checkbox" name = "AccountMng" id="cb-AccountMng" /> Account Manage</label></div>
                                                <div class="row"><label><input type="checkbox" name = "AccountTypeMng" id="cb-AccountTypeMng" /> Account type Manage</label></div>
                                                <div class="row"><label><input type="checkbox" name = "ArticleMng" id="cb-ArticleMng" /> Article Manage</label></div>
                                                <div class="row"><label><input type="checkbox" name = "CommentMng" id="cb-CommentMng" /> Comment Manage</label></div>
                                                <div class="row"><label><input type="checkbox" name = "BookmarkMng" id="cb-BookmarkMng" /> Bookmark Manage</label></div>
                                                <div class="row"><label><input type="checkbox" name = FeedbackMng" id="cb-FeedbackMng" /> Feedback Manage</label></div>
                                            </div>
                                            <div class="col" id="btn-row">
                                                <input id="hidden-input" type="hidden" name="action">
                                                <div class="btn btn-success" id="mybtn-add">Add</div>
                                                <div class="btn btn-success" id="mybtn-edit">Edit</div>
                                                <div class="btn btn-success" id="mybtn-delete">Delete</div>
                                                <button type="submit" class="btn btn-info" id="mybtn-save" disabled>Save</button>
                                                <div class="btn btn-danger" id="mybtn-reset">Reset</div>
                                            </div>
                                            <c:out value="${sessionScope.TypeSubmitResult}"></c:out>
                                    </form>

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
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/js/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/js/raphael.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/js/startmin.js"></script>
    <script src="${pageContext.request.contextPath}/js/dung.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/admin_accounttype.js"></script>
        <script>
               $(document).ready(function() {
        		$("#type_form").validate({
			rules: {
                            AccountTypeID:"required",
                            Name:"required",
			},
			messages: {
                            AccountTypeID:"Please input ID",
                                Name:"Please input name",
			}
		});
	});
        </script>

</body>
</html>
