<%-- 
    Document   : journalist_compose
    Created on : May 4, 2019, 9:57:19 AM
    Author     : quan1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Compose</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <!--<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />-->
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
        <!--Menu-->
        <ul id="accordionSidebar" class="navbar-nav bg-gradient-primary sidebar sidebar-dark">

            <li class="nav-item my-1">
                <a class="nav-link" href="dashboard-writer.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span class="mx-3">Dashboard</span>
                </a>
            </li>
            <hr class="sidebar-divider" />
            <li class="nav-item active">
                <a name="dropdownAr" class="nav-link collapsed" aria-controls="collapseTwo" data-target="#collapseTwo" data-toggle="collapse">
                    <i class="fas fa-newspaper"></i>
                    <span class="mx-3">Article</span>
                </a>

            </li>
            <form method="get" action="journalistComposeServlet">
                <li class="nav-item active d-none mb-0" name="article">
                    <button type="submit" class="nav-link pl-4">
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
            <form method="get" action="journalistLibaryServlet">
                <li class="nav-item mb-0">
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
        <form id="form1" method="post" action="journalistComposeServlet" enctype="multipart/form-data">
            <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

                <div class="container-fluid">
                    <!-- Page Heading-->
                    <div class="d-sm-flex align-items-center justify-content-center mb-4">
                        <h1 class="h3 mb-0 mr-auto text-gray-800 float-left">Compose</h1>
                    </div>
                    <!--Content-->
                    <div class="row">
                        <div class="col-xl-9 mb-4">
                            <div class="form-group">
                                <input class="shadow form-subject form-control-subject font-weight-bold" id="subjectInput" name="subjectInput" type="text" placeholder="Subject" />
                            </div>
                            <div>
                                <input type="file" name="videoImage" accept="file_extension|audio/*|video/*|image/*|media_type*" size="60"/>
                                    
                            </div>
                            <div class="container">
                                <div class="row">

                                    <div class="col-lg-12 nopadding text-gray-800">
                                        <textarea id="txtEditor" class="form-subject form-control-subject"></textarea>
                                    </div>
                                        <input type="hidden" name="selectedVehicles" id="selectedVehicles"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="card shadow mb-3">
                                <!--Card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Post</h6>
                                </div>
                                <!--card body-->
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-center mb-1">
                                        <button type="button" name="saveDraft" class="mr-auto d-inline-block btn btn-sm btn-primary shadow-sm">Save draft</button>
                                        <a name="btnPreview" class="ml-auto d-inline-block btn btn-sm btn-primary shadow-sm">Preview</a>                                        
                                    </div>
                                    
                                    <div id="previewContainer" class="fullscreen-container">
                                        <a class="close-btn mr-3"><i class="fas fa-times"></i></a>
                                        <div id="preview" class="form-popup">
                                            <div id="sign-up-header" class="form-popup-header">
                                                <h3 class="text-gray-800">Preview</h3>

                                            </div>
                                            <div class="pre-content flex-column">
                                                <div class="form-popup-form">
                                                    <img name="topicImg" class="mx-2 my-2" height="400" width="100%" />
                                                    <!--<a href="javascript:void(0)" class="thumbnail">
                                                        <img src="" title="" />
                                                    </a>-->
                                                    <h3 name="subjectAr" class="font-weight-bold text-gray-900">anh yeu am</h3>
                                                    <h6 name="timeAr" class="text-gray-400 mt-0" style="text-transform:uppercase;">anh yeu em</h6>
                                                    <div class="mt-4" name="contentAr"></div>
                                                    <div class="d-flex mt-4">
                                                        <a name="cate1" class="px-3 py-1" href="#" style="border: 1px solid;">World</a>
                                                        <a name="cate2" class="ml-1 px-3 py-1" href="#" style="border: 1px solid;">Asia</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-1 ml-0">
                                            <i class="fas fa-map-pin"></i>
                                        </div>
                                        <div class="text-gray-900">Status: <b>Draft</b> <a class="ml-1" href="#">edit</a></div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-1 ml-0">
                                            <i class="fas fa-eye"></i>
                                        </div>
                                        <div class="text-gray-900">Sharing: <b>Public </b> <a class="ml-1" href="#">edit</a></div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-1 ml-0">
                                            <i class="fas fa-calendar-alt"></i>
                                        </div>
                                        <div class="text-gray-900">Upload: <b>Now</b> <a class="ml-1" href="#">edit</a></div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-1 ml-0">
                                            <i class="fab fa-vimeo-v"></i>
                                        </div>
                                        <div class="text-gray-900">Readability: <b>Need improvement</b> </div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-1 ml-0">
                                            <i class="fab fa-vimeo-v"></i>
                                        </div>
                                        <div class="text-gray-900">SEO: <b>Off</b> </div>
                                    </div>
                                </div>
                            </div>                            

                            <div id="categories" class="card shadow mb-4">
                                <!--Card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Categories</h6>
                                </div>
                                <!--card body-->
                                <div class="card-body card-scroll">
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb1" type="checkbox" name="category" value="News"/>
                                        <label class="text-gray-900">News</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb2" type="checkbox" name="category" value="World"/>
                                        <label class="text-gray-900">Wolrd</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Africa"/>
                                        <label class="text-gray-900">Africa</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Americas"/>
                                        <label class="text-gray-900">Americas</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Asia"/>
                                        <label class="text-gray-900">Asia</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Australian"/>
                                        <label class="text-gray-900">Australian</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Europe"/>
                                        <label class="text-gray-900">Europe</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb3" type="checkbox" name="category" value="Business"/>
                                        <label class="text-gray-900">Business</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb03" type="checkbox" name="category" value="Economy"/>
                                        <label class="text-gray-900">Economy</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb03" type="checkbox" name="category" value="Industries"/>
                                        <label class="text-gray-900">Industries</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb03" type="checkbox" name="category" value="Companies"/>
                                        <label class="text-gray-900">Companies</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb4" type="checkbox" name="category" value="Opinion"/>
                                        <label class="text-gray-900">Opinion</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb5" type="checkbox" name="category" value="Entertainment"/>
                                        <label class="text-gray-900">Entertainment</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb05" type="checkbox" name="category" value="Celebrity"/>
                                        <label class="text-gray-900">Celebrity</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb05" type="checkbox" name="category" value="Music"/>
                                        <label class="text-gray-900">Music</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb05" type="checkbox" name="category" value="Fashion"/>
                                        <label class="text-gray-900">Fashion</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb6" type="checkbox" name="category" value="Sport"/>
                                        <label class="text-gray-900">Sport</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb06" type="checkbox" name="category" value="Football"/>
                                        <label class="text-gray-900">Football</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb06" type="checkbox" name="category" value="Tennis"/>
                                        <label class="text-gray-900">Tennis</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb06" type="checkbox" name="category" value="Others"/>
                                        <label class="text-gray-900">Others</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb7" type="checkbox" name="category" value="Technology"/>
                                        <label class="text-gray-900">Technology</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb07" type="checkbox" name="category" value="Product"/>
                                        <label class="text-gray-900">Product</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb07" type="checkbox" name="category" value="Technology life"/>
                                        <label class="text-gray-900">Technology life</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb8" type="checkbox" name="category" value="Travel"/>
                                        <label class="text-gray-900">Travel</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb08" type="checkbox" name="category" value="Place"/>
                                        <label class="text-gray-900">Place</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb08" type="checkbox" name="category" value="Food"/>
                                        <label class="text-gray-900">Food</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-7 mb-4">
                            <div class="card shadow">
                                <!--card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Note</h6>
                                </div>
                                <!--card body-->
                                <div class="card-body">
                                    <div class="form-group">
                                            <textarea id="note" name="note" class="form-subject form-control-subject h-6 text-monospace"></textarea>
                                    </div>
                                    
                                </div>
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
        </form>
        
    </div>

    <!-- log out -->
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

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/admin-writer.js"></script>
    <script src="../js/editor.js"></script>
    <script>
        $(document).ready(function () {
            $("#txtEditor").Editor();
        });
    </script>
    <script type="text/javascript">

    function processEditor()
    {
        
        var hiddenSelectedVehicles = document.getElementById("selectedVehicles");
        hiddenSelectedVehicles.value = $(".Editor-editor").html();
        alert(hiddenSelectedVehicles.value());
        // jQuery
        /* $("#selectedVehicles").value(selectedVehicleTypes.join(",")); */
        
        // Submit the form using javascript
        var form = document.getElementById("form1");
        form.submit();
        
        //jQuery
        /* $("#vehicles").submit(); */
    }
    
    $("button[name = saveDraft]").click(function(){
        $("#selectedVehicles").val($(".Editor-editor").html()); 
        
         var error = 0;
        var subject = $("#subjectInput").val();
        var content = $(".Editor-editor").html();
        
        var countCb = $("#categories div > input:checked").length;  //number of checkboxes checked

        if (subject === '') {  //subject
            alert("Please entering the article subject");
            error = 1;
            return;
        }; 
        
        if ($("input[name=videoImage]").get(0).files.length === 0){
            alert("Please choosing an image topic!");
            error = 1;
            return;
        }

        if (content === '<br>') {  //content
            alert("Please entering the article content!");
            error = 1;
            return;
        };

        if (countCb === 0) {   //categories
            alert("Please choosing category of the articles");
            error = 1;
            return;
        };

        if (error === 0)
        {
            $("#form1").submit();
            $(this).attr("type", "submit");
        }
    });
</script>
</body>
</html>
