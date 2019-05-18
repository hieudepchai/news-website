<%-- 
    Document   : journalist_dashboard
    Created on : May 17, 2019, 1:30:46 PM
    Author     : quan1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Dashboard</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


    <link type="text/css" rel="stylesheet" href="css/style-quan.css" />
    <link type="text/css" rel="stylesheet" href="css/all.min.css" />
    <link type="text/css" rel="stylesheet" href="css/admin.content.css" />
</head>
<body id="page-top">
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

            <li class="nav-item active my-1">
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
            <form method="get" action="journalist/compose">
                <li class="nav-item d-none mb-0" name="article">
                    <button type="submit" class="nav-link pl-4">
                        <i class="fas fa-fw fa-feather-alt"></i>
                        <span class="mx-2">Compose</span>
                    </button>
                </li>
            </form>
            <form method="get" action="journalist/List-of-Articles">
                <li class="nav-item d-none mb-0" name="article">
                    <button type="submit" class="nav-link pl-4">
                        <i class="fas fa-fw fa-list-alt"></i>
                        <span class="mx-2">List of articles</span>
                    </button>
                </li>
            </form>           
            <li class="nav-item d-none" name="article">
                <a class="nav-link pl-4" href="draft-writer.html">
                    <i class="fas fa-fw fa-file"></i>
                    <span class="mx-2">Drafts</span>
                </a>
            </li>
            <form method="get" action="journalist/libary">
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

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

                <div class="container-fluid">
                    <!-- Page Heading-->
                    <div class="d-flex align-items-center justify-content-center mb-4">
                        <h3 class="h3 mb-0 mr-auto text-gray-800">Dashboard</h3>
                    </div>
                    <!--Content-->
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 mb-3">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">

                                        <div class="col ml-4">
                                            <i class="fas fa-pen-alt fa-4x text-gray-700"></i>
                                        </div>
                                        <div class="col-auto mr-4">
                                            <div class="text-lg font-weight-bold text-primary text-uppercase mb-2"><a href="listOfArticle-writer.html">Articles</a></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 float-right">404</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 mb-3">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">

                                        <div class="col ml-4">
                                            <i class="far fa-file fa-4x text-gray-700"></i>
                                        </div>
                                        <div class="col-auto mr-4">
                                            <div class="text-lg font-weight-bold text-primary text-uppercase mb-2"><a href="draft-writer.html">Drafts</a></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 float-right">123</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 mb-3">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">

                                        <div class="col ml-4">
                                            <i class="fas fa-comments fa-4x text-gray-700"></i>
                                        </div>
                                        <div class="col-auto mr-4">
                                            <div class="text-lg font-weight-bold text-primary text-uppercase mb-2"><a href="#comments">Comments</a></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 float-right">404</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-xl-5">
                            <div class="card mb-4 shadow">
                                <!--card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Drafts</h6>
                                </div>
                                <!--card body-->
                                <div class="card-body">
                                    <form class="user">
                                        <div class="form-group">
                                            <input class="form-subject form-control-subject font-weight-bold" id="subjectInput" type="text" placeholder="Subject" />
                                        </div>
                                        <div class="form-group">
                                            <!--<input class="form-subject form-control-subject h-6" id="ideaInput" type="text" placeholder="What's on your mind?" />-->
                                            <textarea class="form-subject form-control-subject h-6 text-monospace" name="idea" form="usrform" placeholder="What's on your mind?"></textarea>
                                        </div>
                                        <input class="text-lg btn-input mb-3" id="saveBtn" type="button" value="Save" />
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-7">
                            <div class="card mb-4 shadow">
                                <!--Card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Activities</h6>
                                </div>
                                <!--Card body-->
                                <div class="card-body">
                                    <div class="d-flex mb-1">
                                        <h5 class="h5 mb-0 mt-0 text-gray-800 float-left">Recent</h5>
                                    </div>

                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-3 ml-0">
                                            <p class="text-gray-500 mb-0 mt-0">14/12/2018, 14:32</p>
                                        </div>
                                        <div class="col-9">
                                            <a class="mb-0 mt-0" href="#">Connect to Android studio through wifi Connect to Android studio through wifi Connect to Android studio through wifi</a>
                                        </div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-3 ml-0">
                                            <p class="text-gray-500 mb-0 mt-0">14/12/2018, 14:32</p>
                                        </div>
                                        <div class="col-9">
                                            <a class="mb-0 mt-0" href="#">Connect to Android studio through wifi Connect to Android studio through wifi Connect to Android studio through wifi</a>
                                        </div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-3 ml-0">
                                            <p class="text-gray-500 mb-0 mt-0">14/12/2018, 14:32</p>
                                        </div>
                                        <div class="col-9">
                                            <a class="mb-0 mt-0" href="#action">Connect to Android studio through wifi.</a>
                                        </div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-3 ml-0">
                                            <p class="text-gray-500 mb-0 mt-0">14/12/2018, 14:32</p>
                                        </div>
                                        <div class="col-9">
                                            <a class="mb-0 mt-0" href="#">Connect to Android studio through wifi Connect to Android studio through wifi Connect to Android studio through wifi</a>
                                        </div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-3 ml-0">
                                            <p class="text-gray-500 mb-0 mt-0">14/12/2018, 14:32</p>
                                        </div>
                                        <div class="col-9">
                                            <a class="mb-0 mt-0" href="#action">Connect to Android studio through wifi.</a>
                                        </div>
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

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/admin-writer.js"></script>

</body>
</html>