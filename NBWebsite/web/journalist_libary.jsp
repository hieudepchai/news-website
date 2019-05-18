<%-- 
    Document   : journalist_libary
    Created on : May 10, 2019, 4:42:10 PM
    Author     : quan1
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Libary</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <link type="text/css" rel="stylesheet" href="../css/style-quan.css" />
    <link type="text/css" rel="stylesheet" href="../css/all.min.css" />
    <link type="text/css" rel="stylesheet" href="../css/admin.content.css" />
    <link type="text/css" rel="stylesheet" href="../css/editor.css" />
</head>
<body>
    <nav class="navbar navbar-expand bg-white topbar static-top">
        <div class="topbar-brand d-flex align-items-center">
            <a title="Main menu" class="topbar-brand-icon br-50 px-3 py-2" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </a>
            <div class="topbar-brand-text mx-3">qhd</div>
        </div>
        <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell fa-fw"></i>
                    <!-- Counter - Alerts -->
                    <span class="badge badge-danger badge-counter">3+</span>
                </a>
                <!-- Dropdown - Alerts -->
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">
                        Alerts Center
                    </h6>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3">
                            <div class="icon-circle bg-primary">
                                <i class="fas fa-file-alt text-white"></i>
                            </div>
                        </div>
                        <div class="text-break">
                            <div class="small text-gray-500">December 12, 2019</div>
                            <span class="font-weight-bold">A new monthly report is ready to download!</span>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3">
                            <div class="icon-circle bg-success">
                                <i class="fas fa-donate text-white"></i>
                            </div>
                        </div>
                        <div class="text-break">
                            <div class="small text-gray-500">December 7, 2019</div>
                            $290.29 has been deposited into your account!
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3">
                            <div class="icon-circle bg-warning">
                                <i class="fas fa-exclamation-triangle text-white"></i>
                            </div>
                        </div>
                        <div class="text-break">
                            <div class="small text-gray-500">December 2, 2019</div>
                            Spending Alert: We've noticed unusually high spending for your account.
                        </div>
                    </a>
                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-3 d-none d-lg-inline text-gray-800 small">Valerie Luna</span>
                    <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-btn dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="profile-writer.html">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                        Settings
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                        Activity Log
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </a>
                </div>
            </li>
        </ul>
    </nav>

    <div id="wrapper">
        <ul id="accordionSidebar" class="navbar-nav bg-gradient-primary sidebar sidebar-dark">

            <li class="nav-item my-1">
                <a class="nav-link" href="dashboard-writer.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span class="mx-3">Dashboard</span>
                </a>
            </li>
            <hr class="sidebar-divider" />
            <li class="nav-item">
                <a name="dropdownAr" class="nav-link collapsed" aria-controls="collapseTwo" data-target="#collapseTwo" data-toggle="collapse">
                    <i class="fas fa-newspaper"></i>
                    <span class="mx-3">Article</span>
                </a>

            </li>
            <form method="get" action="../journalist/compose">
                <li class="nav-item d-none mb-0" name="article">
                    <button class="nav-link pl-4">
                        <i class="fas fa-fw fa-feather-alt"></i>
                        <span class="mx-2">Compose</span>
                    </button>
                </li>
            </form>
            <li class="nav-item d-none" name="article">
                <a class="nav-link pl-4" href="listOfArticle-writer.html">
                    <i class="fas fa-fw fa-list-alt"></i>
                    <span class="mx-2">List of articles</span>
                </a>
            </li>
            <li class="nav-item d-none" name="article">
                <a class="nav-link pl-4" href="draft-writer.html">
                    <i class="fas fa-fw fa-file"></i>
                    <span class="mx-2">Drafts</span>
                </a>
            </li>
            <form method="get" action="../journalist/libary">
                <li class="nav-item mb-0 active">
                    <button type="submit" class="nav-link">
                        <i class="fas fa-image"></i>
                        <span class="mx-3">Libary</span>
                    </button>
                </li>
            </form>
            <li class="nav-item">
                <a class="nav-link" href="inbox-writer.html">
                    <i class="fas fa-inbox"></i>
                    <span class="mx-2">Comments</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="trash-writer.html">
                    <i class="fas fa-trash-alt"></i>
                    <span class="mx-2">Trash</span>
                </a>
            </li>
            <hr class="sidebar-divider" />
            <li class="nav-item">
                <a class="nav-link d-flex" href="profile-writer.html">
                    <div class="img-profile">
                        <img class="rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                        <div class="status-indicator bg-success"></div>
                    </div>
                    <span class="text-gray-900 ml-2 mt-2">Valerie Luna</span>
                </a>
            </li>
        </ul>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <div class="card-tools bg-white">
                    <div class="d-flex flex-row">
                        <select class="mx-1 my-1" style="width:200px;">
                            <option value="All">All</option>
                            <option value="saab">Saab</option>
                            <option value="opel">Opel</option>
                            <option value="audi">Audi</option>
                        </select>
                        <select class="mx-1 my-1" style="width:200px;">
                            <option value="All day">All day</option>
                            <option value="saab">Saab</option>
                            <option value="opel">Opel</option>
                            <option value="audi">Audi</option>
                        </select>
                        <input class="text-lg btn-input mx-1" id="saveBtn" type="button" value="Search" />
                        <!--<div class="ml-auto">
                            <input id="file" type="file" name="video/image" accept="file_extension|audio/*|video/*|image/*|media_type*" onchange="loadFile(event)" style="display: none;"/>
                            <label class="text-gray-800 h6 add-image br-3" for="file" style="cursor: pointer;">
                                Add image
                            </label>
                        </div>-->


                    </div>

                </div>

                <div class="card-tools-body">

                    <form id="form1" method="post" action="../journalist/libary" enctype="multipart/form-data" autocomplete="off">
                        <div id="listImage" class="row mx-3 my-3">
                            <input id="file" name="file" type="file" accept="file_extension|audio/*|video/*|image/*|media_type*" multiple="true" style="display: none;" />
                            <button id="addImg" type="submit" class="add-img-border bg-white mx-1 my-1" title="Choose files to upload">
                                <i class="text-gray-600 fas fa-plus" style="font-size: 50px;"></i> 
                                <br>
                                <label class="h5 text-gray-600 mt-2">
                                    Add image
                                </label>
                            </button>
    <div class="modal fade" id="addImgModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog-11">
            <div class="modal-content bg-gray-150">
                <div class="modal-header mb-0">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h5 class="modal-title text-gray-900">Insert image</h5>
                    <input id="file1" type="file" accept="file_extension|audio/*|video/*|image/*|media_type*" multiple="multiple" style="display: none;"/>
                    <div class="addImgForm row ml-auto mt-2" name="addMoreImg">
                        <div class="add-img-border mx-2 my-2" title="Choose files to upload" style="cursor: pointer;" >
                            <i class="ml-6 mt-52 text-gray-600 fas fa-plus" style="font-size: 50px;"></i>                          
                            <label class="h5 text-gray-600 mt-2" style="margin-left: 3.3rem;">
                                    Add image
                            </label>
                        </div>
                        <img class="mx-2 my-2" src="img/quan/IMG_0803.JPG" height="200" weight="200"/>
                        
                    </div>
                </div>
                
                <div class="modal-footer bg-gray-150">
                    <button class="btn btn-success" type="submit">Done</button>
                    
                </div>
            </div>
        </div>
    </div>
                        <c:forEach items="${listImage}" var="item">
                            <div class="img-border mx-1 my-1">
                                <img class="mr-2 mb-2" src="${item}" height="200" width="200" />
                            </div>
                        </c:forEach>                                              
                            
                        </div>
                    </form>

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

    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>

                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="index.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- show image -->
    <div id="previewContainer" class="fullscreen-container">
        <a class="close-btn mr-3"><i class="fas fa-times"></i></a>
        <img id="previewImg" class="form-popup-img" />
        <a name="prev" class="btn-prev mx-2">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a name="next" class="btn-next mx-2">
            <i class="fas fa-chevron-right"></i>
        </a>
        <div class="border-list-image d-flex" id="listImg">
            <div style="width: 200px"></div>
            <div style="overflow:hidden; display: flex;" name="listImg">
                
            </div>
            <div class="ml-auto" style="width: 200px"></div>
        </div>
    </div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/admin-writer.js"></script>
    <script>
        var srcListImg = new Array();
        <c:forEach items="${listImage}" var="item">
            srcListImg.push('<c:out value='${item}'/>');
        </c:forEach>;
            
        $(document).ready(function(){
            var cImg = $(".img-border > img:visible");
            if (cImg.length < 12){
                $("footer").addClass("bottom-fixed");
            } else{
                $("footer").removeClass("bottom-fixed");
            }
        })
        //animation to move image
    function imgMove(clickImgPos) {
        var n = srcListImg.length; //the number of array's elements 

        if (n >= 17) { //17 image thumnails
            //alert(clickImgPos);
            if (clickImgPos < n - 8 && clickImgPos >= 8) {
                //alert("acb");
                var rLeft = n - 9 - clickImgPos; //rest of left
                $("#listImg img").animate({
                    left: rLeft * -78  //move left
                });
            } else if (clickImgPos < 8) {
                var fLeft = n - 1 - 15; //fixed left
                $("#listImg img").animate({
                    left: fLeft * -78  //move left
                });
            } else if (clickImgPos >= n - 8) {
                $("#listImg img").animate({
                    left: "0px"
                });
            }
        }
    };
    
    //draw list of images into div[name = listImg] depend on array srcListImg
    function handleListImg() {
        $("#listImg div[name = listImg] img").remove();
        for (var i = srcListImg.length - 1; i >= 0; i--) {
            var img = $('<img/>', {
                class: "aImage mx-1 my-1",
                src: srcListImg[i]
            }).appendTo("#listImg div[name = listImg]").click(function () {
                $("#previewImg").attr({ 'src': $(this).attr('src'), 'target': $(this).attr('target') });
                $("#listImg img").css('opacity', '0.4');
                $(this).css('opacity', '1');
                var clickImgPos = jQuery.inArray($(this).attr('src'), srcListImg);
                //alert(clickImgPos + " " + srcListImg.length);
                    imgMove(clickImgPos);
                })
        }
        //alert(srcListImg.length);
    };
    
    function prevMove(){
        var n = srcListImg.length;
        var PreImgPos = jQuery.inArray($("#previewImg").attr('src'), srcListImg);
        if (PreImgPos >= 0) {
            $("#previewImg").attr({ 'src': srcListImg[PreImgPos + 1] });
            $("#listImg img").css('opacity', '0.4');
            $("#listImg div[name = listImg] img").eq(n - 1 - PreImgPos - 1).css('opacity', '1');
            if (n >= 17) {
                if (PreImgPos < 8) {
                    var fLeft = n - 1 - 15; //fixed left
                    $("#listImg img").animate({
                        left: fLeft * -78
                    });
                } else if (PreImgPos >= n - 8) {
                    $("#listImg img").animate({
                        left: "0px"
                    });
                } else {
                    $("#listImg img").animate({
                        left: '+=78px'
                    });
                }
            }
        }
    }
    
    function nextMove(){
        var n = srcListImg.length;
        var PreImgPos = jQuery.inArray($("#previewImg").attr('src'), srcListImg);
        if (PreImgPos >= 0) {
            $("#previewImg").attr({ 'src': srcListImg[PreImgPos - 1] });
            $("#listImg img").css('opacity', '0.4');
            $("#listImg div[name = listImg] img").eq(n - 1 - PreImgPos + 1).css('opacity', '1');
            if (n >= 17) {
                if (PreImgPos < 8) {
                    var fLeft = n - 1 - 15; //fixed left
                    $("#listImg img").animate({
                        left: fLeft * -78
                    });
                } else if (PreImgPos >= n - 8) {
                    $("#listImg img").animate({
                        left: "0px"
                    });
                } else {
                    $("#listImg img").animate({
                        left: '-=78px'
                    });
                }
            }
        }
    }
    
    //go to previous image
    $("a[name = prev]").click(function () {
        prevMove();

    });

    //go to new image
    $("a[name = next]").click(function () {
        nextMove();
        
    });
    
    $(document).keydown(function(e){
    if (e.keyCode === 37) {
       prevMove();
    } else if (e.keyCode === 39){
        nextMove();
    }
    });
    
    //$(document).keydown(function (evt) { alert(evt.which); });
    
    $(".img-border > img").click(function(){
        //alert("acb");
        handleListImg();
        $("#previewImg").attr({ 'src': $(this).attr('src'), 'target': $(this).attr('target') });
        $("#previewContainer").css({ "display": "block", "opacity": "1" });

        var clickImgPos = jQuery.inArray($(this).attr('src'), srcListImg);
        $("#listImg img").css('opacity', '0.4');
        $("#listImg div[name = listImg] img").eq(srcListImg.length - 1 - clickImgPos).css('opacity', '1');
        //alert(clickImgPos + " " + srcListImg.length);

        imgMove(clickImgPos);
    })
    </script>
</body>
</html>
