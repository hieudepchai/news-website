<%-- 
    Document   : admin_ListofArticles
    Created on : May 27, 2019, 6:09:02 PM
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

        <title>List Of All Articles Management</title>

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
                                        <a href="${pageContext.request.contextPath}/manage/admin/List-of-articles" class="active">List of all Articles</a>
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
                            <h1 class="page-header">List of Articles</h1>
                        </div>
                    </div>
                    <!--Body-->
                    <div class= "row">
                        <div id="previewContainer" class="fullscreen-container" style="display: none">
                            <a class="close-btn mr-3"><i class="fa fa-times"></i></a>
                            <div id="preview" class="form-popup">
                                <div id="sign-up-header" class="form-popup-header">
                                    <h2 class="text-black-800">Preview</h2>

                                </div>
                                <div class="pre-content flex-column">
                                    <div class="form-popup-form">
                                        <img name="topicImg" class="mx-2 my-2" height="400" width="100%" />
                                        <h3 name="subjectAr" class="font-weight-bold text-gray-900">anh yeu am</h3>
                                        <h6 name="timeAr" class="text-gray-400 mt-0" style="text-transform:uppercase;">anh yeu em</h6>

                                        <div class="mt-4 text-gray-900" name="contentAr"></div>
                                        <div class="d-flex mt-4">
                                            <a name="cate1" class="btn btn-primary" href="#" >World</a>
                                            <a name="cate2" class="btn btn-info" href="#" >Asia</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:set  var="article" value="${sessionScope.listImg}"></c:set>


                        <div class="row">
                            <form id="form1" method="post" action="${pageContext.request.contextPath}/manage/admin/List-of-Articles" autocomplete="off">
                            <div class="aline">
                                <div class="table-responsive">
                                    <table id="table_article" class="table table-bordered table-striped">
                                        <!--Table head-->
                                        <thead>
                                            <tr> 
                                                <th scope="col"><input class="checkbox" id="select_all" type="checkbox"></th>                                 
                                                <th scope="col">ID</th>
                                                <th scope="col">Heading</th>
                                                <th scope="col">Category ID</th>
                                                <th scope="col">S. Cate ID</th>
                                                <th scope="col">J. ID</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Date Created</th>
                                                <th scope="col">Last Modified</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="bimap" value="${sessionScope.CategoryMap}"></c:set>
                                            <c:forEach items="${sessionScope.listArticle}" var="item">
                                                <tr>
                                                    <td><input class="checkbox" type="checkbox" name="check[]">
                                                        <input type="hidden" name="ArticleID" value="${item.getArticleID()}" />

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
                                                    <td>${item.getDateCreated()}</td>                                    
                                                    <td class="td-Time">${item.getLastModified()}</td>                                    
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!--Container-fluid-->
                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="save"></label>
                                    <div class="col-md-8" id="btn-row">
                                        <input id="hidden-input" type="hidden" name="action">
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
            });

            $("#btn-row").click(function () {
                var listArticleID = new Array();
                $.each($("input[name='check[]']:checked").next(), function () {
                    listArticleID.push($(this).val());
                });

                $.ajax({
                    type: "post",
                    encType: "multipart/form-data",
                    url: "List-of-articles",
                    cache: false,
                    processData: false,
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: jQuery.param({
                        json: listArticleID
                    }),

                    success: function () {
                        alert("Move to trash successful!");
                        location.reload();
                    },
                    error: function (msg) {
                        alert("Couldn't delete file, error: " + msg);
                    }
                });
            });

            <c:set  var="article" value="${sessionScope.Article}"></c:set>

            $("#table_article tbody tr ").click(function () {
                $("#table_article tbody").children(".red").toggleClass("red");
                $(this).toggleClass("red");
                if ($('.checkbox').is(':checked') === true) {
                    $("#previewContainer").css({"display": "none", "opacity": "1"});
                } else {
                    var ArticleID = $(this).children().children().next().val();
                    var cate1 = $(this).find(".td-Category").html();
                    var cate2 = $(this).find(".td-subCategory").html();
                    var status = $(this).find(".td-Status").html();
                    $("#previewContainer").css({"display": "block", "opacity": "1"});
                    $.ajax({
                        type: "post",
                        encType: "multipart/form-data",
                        url: "List-of-articles",
                        cache: false,
                        processData: false,
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                        data: jQuery.param({
                            ArticleID: ArticleID
                        }),

                        success: function (responseJson) {
                            var dNow = new Date();
                            var value = responseJson['value'];
                            var source = responseJson['key'];
                            $("h3[name = subjectAr]").text(value['Heading']);
                            $("h6[name = timeAr]").text(dNow.toDateString());
                            $("img[name = topicImg]").attr("src", `${pageContext.request.contextPath}/` + source);
                            var content = value['ShortDescription'] + value['Content'];
                            $("div[name = contentAr]").text("");
                            $("div[name = contentAr]").children().remove();
                            $("div[name = contentAr]").append(content);
                            if (cate2 === 'None') {   //categories
                                $("a[name = cate1]").text(cate1);
                                $("a[name = cate2]").hide();
                            } else {
                                $("a[name = cate2]").show();
                                $("a[name = cate1]").text(cate1);
                                $("a[name = cate2]").text(cate2);
                            }

                        },
                        error: function (msg) {
                            alert("Couldn't send to preview , error: " + msg);
                        }
                    });
                }
            });


        </script>
    </body>
</html>