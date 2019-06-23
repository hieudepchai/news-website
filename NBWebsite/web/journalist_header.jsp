<%-- 
    Document   : journalist_header
    Created on : Jun 2, 2019, 9:25:56 AM
    Author     : quan1
--%>
<%@ include file="/init.jsp" %> 
    <nav class="navbar navbar-expand bg-white topbar static-top">
        <div class="topbar-brand d-flex align-items-center">
            <a title="Main menu" class="topbar-brand-icon br-50 px-3 py-2" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </a>
            <div class="topbar-brand-text mx-1">
                <img src="/NBWebsite/img/logo1.png"/>
            </div>
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
                        Notifications
                    </h6>
                    <div class="notify" id="notify">
                        <c:set var="topicImage" value="${sessionScope.TopicImageMap}"/>
                        <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
                                <c:forEach var="notify" items="${sessionScope.listNotification}">
                                    <c:choose>
                                        <c:when test="${notify.getKey() == 10 && notify.getValue().getCategory2() != 0}">
                                            <div class="">
                                                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/articles/${cate.get(notify.getValue().getCategory1())}/${cate.get(notify.getValue().getCategory2())}/${notify.getValue().getArticleID()}">
                                                    <div class="mr-3">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <div class="text-gray-900 text-break pr-1">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <span class="medium">published your article. </span>
                                                            
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-user-edit"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-600 small" name="time">${notify.getValue().getTime()}</span>
                                                            </div>
                                                    </div>
                                                            <div class="ml-auto">
                                                                <img class="" src="${pageContext.request.contextPath}/${topicImage.get(notify.getValue().getArticleID())}" style="max-height: 50px;"/>
                                                            </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 10 && notify.getValue().getCategory2() == 0}">
                                            <div class="">
                                                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/articles/${cate.get(notify.getValue().getCategory1())}/${notify.getValue().getArticleID()}">
                                                    <div class="mr-3">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <div class="text-gray-900 text-break pr-1">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <span class="medium">published your article. </span>
                                                            
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-user-edit"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-600 small" name="time">${notify.getValue().getTime()}</span>
                                                            </div>
                                                    </div>
                                                            <div class="ml-auto">
                                                                <img class="" src="${pageContext.request.contextPath}/${topicImage.get(notify.getValue().getArticleID())}" style="max-height: 50px;"/>
                                                            </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 7}">
                                            <div class="">
                                                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/manage/journalist/Trash">
                                                     <div class="mr-3">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <div class="text-gray-900 text-break pr-1">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <span class="medium">moved your article to trash. </span>
                                                            
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-user-edit"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-600 small" name="time">${notify.getValue().getTime()}</span>
                                                            </div>
                                                    </div>
                                                            <div class="ml-auto">
                                                                <img class="" src="${pageContext.request.contextPath}/${topicImage.get(notify.getValue().getArticleID())}" style="max-height: 50px;"/>
                                                            </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 11}">
                                            <div class="">
                                                <a class="dropdown-item d-flex align-items-center">
                                                     <div class="mr-3">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <div class="text-gray-900 text-break pr-1">
                                                            <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                            <span class="medium">sent a feedback about your article </span>
                                                            
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-comment-dots"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-600 small" name="time">${notify.getValue().getTime()}</span>
                                                            </div>
                                                    </div>
                                                            <div class="ml-auto">
                                                                <img class="" src="${pageContext.request.contextPath}/${topicImage.get(notify.getValue().getArticleID())}" style="max-height: 50px;"/>
                                                            </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 12 && notify.getValue().getCategory2() != 0}">
                                            <div class="">
                                                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/articles/${cate.get(notify.getValue().getCategory1())}/${cate.get(notify.getValue().getCategory2())}/${notify.getValue().getArticleID()}">
                                                     <div class="mr-3">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <div class="text-gray-900 text-break pr-1">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getLevel() == 1}">
                                                                <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                                <span class="medium"> commented on an your article. </span>
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getLevel() == 2}">
                                                                <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                                <span class="medium"> replied on an your comment. </span>
                                                            </c:when>
                                                        </c:choose>
            
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-book-reader"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-600 small" name="time">${notify.getValue().getTime()}</span>
                                                            </div>
                                                    </div>
                                                            <div class="ml-auto">
                                                                <img class="" src="${pageContext.request.contextPath}/${topicImage.get(notify.getValue().getArticleID())}" style="max-height: 50px;"/>
                                                            </div>
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:when test="${notify.getKey() == 12 && notify.getValue().getCategory2() == 0}">
                                            <div class="">
                                                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/articles/${cate.get(notify.getValue().getCategory1())}/${notify.getValue().getArticleID()}">
                                                     <div class="mr-3">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() != null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/${notify.getValue().getAccountProfileImg()}">
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getAccountProfileImg() == null}">
                                                                <img class="icon-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <div class="text-gray-900 text-break pr-1">
                                                        <c:choose>
                                                            <c:when test="${notify.getValue().getLevel() == 1}">
                                                                <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                                <span class="medium"> commented on an your article. </span>
                                                            </c:when>
                                                            <c:when test="${notify.getValue().getLevel() == 2}">
                                                                <span class="my-0 medium font-weight-bold">${notify.getValue().getFirstName()} ${notify.getValue().getLastName()}</span>
                                                                <span class="medium"> replied on an your comment. </span>
                                                            </c:when>
                                                        </c:choose>
            
                                                            <div class="d-flex mt-1">
                                                                <div class="rounded-circle bg-primary icon-reader">
                                                                    <i class="fas fa-book-reader"></i>
                                                                </div>
                                                                <span class="ml-2 text-gray-600 small" name="time">${notify.getValue().getTime()}</span>
                                                            </div>
                                                    </div>
                                                            <div class="ml-auto">
                                                                <img class="" src="${pageContext.request.contextPath}/${topicImage.get(notify.getValue().getArticleID())}" style="max-height: 50px;"/>
                                                            </div>
                                                </a>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>

                    </div>
                       
                    <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/manage/journalist/notifications">Show All Alerts</a>
                </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>
                      
            <c:set var="ProfilePicSrc" value="${sessionScope.CurrentAccount.getProfilePicture()}"/>
            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-3 d-none d-lg-inline text-gray-800 small">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</span>
                    <c:choose>
                        <c:when test="${ProfilePicSrc != null}">
                            <img class="rounded-circle img-profile" src="${pageContext.request.contextPath}/${ProfilePicSrc}">
                        </c:when>
                        <c:otherwise>
                            <img class="rounded-circle img-profile" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                        </c:otherwise>
                    </c:choose>
