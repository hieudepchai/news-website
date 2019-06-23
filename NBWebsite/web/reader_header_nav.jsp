<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
    <!-- Top Header -->
    <div id="top-header">
        <div class="container">
            <div class="header-social">
                <ul>
                    <li id="header-date"></li>
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                </ul>
            </div>
            <c:set var="CurrentReader" value="${sessionScope.CurrentReader}" />
            <c:choose>

                <c:when test="${CurrentReader!=null}">
                    <div class="header-links logged-acc-container">
                        <ul class="signup-login-list" style="display:none">
                            <li id="sign-up-txt"><a href="#/"><i class="fa fa-user-plus"></i>Sign Up</a></li>
                            <li id="log-in-txt"><a href="#"><i class="fa fa-sign-in"></i> Login</a></li>
                        </ul>
                        <a href="">
                            <div class="logged-acc">
                                <div class="logged-acc-name">
                                    <c:out value="${CurrentReader.getFirstName()}"></c:out>
                                    <c:out value="${CurrentReader.getLastName()}"></c:out>
                                </div>
                                <div class="logged-acc-img">
                                    <c:set var="ProfilePicSrc" value="${CurrentReader.getProfilePicture()}" />
                                    <c:choose>
                                        <c:when test="${ProfilePicSrc!=null}">
                                            <img class="img-profile rounded-circle"
                                                 src="${pageContext.request.contextPath}/${ProfilePicSrc}">
                                        </c:when>
                                        <c:when test="${ProfilePicSrc== null}">
                                            <img class="img-profile rounded-circle"
                                                 src="${pageContext.request.contextPath}/img/user_pro_pic.png">
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                        <div class="logged-acc-collapse">
                            <ul>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/profile"> <i class="fa fa-user"></i> Profile</a>
                                </li>
                                <div class="dropdown-divider"></div>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/rlogout">
                                        <i class="fa fa-sign-out"></i>
                                        Log out
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:when>
                <c:when test="${CurrentReader==null}">
                    <div class="header-links logged-acc-container">
                        <ul class="signup-login-list">
                            <li id="sign-up-txt"><a href="#/"><i class="fa fa-user-plus"></i>Sign Up</a></li>
                            <li id="log-in-txt"><a href="#"><i class="fa fa-sign-in"></i> Login</a></li>
                        </ul>
                    </div>
                </c:when>


            </c:choose>


            <div id="sign-up-container" class="fullscreen-container">
                <div id="sign-up" class="form-popup">
                    <div id="sign-up-header" class="form-popup-header">
                        <h3>Sign Up</h3>
                        <a class="close-btn" href="#/"><i class="fa fa-times"></i></a>
                    </div>

                    <form class="form-horizontal sign-up-form form-popup-form" role="form" id="signup-form"
                          action="${pageContext.request.contextPath}/signup" method="POST">
                        <div class="form-group">
                            <label for="username" class=" control-label">Username</label>
                            <div class="">
                                <input type="text" id="signup-username" placeholder="Username" class="form-control"
                                       name="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-signup-password" class=" control-label">Password*</label>
                            <div class="">
                                <input type="password" name="Password" id="signup-password" placeholder="Password"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input-repassword" class=" control-label">Confirm Password*</label>
                            <div class="">
                                <input type="password" id="input-repassword" placeholder="Password"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstName" class=" control-label">First Name</label>
                            <div class="">
                                <input type="text" id="signup-firstname" name="FirstName" placeholder="First Name"
                                       class="form-control" autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastName" class=" control-label">Last Name</label>
                            <div class="">
                                <input type="text" id="signup-lastname" name="LastName" placeholder="Last Name"
                                       class="form-control" autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class=" control-label">Email* </label>
                            <div class="">
                                <input type="email" id="signup-email" name="Email" placeholder="Email"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class=" control-label">Phone number </label>
                            <div class="">
                                <input type="text" id="signup-phone" name="Phone" placeholder="Phone number"
                                       class="form-control">
                            </div>
                        </div>
                        <div id="loader1" class=""></div>
                        <h4 style="text-align: center" id="SignupResult"></h4>
                        <!-- /.form-group -->
                        <div class='btn-container'>
                            <button id="sign-up-btn" type="button"
                                    class="btn btn-primary btn-block form-popup-btn">Sign Up</button>
                        </div>
                        <hr>

                        <div class="sign-up-here">
                            <span>Have an account yet?<a href="#/" id="login-here">Log in here</a></span>
                        </div>
                    </form> <!-- /form -->
                </div>
            </div>
            <div id="login-container" class="fullscreen-container">
                <div id="sign-up" class="form-popup">
                    <div id="login-header" class="form-popup-header">
                        <h3>Log In</h3>
                        <a class="close-btn" href="#/"><i class="fa fa-times"></i></a>
                    </div>

                    <form class="form-horizontal sign-up-form form-popup-form" id="login-form" role="form"
                          action="${pageContext.request.contextPath}/rlogin">
                        <div class="form-group">
                            <label for="input-username-email" class=" control-label">Username</label>
                            <div class="">
                                <input type="text" id="login-username" placeholder="Username" class="form-control"
                                       name="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class=" control-label">Password*</label>
                            <div class="">
                                <input type="password" id="login-password" name="Password" placeholder="Password"
                                       class="form-control">
                            </div>
                        </div>
                        <div id="loader2" class=""></div>
                        <h4 style="text-align: center" id="LoginResult"></h4>
                        <!-- /.form-group -->
                        <div class='btn-container'>
                            <button id="login-btn" type="button"
                                    class="btn btn-primary btn-block form-popup-btn">Login</button>
                        </div>

                        <hr>

                        <div class="sign-up-here">
                            <span>Don't have any accounts?<a href="#/" id="signup-here">Sign up here</a></span>
                        </div>
                    </form> <!-- /form -->

                </div>
            </div>
        </div>
    </div>
    <!-- /Top Header -->

    <!-- Center Header -->
    <div id="center-header">
        <div class="container">
            <div class="header-logo">
                <a href="${pageContext.request.contextPath}/" class="logo"><img src="${pageContext.request.contextPath}/img/logo1.png" alt=""></a>
            </div>
            <div class="header-ads">
                <img class="center-block" src="${pageContext.request.contextPath}/img/ad-2.jpg" alt="">
            </div>
        </div>
    </div>
    <!-- /Center Header -->

    <!-- Nav Header -->
    <div id="nav-header">
        <div class="container">
            <nav id="main-nav">
                <div class="nav-logo">
                    <a href="#" class="logo"><img src="./img/logo-alt.png" alt=""></a>
                </div>
                <ul class="main-nav nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/articles/News">News</a></li>
                    <li><a href="${pageContext.request.contextPath}/articles/World">World</a></li>
                    <li><a href="${pageContext.request.contextPath}/articles/Business">Business</a></li>
                    <li><a href="${pageContext.request.contextPath}/articles/Education">Education</a></li>
                    <li><a href="${pageContext.request.contextPath}/articles/Entertainment">Entertainment</a></li>
                    <li><a href="${pageContext.request.contextPath}/articles/Sport">Sport</a></li>
                    <li><a href="${pageContext.request.contextPath}/articles/Technology">Technology</a></li>
                    <li><a href="${pageContext.request.contextPath}/articles/Travel">Travel</a></li>
                </ul>
            </nav>
            <div class="button-nav">
                <button class="search-collapse-btn"><i class="fa fa-search"></i></button>
                <button class="nav-collapse-btn"><i class="fa fa-bars"></i></button>
                <div class="search-form">
                    <form>
                        <input class="input" type="text" name="search" placeholder="Search">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /Nav Header -->
    <!-- sub menu -->
    <div id="sub-nav-section">
        <div class="container sub-nav">
            <div class="current-cat">
                <a href="${pageContext.request.contextPath}/articles/${param.category}">${param.category}</a>
            </div>
            <c:if test="${param.category !='News'}">
                <ul class="sub-nav-list">
                    <c:forEach var="subcat" items="${SubCatID}">
                        <c:if test="${subcat!=0}">
                            <li><a
                                    href="${pageContext.request.contextPath}/articles/${param.category}/${CatBiMap.getForward(subcat)}">${CatBiMap.getForward(subcat)}</a>
                            </li>

                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>

        </div>
    </div>
    <!-- /sub menu -->
</header>