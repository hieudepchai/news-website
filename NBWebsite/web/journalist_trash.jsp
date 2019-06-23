<%-- 
    Document   : journalist_trash
    Created on : May 30, 2019, 11:03:12 PM
    Author     : quan1
--%>
<%@ include file="/init.jsp" %> 
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Trash</title>

     <%@ include file="/css.jsp" %>
     <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body id="page-top">
    <jsp:include page="/journalist_header.jsp" flush="true"/>

    <div id="wrapper">
        <jsp:include page="/journalist_navMenu.jsp" flush="true"/>
        <div id="content-wrapper" class="d-flex flex-row">
            <div id="content">
                <div class="card-tools bg-white d-flex">
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
                            <li>
                                <a name="starred" tabindex="-1" href="javascript:void(0)">Starred</a>
                            </li>
                            <li>
                                <a name="unstarred" tabindex="-1" href="javascript:void(0)">Unstarred</a>
                            </li>
                        </ul>
                    </div>
                    <div id="delForever" class="btn-group py-1 px-2 br-3">
                        <a class="text-gray-900">
                            Delete forever
                        </a>
                    </div>                   
                    <div id="revert" title="Mark as unread" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Revert">
                            <i class="fas fa-history"></i>
                        </a>
                    </div>
                    <div class="toolbar-divider"></div>
                    <div id="refresh" title="Refresh" class="btn-group py-1 px-2 br-50">
                        <a class="text-gray-900" title="Refresh">
                            <i class="fas fa-redo-alt"></i>
                        </a>
                    </div>
                    <div class="ml-auto">
                        <div class="btn-group ml-3 mt-1">
                            <p name="nItems" class="text-gray-600 my-0"></p>
                        </div>
                        <div id="pre" title="Older" class="btn-group py-1 px-2 br-50">
                            <a class="text-gray-600" title="Older">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </div>
                        <div id="next" title="Newer" class="btn-group py-1 px-2 br-50">
                            <a class="text-gray-600" title="Newer">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div id="aline" class="card-tools-body-inbox">
                    <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
                        <c:forEach items="${sessionScope.listArticle}" var="item">
                            <c:if test="${item.getTrash() == 1}">
                        <div class="aline">
                            <div class="col-1">
                                <input class="radio" type="checkbox" name="categories" />
                                <input type="hidden" name="ArticleID" value="${item.getArticleID()}" />
                            </div>
                            <div class="col-5">
                                <a name="heading" class="text-gray-900 " href="javascript:void(0)">${item.getHeading()}</a>
                            </div>
                            <div class="col-2">
                                    <c:choose >
                                        <c:when test = "${item.getSubCategoryID() != 0}">
                                            <a class="ml-1 text-gray-900" name="subject">${cate.get(item.getCategoryID())}, ${cate.get(item.getSubCategoryID())}</a>                                            
                                        </c:when>
                                        <c:otherwise>
                                            <a class="ml-1 text-gray-900" name="subject">${cate.get(item.getCategoryID())}</a>                                            
                                        </c:otherwise>
                                    </c:choose>
                                
                            </div>
                            <div class="col-1">
                                <a class="ml-1 text-gray-900" name="status">Trash</a>
                            </div>
                            <div class="col-1">
                                <a class="ml-1" href="#">
                                    <i class="iconCommentArticle fas fa-comment"></i>
                                    <span class="NumberCommentArticle">0</span>
                                </a>
                            </div>
                            <div class="col-2">
                                
                                <c:choose>
                                    <c:when test = "${item.getCensored() == 1}">
                                        <p class="ml-1 mt-0 mb-0">Published: <br> <c:out value = "${item.getLastModified()}"/></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="ml-1 mt-0 mb-0">Last modified: <br> <c:out value = "${item.getLastModified()}"/></p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>     
                            </c:if>
                        </c:forEach>
                    
                    <!--footer-->
                    <footer class="sticky-footer bg-white my-1">
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

    
    <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>

    <script src="${pageContext.request.contextPath}/js/editor.js"></script>
    <script>
        $(document).ready(function(){
            $("#accordionSidebar li[name = dropdown]").addClass("active"); 
            $("#trash").addClass("active"); 
            var nArticle = $(".aline:visible");
            if (nArticle.length < 8){
                $("footer").addClass("bottom-fixed");
            } else{
                $("footer").removeClass("bottom-fixed");
            }
        });
        
    $("#delForever").click(function () {
        var listArticleID = new Array();
        $.each($(".aline > div > input:checked").next(), function(){
            listArticleID.push($(this).val());
        });

        $.ajax({
            type: "post",
            encType : "multipart/form-data",
            url : "${pageContext.request.contextPath}/manage/journalist/Trash",
            cache : false,
            processData : false,
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            data: jQuery.param({
                jsonDel: listArticleID
            }),
                        
            success: function(){
                $(".aline > div > input:checked").parentsUntil("#aline").remove();
                var nItems = $(".aline:visible").length;
                $('p[name = cItem]').text(nItems + " Items");    
            },
            error : function(msg) {
                alert("Couldn't delete file, error: " + msg);
            }
        });
       
    });
    
    $("#revert").click(function () {
        var listArticleID = new Array();
        $.each($(".aline > div > input:checked").next(), function(){
            listArticleID.push($(this).val());
        });

        $.ajax({
            type: "post",
            encType : "multipart/form-data",
            url : "${pageContext.request.contextPath}/manage/journalist/Trash",
            cache : false,
            processData : false,
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            data: jQuery.param({
                jsonRevert: listArticleID
            }),
                        
            success: function(){
                $(".aline > div > input:checked").parentsUntil("#aline").remove();
                var nItems = $(".aline:visible").length;
                $('p[name = cItem]').text(nItems + " Items");    
            },
            error : function(msg) {
                alert("Couldn't delete file, error: " + msg);
            }
        });
       
    });
    </script>
    
</body>
</html>