<!--                    <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">-->
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-btn dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="javascript:void(0)">
                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                        Settings
                    </a>
                    <a class="dropdown-item" href="javascript:void(0)">
                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                        Activity Log
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="javascript:void(0)" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </a>
                </div>
            </li>
        </ul>
    </nav>
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
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/manage/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        $("#alertsDropdown").click(function(){
//            $('#notify').children().remove();
           $.ajax({
            type: "post",
            encType : "multipart/form-data",
            url : "${pageContext.request.contextPath}/manage/journalist/notifications",
            cache : false,
            processData : false,
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            data: jQuery.param({
                
            }),
                        
            success: function(responseJson){
                var index = 0;
                $.each(responseJson, function(key, value){
                    var key1 = value['key'];                   
                    if(typeof key1 === 'undefined'){
                        $('#notify').children().eq(index).children().children().eq(1).children().eq(2).children("span[name = time]").text(value);
                        index++;
                       
                    }else{
                        var value1 = value['value'];
                    
                    if(key1 === 5)
                        return;
                    
                    var div = $('<div/>').prependTo($('#notify'));
                    var a = $('<a/>', {
                            class: "dropdown-item d-flex align-items-center",
                            href: "javascript:void(0)"
                        }).appendTo(div);
                    var div1 = $('<div/>', {
                        class:"mr-3"
                    }).appendTo(a);    
                    if(value1['AccountProfileImg'] === null){
                        $('<img/>', {
                            src: "${pageContext.request.contextPath}/img/profilepic/pric1.png",
                            class:"icon-circle"
                        }).appendTo(div1); 
                    }else if(value1['AccountProfileImg'] !== null){
                        $('<img/>', {
                            src: "${pageContext.request.contextPath}/" + value1['AccountProfileImg'],
                            class:"icon-circle"
                        }).appendTo(div1); 
                    }
                    
                    var div2 = $('<div/>', {
                        class:"text-gray-900 text-break pr-1"
                    }).appendTo(a);
                    
                    if(key1 === 10){
                        $('<span />',{
                            class:'my-0 medium font-weight-bold mr-1' , 
                            html: value1['FirstName'] + ' ' + value1['LastName']
                        }).appendTo(div2);
                        
                        $('<span />',{
                            class:'medium' , 
                            html: 'published your article.'
                        }).appendTo(div2);
                        
                        var div21 = $('<div/>', {
                            class:"d-flex mt-1"
                        }).appendTo(div2);
                        
                        var div211 = $('<div/>', {
                            class:"rounded-circle bg-primary icon-reader"
                        }).appendTo(div21);
                        div211.append('<i class="fas fa-user-edit"></i>');
                        
                        $('<span />',{
                            class:'ml-2 text-gray-600 small' , 
                            html: value1['Time']
                        }).appendTo(div21);
                    }else if(key1 === 7){
                        $('<span />',{
                            class:'my-0 medium font-weight-bold mr-1' , 
                            html: value1['FirstName'] + ' ' + value1['LastName']
                        }).appendTo(div2);
                        
                        $('<span />',{
                            class:'medium' , 
                            html: 'moved your article to trash.'
                        }).appendTo(div2);
                        
                        var div21 = $('<div/>', {
                            class:"d-flex mt-1"
                        }).appendTo(div2);
                        
                        var div211 = $('<div/>', {
                            class:"rounded-circle bg-primary icon-reader"
                        }).appendTo(div21);
                        div211.append('<i class="fas fa-user-edit"></i>');
                        
                        $('<span />',{
                            class:'ml-2 text-gray-600 small' , 
                            html: value1['Time']
                        }).appendTo(div21);
                    }else if(key1 === 11){
                        $('<span />',{
                            class:'my-0 medium font-weight-bold mr-1' , 
                            html: value1['FirstName'] + ' ' + value1['LastName']
                        }).appendTo(div2);
                        
                        $('<span />',{
                            class:'medium' , 
                            html: 'sent a feedback about your article'
                        }).appendTo(div2);
                        
                        var div21 = $('<div/>', {
                            class:"d-flex mt-1"
                        }).appendTo(div2);
                        
                        var div211 = $('<div/>', {
                            class:"rounded-circle bg-primary icon-reader"
                        }).appendTo(div21);
                        div211.append('<i class="fas fa-comment-dots"></i>');
                        
                        $('<span />',{
                            class:'ml-2 text-gray-600 small' , 
                            html: value1['Time']
                        }).appendTo(div21);
                    }else if(key1 === 12){
                        $('<span />',{
                            class:'my-0 medium font-weight-bold mr-1' , 
                            html: value1['FirstName'] + ' ' + value1['LastName']
                        }).appendTo(div2);
                        
                        $('<span />',{
                            class:'medium' , 
                            html: 'commented on an your article'
                        }).appendTo(div2);
                        
                        var div21 = $('<div/>', {
                            class:"d-flex mt-1"
                        }).appendTo(div2);
                        
                        var div211 = $('<div/>', {
                            class:"rounded-circle bg-primary icon-reader"
                        }).appendTo(div21);
                        div211.append('<i class="fas fa-book-reader"></i>');
                        
                        $('<span />',{
                            class:'ml-2 text-gray-600 small' , 
                            html: value1['Time']
                        }).appendTo(div21);
                    }
                    
                    var div3 = $('<div/>', {
                        class:"ml-auto"
                    }).appendTo(a);
                    $('<img/>', {
                            src: "${pageContext.request.contextPath}/" + value1['TopicImage'],
                            style: "max-height: 50px;"
                        }).appendTo(div3); 
                    }
                });
                    
            },
            error: function(msg) {
                alert("Couldn't delete file, error: " + msg);
            }
        }); 
        });
    </script>            