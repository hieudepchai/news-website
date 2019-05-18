<%-- 
    Document   : admin_account
    Created on : May 14, 2019, 11:40:27 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Account Magement</title>

        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
        <link type="text/css" rel="stylesheet" href="../css/font-awesome.min.css" >
        <link type="text/css" rel="stylesheet" href="../css/dung-style.css" />


    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top my-top-nav" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin"><i class="fa fa-home fa-fw"></i>Homepage</a>
                </div>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
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
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <span class="mr-3 d-none d-lg-inline text-gray-800 small"><c:out value="${sessionScope.CurrentAccount.getFirstName()}"></c:out> <c:out value="${sessionScope.CurrentAccount.getLastName()}"></c:out></span>
                            <c:set var="ProfilePicSrc" value="${sessionScope.CurrentAcount.getProfilePicture()}"/>
                            <c:choose>
                                <c:when test="${ProfilePicSrc!=null}">
                                    <img class="img-profile rounded-circle" src="sessionScope.CurrentAcount.getProfilePicture()">
                                </c:when>
                                <c:when test="${ProfilePicSrc==null}">
                                    <img class="img-profile rounded-circle" src="../img/user_pro_pic.png">
                                </c:when>
                            </c:choose>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                <a href="${pageContext.request.contextPath}/admin"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> Account<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="admin/account" class="active">Account manage</a>
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
                                <a href="bookmark.html"><i class="fa fa-bookmark "></i> Bookmark</a>
                            </li>
                            <li>
                                <a href="category.html"><i class="fa fa-archive "></i> Category</a>
                            </li>
                            <li>
                                <a href="comment.html"><i class="fa fa-comments "></i> Comment</a>
                            </li>
                            <li>
                                <a href="feedback.html"><i class="fa fa-flag "></i> Feedback</a>
                            </li>
                            <li>
                                <a href="image.html"><i class="fa fa-image "></i> Image</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Account</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-sm-12 ">
                            <div class="card">
                                <h2 style="cursor:s-resize;">Account Information</h2>
                                <div class="card-body">                                
                                    <form class="form-horizontal" id="account_form" action="${pageContext.request.contextPath}/admin/account/submit" enctype="multipart/form-data"  method="POST" >                                        
                                        <div class="form-group">
                                            <label for="username" class="cols-sm-2 control-label">AccountID</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-users fa"
                                                                                       aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" name="AccountID"
                                                           id="inputAccountID" placeholder=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="username" class="cols-sm-2 control-label">Username</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-users fa"
                                                                                       aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" name="Username"
                                                           id="inputUsername" placeholder="Enter your Username" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="cols-sm-2 control-label">Password</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                                       aria-hidden="true"></i></span>
                                                    <input type="password" class="form-control" name="Password"  id="inputPassword"
                                                           placeholder="Enter your Password"  disabled="disabled"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="cols-sm-2 control-label">Confirm Password</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                                       aria-hidden="true"></i></span>
                                                    <input type="password" class="form-control" id="inputRePassword"
                                                           placeholder="Confirm your Password"
                                                           disabled="disabled" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class="cols-sm-2 control-label">Your First Name</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user fa"
                                                                                       aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" name="FirstName" id="inputFirstName"
                                                           placeholder="Enter your first name" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class="cols-sm-2 control-label">Your Last Name</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user fa"
                                                                                       aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" name="LastName" id="inputLastName"
                                                           placeholder="Enter your last name" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="cols-sm-2 control-label">Your Email</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-envelope fa"
                                                                                       aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" name="Email" id="inputEmail"
                                                           placeholder="Enter your Email" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="phone" class="cols-sm-2 control-label">Phone number</label>
                                            <div class="cols-sm-10">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-phone fa"
                                                                                       aria-hidden="true"></i></span>
                                                    <input type="text" class="form-control" name="Phone" id="inputPhone"
                                                           placeholder="Enter your phone" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="type">Account Type</label>
                                            <select id="typeselect" autocomplete="off" class="form-control" name="AccountTypeID">
                                                <c:forEach var="acctype" items="${sessionScope.ListType}">
                                                    <option value="${acctype.getAccountTypeID()}">${acctype.getName()}</option>
                                                </c:forEach>
                                            </select>
                                            <span id="error_gender" class="text-danger"></span>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group wrap-inputfile" name="">
                                                <span class="input-group-addon"><i class="fa fa-file"
                                                                                   aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" id="upper-inputfile"
                                                       placeholder='Choose a file...' />
                                                <input type="file" name="ProfilePicture" class="form-control" id="lower-inputfile"
                                                       placeholder='Choose a file...' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="type">Valid</label>
                                            <select name="Valid" id="validselect" class="form-control" autocomplete="off" name="Valid">
                                                <option value="1">1</option>
                                                <option value="0">0</option>
                                            </select>
                                            <span id="error_gender" class="text-danger"></span>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="save"></label>
                                            <div class="col-md-8" id="btn-row">
                                                <input id="hidden-input" type="hidden" name="action">
                                                <div class="btn btn-success" id="mybtn-add">Add</div>
                                                <div class="btn btn-success" id="mybtn-edit">Edit</div>
                                                <div class="btn btn-success" id="mybtn-delete">Delete</div>
                                                <button type="button" class="btn btn-info" id="mybtn-save" disabled >Save</button>
                                                <div class="btn btn-danger" id="mybtn-reset">Reset</div>
                                            </div>
                                        </div>                                      
                                        <c:out value="${sessionScope.AccountSubmitResult}"></c:out>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                            <!-- /.panel-body -->

                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">List of Accounts</h1>
                    </div>
                </div>

                <div class="row">
                    <div class="table-responsive">
                        <table id="account_table" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">AccountID</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">FirstName</th>
                                    <th scope="col">LastName</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">AccountType</th>
                                    <th scope="col">ProfilePicture</th>
                                    <th scope="col">Valid</th>
                                    <th scope="col">DateCreated</th>
                                    <th scope="col">LastModified</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="account" items="${sessionScope.ListAccount}">
                                    <tr>
                                        <td class="td-AccountID">${account.getAccountID()}</td>
                                        <td class="td-Username">${account.getUsername()}</td>
                                        <td class="td-FirstName">${account.getFirstName()}</td>
                                        <td class="td-LastName">${account.getLastName()}</td>
                                        <td class="td-Email">${account.getEmail()}</td>
                                        <td class="td-Phone">${account.getPhone()}</td>
                                        <td class="td-AccountTypeID">${ sessionScope.TypeMap.getForward(account.getAccountTypeID())}</td>
                                        <td class="td-ProfilePicture">${account.getProfilePicture()}</td>
                                        <td class="td-Valid">${account.getValid()}</td>
                                        <td class="td-DateCreated">${account.getDateCreated()}</td>
                                        <td class="td-LastModified">${account.getLastModified()}</td>
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
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/startmin.js"></script>
        <script src="../js/dung.js"></script>
        <script src="../js/admin_account.js"></script>
    </body>

</html> 