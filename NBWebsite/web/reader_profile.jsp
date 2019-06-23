<%-- 
    Document   : reader_profile
    Created on : Jun 6, 2019, 4:02:45 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${CurrentReader.getFirstName()} ${CurrentReader.getLastName()}'s Profile</title>
        <jsp:include page="reader_css.jsp"/>
        <link type="text/css" rel="stylesheet" href="${contextpath}/css/profile.css" />
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="reader_header_nonav.jsp"/>
        <!--/Header -->
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <c:set var="ProfilePicSrc" value="${CurrentReader.getProfilePicture()}"/>
                        <c:choose>
                            <c:when test="${ProfilePicSrc!=null}">
                                <img src="${contextpath}/${ProfilePicSrc}" class="avatar img-circle img-thumbnail" alt="avatar">
                            </c:when>
                            <c:when test="${ProfilePicSrc== null}">
                                <img src="${contextpath}/img/user_pro_pic.png" class="avatar img-circle img-thumbnail" alt="avatar">
                            </c:when>
                        </c:choose>
                        <div id="upload">
                            <h4>Change your profile picture: </h4>
                            <a href="#/" id="open-file">Choose a file ...</a>                     
                        </div>
                    </div>
                    <div class="col-md-9">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#profile-tab"><b>Porfile Settings</b></a></li>
                            <li><a data-toggle="tab" href="#bookmark-tab"><b>Bookmarks</b></a></li>
                            <li><a data-toggle="tab" href="#comment-tab"><b>Comments</b></a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="profile-tab" class="tab-pane fade in active">
                                <h3>Profile Information</h3>
                                <form id="profile-form" enctype='multipart/form-data'>
                                    <div class="form-group">                               
                                        <h4>Username</h4>
                                        <input type="text" class="form-control" id="inputUsername" disabled="" value="${CurrentReader.getUsername()}">
                                    </div>                               
                                    <div class="form-group">                               
                                        <h4>Email</h4>
                                        <input type="email" class="form-control" id="inputEmail" name="Email" value="${CurrentReader.getEmail()}">                                     
                                    </div>
                                    <div class="form-group">                                     
                                        <h4>First name</h4>
                                        <input type="text" class="form-control" id="inputFirstName" name="FirstName" value="${CurrentReader.getFirstName()}">                                     
                                    </div>
                                    <div class="form-group">                                       
                                        <h4>Last name</h4>
                                        <input type="text" class="form-control" id="inputLastName" name="LastName" value="${CurrentReader.getLastName()}">                                   
                                    </div>
                                    <div class="form-group">                                   
                                        <h4>Phone Number</h4>
                                        <input type="text" class="form-control" id="inputPhone" name="Phone" value="${CurrentReader.getPhone()}">         
                                    </div>
                                    <div id="profile-res">

                                    </div>
                                    <div class="btn-div">
                                        <button type="button" class="btn btn-default" id="mybtn-save"><b>Save</b></button>
                                    </div>

                                    <input type="file" id="inputProfilePicture" name="ProfilePicture">
                                    <input type="hidden" id="inputHidden" name="fakePP">
                                    <input type="hidden" name="mode" value="save" >
                                    <input type="hidden" name="Username"  value="${CurrentReader.getUsername()}">
                                </form>
                                <hr>
                                <h3>Reset Password</h3>
                                <form id="pw-form">
                                    <div class="form-group">                               
                                        <h4>Current Password</h4>
                                        <input type="password" class="form-control" name="CurrentPassword">
                                    </div>                               
                                    <div class="form-group">                               
                                        <h4>New Password</h4>
                                        <input type="password" class="form-control" name="Password" id="inputPassword" >                                     
                                    </div>
                                    <div class="form-group">                                     
                                        <h4>Re-enter Password</h4>
                                        <input type="password" class="form-control" name="rePassword" id="inputRePassword">                                     
                                    </div>    
                                    <div id="loader"></div>
                                    <div id="pw-res">
                                    </div>
                                    
                                    <div class="btn-div">
                                        
                                        <button type="button" class="btn btn-default" id="mybtn-reset"  ><b>Reset</b></button>
                                    </div>
                                    <input type="hidden" name="mode" value="reset">
                                </form>
                            </div>
                            <div id="bookmark-tab" class="tab-pane fade">
                                <h3>Bookmark Log</h3>  
                                <c:set var="alBM" value="${sessionScope.bmLib.getAllBookmark()}"/>
                                   <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Article</th>
                                            <th>Title</th>
                                            <th>Time</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="bm" items="${alBM}">
                                            <tr>
                                                <td>
                                                    <c:if test="${cmt.getSubCategoryID()!=0}">
                                                        <a href="${contextpath}/articles/${CatBiMap.getForward(bm.getCategoryID())}/${CatBiMap.getForward(bm.getSubCategoryID())}/${bm.getArticleID()}">${bm.getHeading()}</a>
                                                    </c:if>
                                                    <c:if test="${cmt.getSubCategoryID()==0}">
                                                        <a href="${contextpath}/articles/${CatBiMap.getForward(bm.getCategoryID())}/${bm.getArticleID()}">${bm.getHeading()}</a>
                                                    </c:if>
                                                </td>
                                                <td>
                                                   ${bm.getTitle()}
                                                </td>
                                                <td>${bm.getDateCreated()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>   
                    
                                                           
                            </div>
                            <div id="comment-tab" class="tab-pane fade">
                                <h3>Comment Log</h3> 
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Article</th>
                                            <th>Content</th>
                                            <th>Time</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cmt" items="${alAccountCmt}">
                                            <tr>
                                                <td>
                                                    <c:if test="${cmt.getSubCategoryID()!=0}">
                                                        <a href="${contextpath}/articles/${CatBiMap.getForward(cmt.getCategoryID())}/${CatBiMap.getForward(cmt.getSubCategoryID())}/${cmt.getArticleID()}">${cmt.getHeading()}</a>
                                                    </c:if>
                                                    <c:if test="${cmt.getSubCategoryID()==0}">
                                                        <a href="${contextpath}/articles/${CatBiMap.getForward(cmt.getCategoryID())}/${cmt.getArticleID()}">${cmt.getHeading()}</a>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    ${cmt.getContent()}
                                                </td>
                                                <td>${cmt.getDateCreated()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>   
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <jsp:include page="reader_footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="reader_js.jsp"/>
        <script src="${contextpath}/js/profile.js"></script>
    </body>
</html>
