<%-- 
    Document   : journalist_listOfArticles
    Created on : May 17, 2019, 1:31:13 PM
    Author     : quan1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>List of article</title>
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
            <li class="nav-item d-none" name="article">
                <a class="nav-link pl-4" href="compose-writer.html">
                    <i class="fas fa-fw fa-feather-alt"></i>
                    <span class="mx-2">Compose</span>
                </a>
            </li>
            <li class="nav-item active d-none" name="article">
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
            <li class="nav-item">
                <a class="nav-link" href="libary-writer.html">
                    <i class="fas fa-image"></i>
                    <span class="mx-3">Libary</span>
                </a>
            </li>
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

                <!--content-->
                <div class="card-tools bg-white">
                    <div id="select" title="Select" class="btn-group py-1 px-1 br-3">
                        <input title="Select" class="radio py-1 px-1 br-3" type="checkbox" name="select" />
                        <a title="Select" class="dropdown-toggle py-1 px-1 br-3" href="javascript:void(0)" data-toggle="dropdown" aria-expanded="false">
                            <span class="caret mb-2"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a name="all" tabindex="-1" href="javascript:void(0)">All</a>
                            </li>
                            <li>
                                <a name="none" tabindex="-1" href="javascript:void(0)">None</a>
                            </li>

                        </ul>
                    </div>
                    <div id="refresh" title="Refresh" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Refresh">
                            <i class="fas fa-redo-alt"></i>
                        </a>
                    </div>
                    <div id="delete" title="Delete" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Delete">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </div>
                    <div class="btn-group ml-3">
                        <p name="cItem" class="text-gray-900 my-0"></p>
                    </div>
                </div>
                <div id="aline" class="card-tools-body bg-white" name="article">
                    <div class="aline">
                        <div class="col-1">
                            <input class="radio" type="checkbox" name="categories" />
                        </div>
                        <div class="col-5">
                            <a class="text-gray-900 " href="#">[Stack] Postfix to Infix</a>
                        </div>
                        <div class="col-2">
                            <a class="ml-1 text-gray-900" name="subject">Stack</a>
                        </div>
                        <div class="col-1">
                            <a class="ml-1 text-gray-900" name="status">Published</a>
                        </div>
                        <div class="col-1">
                            <a class="ml-1" href="#">-------</a>
                        </div>
                        <div class="col-2">
                            <p class="ml-1 mt-0 mb-0">Published: 03/11/2019</p>
                        </div>
                    </div>
                    <div class="aline">
                        <div class="col-1">
                            <input class="radio" type="checkbox" name="categories" />
                        </div>
                        <div class="col-5">
                            <a class="text-gray-900" href="#">[Stack] Postfix to Infix</a>
                        </div>
                        <div class="col-2">
                            <a class="ml-1 text-gray-900" name="subject">Stack</a>
                        </div>
                        <div class="col-1">
                            <a class="ml-1 text-gray-900" name="status">Repair</a>
                        </div>
                        <div class="col-1">
                            <a class="ml-1" href="#">-------</a>
                        </div>
                        <div class="col-2">
                            <p class="ml-1 mt-0 mb-0"></p>
                        </div>
                    </div>
                    <div class="aline">
                        <div class="col-1">
                            <input class="radio" type="checkbox" name="categories" />
                        </div>
                        <div class="col-5">
                            <a class="text-gray-900" href="#">[BFS]- SPOJ ONP - Tranfer the expression - infix to Posfix</a>
                        </div>
                        <div class="col-2">
                            <a class="ml-1 text-gray-900" name="subject">BFS - DFS, C++, đồ thị, thuật toán</a>
                        </div>
                        <div class="col-1">
                            <a class="ml-1 text-gray-900" name="status">Published</a>
                        </div>
                        <div class="col-1">
                            <a class="ml-1" href="#">-------</a>
                        </div>
                        <div class="col-2">
                            <p class="ml-1 mt-0 mb-0">Published: 03/11/2019</p>
                        </div>
                    </div>
                    <div class="aline">
                        <div class="col-1">
                            <input class="radio" type="checkbox" name="categories" />
                        </div>
                        <div class="col-5">
                            <a class="text-gray-900" href="#">[Stack] Postfix to Infix</a>
                        </div>
                        <div class="col-2">
                            <a class="ml-1 text-gray-900" name="subject">Stack</a>
                        </div>
                        <div class="col-1">
                            <a class="ml-1 text-gray-900" name="status">Erased</a>
                        </div>
                        <div class="col-1">
                            <a class="ml-1" href="#">-------</a>
                        </div>
                        <div class="col-2">
                            <p class="ml-1 mt-0 mb-0"></p>
                        </div>
                    </div>
                    

                    <!--footer-->
                    <footer class="sticky-footer bg-white mt-auto">
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

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/admin-writer.js"></script>
    <script src="../js/editor.js"></script>
    
</body>
</html>
