<%-- 
    Document   : journalist_navMenu
    Created on : Jun 2, 2019, 9:27:25 AM
    Author     : quan1
--%>
<%@ include file="/init.jsp" %> 
    <ul id="accordionSidebar" class="navbar-nav bg-gradient-primary sidebar sidebar-dark">

            <li class="nav-item my-1" name="dashboard">
                <a class="nav-link" href="${pageContext.request.contextPath}/manage/journalist">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span class="mx-3">Dashboard</span>
                </a>
            </li>
            <hr class="sidebar-divider" />
            <li class="nav-item" name="dropdown">
                <a name="dropdownAr" class="nav-link collapsed" aria-controls="collapseTwo" data-target="#collapseTwo" data-toggle="collapse">
                    <i class="fas fa-newspaper"></i>
                    <span class="mx-3">Article</span>
                </a>

            </li>
            <li class="nav-item d-none" name="article" id="compose">
                <a class="nav-link pl-4" href="${pageContext.request.contextPath}/manage/journalist/compose">
                    <i class="fas fa-fw fa-feather-alt"></i>
                    <span class="mx-2">Compose</span>
                </a>
            </li>
            <li class="nav-item d-none" name="article" id="listofarticle">
                <a class="nav-link pl-4" href="${pageContext.request.contextPath}/manage/journalist/List-of-Articles">
                    <i class="fas fa-fw fa-list-alt"></i>
                    <span class="mx-2">List of articles</span>
                </a>
            </li>
            <li class="nav-item d-none" name="article" id="trash">
                <a class="nav-link pl-4" href="${pageContext.request.contextPath}/manage/journalist/Trash">
                    <i class="fas fa-trash-alt"></i>
                    <span class="mx-2">Trash</span>
                </a>
            </li>
            <li class="nav-item" name="libary">
                <a class="nav-link" href="${pageContext.request.contextPath}/manage/journalist/libary">
                    <i class="fas fa-image"></i>
                    <span class="mx-3">Libary</span>
                </a>
            </li>
            <li class="nav-item" name="comments">
                <a class="nav-link" href="${pageContext.request.contextPath}/manage/journalist/comments">
                    <i class="fas fa-inbox"></i>
                    <span class="mx-2">Comments</span>
                </a>
            </li>            
            <hr class="sidebar-divider" />
            <c:set var="ProfilePicSrc" value="${sessionScope.CurrentAccount.getProfilePicture()}"/>
            <li class="nav-item">
                <a class="nav-link d-flex" href="${pageContext.request.contextPath}/manage/journalist/Profile-information">
                    <div class="img-profile">                    
                    <c:choose>
                        <c:when test="${ProfilePicSrc != null}">
                            <img class="rounded-circle" src="${pageContext.request.contextPath}/${ProfilePicSrc}">
                            <div class="status-indicator bg-success"></div>
                        </c:when>
                        <c:when test="${ProfilePicSrc == null}">
                            <img class="rounded-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                            <div class="status-indicator bg-success"></div>
                        </c:when>
                    </c:choose>                                               
                    </div>
                    <span class="text-gray-900 ml-2 mt-2">${sessionScope.CurrentAccount.getFirstName()} ${sessionScope.CurrentAccount.getLastName()}</span>
                </a>
            </li>
        </ul>
