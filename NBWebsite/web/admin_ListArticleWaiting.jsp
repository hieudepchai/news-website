<%-- 
    Document   : admin_ListArticleWaiting
    Created on : May 31, 2019, 6:03:33 PM
    Author     : DUNG
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>List Articles Waiting Management</title>

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
                                        <a href="${pageContext.request.contextPath}/manage/admin/List-article-waiting" class="active">Waiting for censor</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/manage/admin/List-of-articles"">List of all Articles</a>
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
            <!--Navbar-->

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">List of Articles Waiting for Published</h1>
                        </div>
                    </div>
                    <!--Body-->


                    <div class="row">
                        <form id="form1" method="post" action="${pageContext.request.contextPath}/manage/admin/List-article-waiting" autocomplete="off">
                            <div class="aline">
                                <div class="table-responsive">
                                    <c:set  var="article" value="${sessionScope.listImg}"></c:set>
                                    <input type="hidden" name="ArticleID" id="inputArticleID"/>

                                        <table  id="table_article" class="table table-bordered table-striped">
                                            <!--Table head-->
                                            <thead>
                                                <tr> 
                                                    <th scope="col"><input class="checkbox" id="select_all" type="checkbox"></th>                                 
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Heading</th>
                                                    <th scope="col">Category ID</th>
                                                    <th scope="col">S.Cate ID</th>
                                                    <th scope="col">J. ID</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Last Modified</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:set var="bimap" value="${sessionScope.CategoryMap}"></c:set>
                                            <c:forEach items="${sessionScope.listArticleWaiting}" var="item">
                                                <tr>
                                                    <td><input class="checkbox" type="checkbox" name="check[]">
                                                        <input type="hidden" name="ArticleID1" value="${item.getArticleID()}" />
                                                    </td>
                                                    <td class="td-ArticleID">${item.getArticleID()}</td>
                                                    <td class="td-Heading">${item.getHeading()}</td>
                                                    <td class="td-Category">${bimap.getForward(item.getCategoryID())}</td>
                                                    <c:choose>
                                                        <c:when test="${item.getSubCategoryID()!=0}">
                                                            <td class="td-subCategory">${bimap.getForward(item.getSubCategoryID())}</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="td-subCategory">None</td>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <td class="td-JournalistID">${item.getJournalistID()}</td>                                    
                                                    <td>
                                                        <c:choose>
                                                            <c:when test = "${item.getCensored() == 1}">
                                                                <i class="ml-1 text-gray-900 td-Status" name="status">Published</i>
                                                            </c:when>                                        
                                                            <c:when test = "${item.getDraft() == 1}">
                                                                <i class="ml-1 text-gray-900 td-Status" name="status">Draft</i>
                                                            </c:when>
                                                            <c:when test = "${item.getTrash() == 1}">
                                                                <i class="ml-1 text-gray-900 td-Status" name="status">Trash</i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="ml-1 text-gray-900 td-Status"  name="status">Uncensored</i>
                                                            </c:otherwise>                                        
                                                        </c:choose>
                                                    </td>                                    
                                                    <td class="td-Time">${item.getLastModified()}</td>                                    
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!--Container-fluid-->
                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="save"></label>
                                    <div class="col-md-8 d-flex" id="btn-row">
                                        <input id="hidden-input" type="hidden" name="action">
                                        <div class="btn btn-success" name="button" value="accept" id="mybtn-success">Accept</div>
                                        <div class="btn btn-primary" name="button" value="unaccept" id="mybtn-unaccept" style="margin-left: 10px;">Unaccept</div>
                                    </div>
                                </div>        
                            </div>
                        </form>
                    </div>
                </div>
                <!--Page wrapper-->
            </div>
            <!--Wrapper-->
        </div>


        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="${pageContext.request.contextPath}/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/js/startmin.js"></script>
        <script src="${pageContext.request.contextPath}/js/dung.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin_article.js"></script>
        <script>            $('#table_article').ddTableFilter();

        </script>
        <script>
            $(".close-btn").click(function () {
                $("#previewContainer").css({"display": "none", "opacity": "1"});
                location.reload(true);
            });


            $("#mybtn-success").click(function () {
                var listArticleID = new Array();
                $.each($("input[name='check[]']:checked").next(), function () {
                    listArticleID.push($(this).val());
                });

                $.ajax({
                    type: "post",
                    encType: "multipart/form-data",
                    url: "List-article-waiting",
                    cache: false,
                    processData: false,
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: jQuery.param({
                        acceptJson: listArticleID
                    }),

                    success: function () {
                        alert("Accept Article Successful!");
                        $.each($("input[name='check[]']:checked").parentsUntil("tbody"), function () {
                            $(this).remove();
                        });
                    },
                    error: function (msg) {
                        alert("Couldn't accept file, error: " + msg);
                    }
                });
            });

            $("#mybtn-unaccept").click(function () {
                var listArticleID = new Array();
                $.each($("input[name='check[]']:checked").next(), function () {
                    listArticleID.push($(this).val());
                });
                $.ajax({
                    type: "post",
                    encType: "multipart/form-data",
                    url: "List-article-waiting",
                    cache: false,
                    processData: false,
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: jQuery.param({
                        unacceptJson: listArticleID
                    }),

                    success: function () {
                        $.each($("input[name='check[]']:checked").parentsUntil("tbody"), function () {
                            $(this).remove();
                        });
                    },
                    error: function (msg) {
                        alert("Couldn't unaccept the article, error: " + msg);
                    }
                });
            });

           

            $("#table_article tbody tr ").click(function () {
                $("#inputArticleID").val($(this).find(".td-ArticleID").html());
                $("#table_article tbody").children(".red").toggleClass("red");
                $(this).toggleClass("red");
                if ($('.checkbox').is(':checked') === true) {
                    $("#previewContainer").css({"display": "none", "opacity": "1"});
                } else {
                    $("#form1").submit();
//                    var ArticleID = $(this).children().children().next().val();
//                    $.ajax({
//                        type: "post",
//                        encType: "multipart/form-data",
//                        url: "List-article-waiting",
//                        cache: false,
//                        processData: false,
//                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
//                        data: jQuery.param({
//                            ArticleID: ArticleID
//                        }),
//
//                        success: function () {
//                            //alert("success");
//                        },
//                        error: function (msg) {
//                            alert("Couldn't send to preview , error: " + msg);
//                        }
//                    });

                }
            });


        </script>
    </body>
</html>