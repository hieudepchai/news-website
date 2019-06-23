<%-- 
    Document   : admin_category
    Created on : May 21, 2019, 8:45:03 AM
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

        <title>Category Management</title>

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
            <nav class="navbar navbar-inverse navbar-fixed-top my-top-nav" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/manage/admin"><i class="fa fa-home fa-fw"></i>Homepage</a>
                </div>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
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
                                <c:when test="${ProfilePicSrc!=null }">
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
                                <a href="${pageContext.request.contextPath}/manage/admin" ><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Account<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/manage/admin/account" >Account manage</a>
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
                                <a href="${pageContext.request.contextPath}/manage/admin/category" class="active"><i class="fa fa-archive "></i> Category</a>
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
                            <h1 class="page-header">Category</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">

                                            <form class="form-horizontal"  id="category_form" action="${pageContext.request.contextPath}/manage/admin/category/submit" enctype="multipart/form-data"  method="GET">
                                                <div class="form-group">
                                                    <label for="categoryid" class="cols-sm-2 control-label">Category ID</label>
                                                    <div class="cols-sm-10">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                            <input type="text" class="form-control" name="CategoryID" id="inputCategoryID" placeholder="Enter your Category ID" required/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="name" class="cols-sm-2 control-label">Category Name</label>
                                                    <div class="cols-sm-10">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                            <input type="text" class="form-control" name="CategoryName" id="inputCategoryName" placeholder="Enter your Category Name" required/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="categoryparentid" class="cols-sm-2 control-label">Category Parent ID</label>
                                                    <select id="categoryselect" autocomplete="off" class="form-control" name="ParentCategoryID">
                                                        <option value="0">0</option>                                                        
                                                        <c:forEach var="category" items="${sessionScope.ListCategory}">
                                                            <c:if test = "${category.getParentCategoryID() == 0 }">                                                             
                                                                <option value="${category.getCategoryID()}">${category.getName()}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                    <span id="error_gender" class="text-danger"></span>
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
                                            <!-- /.col-lg-6 (nested) -->
                                        </div>
                                        <!-- /.row (nested) -->
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">List of Category</h1>
                        </div>
                    </div>

                    <div class="row">
                        <div class="table-responsive">
                            <table id="category_table" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Category ID</th>                                  
                                        <th scope="col">Category Name</th>
                                        <th scope="col">Category Parent ID</th>

                                    </tr>
                                </thead>
                                <tbody>
                                <c:set  var="bimap" value="${sessionScope.CategoryMap}"></c:set>
                                <c:forEach var="category" items="${sessionScope.ListCategory}">                                
                                    <tr>
                                        <td class="td-CategoryID">${category.getCategoryID()}</td>                                  
                                        <td class="td-CategoryName"> ${category.getName()}</td>
                                        <c:choose>
                                            <c:when test="${category.getParentCategoryID()!=0}">
                                                <td class="td-ParentID">${bimap.getForward(category.getParentCategoryID())}</td>
                                            </c:when>
                                            <c:when test="${category.getParentCategoryID()==0}">
                                                <td class="td-ParentID">0</td>
                                            </c:when>

                                        </c:choose>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
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
        <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/js/startmin.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin_category.js"></script>
        <script src="${pageContext.request.contextPath}/js/dung.js"></script>
        <script>
               $(document).ready(function() {
        		$("#category_form").validate({
			rules: {
                                CategoryID:"required",
                                CategoryName:"required",
			},
			messages: {
                                CategoryID:"Please input ID",
                                CategoryName:"Please input name of category",
			}
		});
	});
        </script>

    </body>
</html>

