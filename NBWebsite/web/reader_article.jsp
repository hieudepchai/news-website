<%-- 
    Document   : reader_article
    Created on : Jun 1, 2019, 2:35:54 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${currArt.getHeading()}</title>
        <jsp:include page="reader_css.jsp"/>
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/post.css" />
    </head>

    <body>
        <c:set var="CatBiMap" value="${sessionScope.CatBiMap}" />
        <c:set var="CatMap" value="${CatBiMap.getForwardMap()}" />
        <c:set var="contextpath" value="${pageContext.request.contextPath}" />
        <!-- Header -->
        <jsp:include page="reader_header_nav.jsp"/>
        <!-- /Header -->

        <!-- SECTION -->
        <div class="section">
            <!-- CONTAINER -->
            <div class="container">
                <!-- ROW -->
                <div class="row">
                    <!-- Main Column -->
                    <div class="col-md-8">
                        <!-- ARTICLE POST -->
                        <article class="article article-post">
                            <div class="article-share">
                                <a href="#/" class="facebook"><i class="fa fa-facebook"></i></a>                            
                                    <c:if test="${CurrentReader!=null}">
                                    <a href="#/" class="star-bookmark"><i class="fa fa-star"></i></a>
                                        <c:set var="CurrBookmark" value="${sessionScope.bmLib.getBmByArticle(currArt.getArticleID())}"/>                                  
                                    </c:if>

                                <form id="bookmark-form" IsOpened="false">
                                    <div class="form-group">
                                        <label class=" control-label">Title</label>
                                        <div class="">
                                            <input type="text" id="bm-title" placeholder="Title" class="form-control"
                                                   name="Title">
                                        </div>
                                    </div>
                                    <!-- /.form-group -->
                                    <div id="bm-loader-result">
                                        <div id="bm-loader"></div>
                                        <div id="bm-result"></div>
                                    </div>
                                    <div class='btn-container'>
                                        <button id="btn-bm-save" type="button"
                                                class="btn btn-primary form-popup-btn">Save</button>
                                        <button id="btn-bm-delete" type="button"
                                                class="btn btn-primary  form-popup-btn">Delete</button>
                                    </div>
                                </form>
                            </div>                          
                            <div class="article-main-img">
                                <img src="${contextpath}/${imgLib.getThumbnail(currArt.getArticleID())}" alt="">
                            </div>
                            <div class="article-body">
                                <h1 class="article-title">${currArt.getHeading()}</h1>
                                <ul class="article-meta">
                                    <li><i class="fa fa-clock-o"></i> ${currArt.getLastModified()}</li>
                                    <li><i class="fa fa-comments"></i> 33</li>
                                    <li>${currArt.getAuthor()}</li>
                                </ul>
                                <div class="article-content">
                                    ${currArt.getContent()}
                                </div>
                            </div>
                        </article>
                        <!-- /ARTICLE POST -->

                        <!-- widget tags -->
                        <div class="widget-tags">
                            <ul>
                                <li><a href="#">${CatMap.get(currArt.getCategoryID())}</a></li>
                                    <c:if test="${currArt.getSubCategoryID()!= 0}">
                                    <li><a href="#">${CatMap.get(currArt.getSubCategoryID())}</a></li>
                                    </c:if>

                            </ul>
                        </div>
                        <!-- /widget tags -->

                        <!-- article comments -->
                        <div class="article-comments">
                            <div class="section-title">
                                <h2 class="title">Comments</h2>
                            </div>
                            <!-- comment frame -->
                            <!-- <div class="comment-media">
                                            <div class="article-reply-form">
                                                    <form>
                                                            <textarea class="input" placeholder="Type your comment..."></textarea>
                                                            <button class="input-btn">Comment</button>
                                                    </form>
                                            </div>
                                    </div> -->
                            <!-- /comment frame -->
                            <!-- comment -->
                            <c:forEach var="cmt1" items="${alCmtLv1}">
                                <c:set var="acc" value="${mapCmtAcc.get(cmt1.getAccountID())}"></c:set>
                                    <div class="media media-big">
                                        <div class="media-left">
                                            <img src="${contextpath}/${acc.getProfilePicture()}" alt="">
                                    </div>
                                    <div class="media-body" CommentID="${cmt1.getCommentID()}" AccountID="${cmt1.getAccountID()}">
                                        <div class="media-heading">
                                            <h5>${acc.getFullName()} </h5>
                                            <span class="reply-time">${cmt1.getDateCreated()}</span>
                                        </div>
                                        <p>${cmt1.getContent()}</p>

                                        <c:if test="${CurrentReader!=null}">
                                            <a href="#/" class="reply-btn" style="font-weight: bold">Reply</a>
                                        </c:if> 
                                    </div>
                                    <c:if test="${cmt1.getAccountID()==CurrentReader.getAccountID()}">
                                        <a class="delete-btn" href="#/" CommentID="${cmt1.getCommentID()}"><i class="fa fa-times"></i></a>
                                        </c:if>

                                    <c:forEach var="cmt2" items="${mapCmtLv2.get(cmt1.getCommentID())}">
                                        <c:set var="acc2" value="${mapCmtAcc.get(cmt2.getAccountID())}"></c:set>
                                            <div class="media media-small">
                                                <div class="media-left">
                                                    <img src="${contextpath}/${acc2.getProfilePicture()}" alt="">
                                            </div>
                                            <div class="media-body" CommentID="${cmt2.getCommentID()}">
                                                <div class="media-heading">
                                                    <h5>${acc2.getFullName()}</h5>
                                                    <span class="reply-time">${cmt2.getDateCreated()}</span>
                                                </div>
                                                <p>${cmt2.getContent()}</p>
                                                <c:if test="${CurrentReader!=null}">
                                                    <a href="#/" class="reply-btn"style="font-weight: bold">Reply</a>
                                                </c:if>
                                                <c:if test="${cmt2.getAccountID()==CurrentReader.getAccountID()}">
                                                    <a class="delete-btn" href="#/" CommentID="${cmt2.getCommentID()}"><i class="fa fa-times"></i></a>
                                                    </c:if>

                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- /comment -->
                                </div>
                            </c:forEach>

                            <!-- /comment -->
                        </div>
                        <!-- /article comments -->

                        <!-- reply form -->
                        <div class="article-reply-form">
                            <div class="section-title">
                                <h2 class="title">Leave a comment</h2>
                            </div>
                            <c:choose>
                                <c:when test="${CurrentReader!=null}">
                                    <form name="cmt1-form" action="${contextpath}/comment" method="POST">
                                        <textarea class="input" placeholder="Message" name="cmt1-content"
                                                  id="cmt1-content"></textarea>
                                        <div id="loader1"></div>         
                                        <button type="button" class="input-btn" id="cmt1-btn">Comment</button>
                                    </form>
                                </c:when>
                                <c:when test="${CurrentReader==null}">
                                    <h3 id="please-login"><a href="#">Please log in to comment!!!</a>
                                    </h3>
                                </c:when>
                            </c:choose>

                        </div>
                        <!-- /reply form -->
                    </div>
                    <!-- /Main Column -->

                    <!-- Aside Column -->
                    <div class="col-md-4">
                        <!-- social widget -->
                        <div class="widget social-widget">
                            <div class="widget-title">
                                <h2 class="title">Stay Connected</h2>
                            </div>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i><br><span>Facebook</span></a>
                                </li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i><br><span>Twitter</span></a>
                                </li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i><br><span>Google+</span></a></li>
                                <li><a href="#" class="instagram"><i
                                            class="fa fa-instagram"></i><br><span>Instagram</span></a></li>
                                <li><a href="#" class="youtube"><i class="fa fa-youtube"></i><br><span>Youtube</span></a>
                                </li>
                                <li><a href="#" class="rss"><i class="fa fa-rss"></i><br><span>RSS</span></a></li>
                            </ul>
                        </div>
                        <!-- /social widget -->

                        <!-- subscribe widget -->
                        <div class="widget subscribe-widget">
                            <div class="widget-title">
                                <h2 class="title">Subscribe to Newslatter</h2>
                            </div>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="input-btn">Subscribe</button>
                            </form>
                        </div>
                        <!-- /subscribe widget -->
                    </div>
                    <!-- /Aside Column -->
                </div>
                <!-- /ROW -->
            </div>
            <!-- /CONTAINER -->
        </div>
        <!-- /SECTION -->

        <!-- AD SECTION -->
        <div class="visible-lg visible-md">
            <img class="center-block" src="img/ad-3.jpg" alt="">
        </div>
        <!-- /AD SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- CONTAINER -->
            <div class="container">
                <!-- ROW -->
                <div class="row">
                    <!-- Main Column -->
                    <div class="col-md-12">
                        <!-- section title -->
                        <div class="section-title">
                            <h2 class="title">Related Post</h2>
                        </div>
                        <!-- /section title -->
                        <!-- row -->
                        <div class="row" id="related-post-row">
                            <!-- Column 1 -->
                            <c:forEach var="i" begin="0" end="3">
                                <div class="col-md-3 col-sm-6">
                                    <!-- ARTICLE -->
                                    <article class="article" ArticleID="${ArtByCat[i].getArticleID()}"
                                             CatID="${ArtByCat[i].getCategoryID()}" SubID="${ArtByCat[i].getSubCategoryID()}">
                                        <div class="article-img">
                                            <a href="#">
                                                <img src="${contextpath}/${imgLib.getThumbnail(ArtByCat[i].getArticleID())}"
                                                     alt="">
                                            </a>
                                            <ul class="article-info">
                                                <li class="article-type"><i class="fa fa-camera"></i></li>
                                            </ul>
                                        </div>
                                        <div class="article-body">
                                            <h4 class="article-title"><a href="#">${ArtByCat[i].getHeading()}</a>
                                            </h4>
                                            <ul class="article-meta">
                                                <li><i class="fa fa-clock-o"></i>${ArtByCat[i].getLastModified()}</li>
                                                <li><i class="fa fa-comments"></i> 33</li>
                                                <li>${ArtByCat[i].getAuthor()}</li>
                                            </ul>
                                        </div>
                                    </article>
                                    <!-- /ARTICLE -->
                                </div>
                            </c:forEach>
                            <!-- /Column 1 -->
                        </div>
                        <!-- /row -->
                    </div>
                    <!-- /Main Column -->
                </div>
                <!-- /ROW -->
            </div>
            <!-- /CONTAINER -->
        </div>
        <!-- /SECTION -->
        <jsp:include page="reader_footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="reader_js.jsp"/>
        <script src="${pageContext.request.contextPath}/js/post.js"></script>
        <script>

            $(function () {
                var context = "${pageContext.request.contextPath}";
                var catobj = {
                }
            <c:forEach var="cat" items = "${CatMap}" >
                catobj["${cat.key}"] = "${cat.value}"
            </c:forEach >
                //set active
                setArticleCat();
                function setArticleCat() {

                    $(".main-nav li a").each(function () {
                        if ($(this).html() == "${param.category}") {
                            $(this).parent().addClass("active");
                        }

                    }
                    )
                }
                activeSubCat();
                function activeSubCat() {
                    var subcat = "${param.subcat}";
                    if (subcat != null) {
                        $(".sub-nav-list li").each(function () {
                            if ($(this).children().html() == subcat) {
                                $(this).addClass("active");
                            }
                        })
                    }
                }
                $("#related-post-row article").each(function () {
                    var articleid = $(this).attr('articleid');
                    var catid = parseInt($(this).attr('catid'));
                    var subid = parseInt($(this).attr('subid'));
                    //                                                var heading = $(this).find('h4 a');
                    //                                                var encoded_heading = escape(heading.html()+' '+articleid);
                    //                                                encoded_heading = encoded_heading.replace(new RegExp('%20','g'),'+');
                    //                                                alert(encoded_heading); 
                    //                                                console.log(subid);
                    if (subid != 0) {
                        var url = context + "/articles/" + catobj[catid] + "/" + catobj[subid] + "/" + articleid;
                    } else {
                        var url = context + "/articles/" + catobj[catid] + "/" + articleid;
                    }
                    $(this).find("a").attr("href", url);

                })
                $(".article-content img").each(function () {
                    //                                                $(this).css('width', '100%');
                    $(this).parent().css('text-align', 'center');
                })
                //

                $("#cmt1-btn").click(function () {
                    var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
                    var url = contextpath + "/comment";
                    var loader1 = $("#loader1");
                    loader1.toggleClass('.loader');
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: {
                            ArticleID: "${currArt.getArticleID()}",
                            AccountID: "${CurrentReader.getAccountID()}",
                            RepliedCommentID: 0,
                            Content: $("#cmt1-content").val(),
                            NoOfLikes: 0,
                            Level: 1
                        },
                        success: function (responseText) {

                            if (responseText != "failed") {
                                //render comment
                                var media_bigDiv = $('<div>');
                                media_bigDiv.addClass('media media-big');
                                var media_leftDiv = $('<div>');
                                media_leftDiv.addClass('media-left');
                                var media_bodyDiv = $('<div>');
                                media_bodyDiv.addClass('media-body');
                                media_bodyDiv.attr('accountid', ${CurrentReader.getAccountID()})
                                media_bodyDiv.attr('commentid', responseText);
                                //media-left
                                var img = $('<img>');
                                img.attr('src', '${contextpath}/${CurrentReader.getProfilePicture()}');
                                                        img.appendTo(media_leftDiv);
                                                        //media body
                                                        var media_headingDiv = $('<div>');
                                                        media_headingDiv.addClass('media-heading');
                                                        //
                                                        var h5 = $('<h5>');
                                                        h5.html("${CurrentReader.getFirstName()}" + " " + "${CurrentReader.getLastName()}")
                                                        var span = $('<span>');
                                                        span.addClass('reply-time');
                                                        var d = new Date();
                                                        var time = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                                                        span.html(time);
                                                        h5.appendTo(media_headingDiv);
                                                        span.appendTo(media_headingDiv);
                                                        media_headingDiv.appendTo(media_bodyDiv);
                                                        //
                                                        var p = $('<p>');
                                                        p.html($("#cmt1-content").val());
                                                        p.appendTo(media_bodyDiv);
                                                        //
                                                        var a = $('<a href="#/" class="reply-btn" style="font-weight: bold" is-clicked="false">Reply</a>');
                                                        a.appendTo(media_bodyDiv);
                                                        //
                                                        var a2 = $('<a class="delete-btn" href="#/"><i class="fa fa-times"></i></a>');
                                                        a2.attr('commentid', responseText);
                                                        a2.appendTo(media_bodyDiv);
                                                        //
                                                        media_bigDiv.append(media_leftDiv, media_bodyDiv);
                                                        //
                                                        $('.article-comments').append(media_bigDiv);
                                                        loader1.toggleClass('.loader');
                                                    } else {
                                                        alert("2");
                                                    }
                                                }
                                            })
                                        })
                                        //
                                        $(document).on('click', '.media-big .reply-btn', function () {
                                            // <div class="comment-media">
                                            //     <div class="article-reply-form">
                                            //         <form>
                                            //             <textarea class="input" placeholder="Type your comment..."></textarea>
                                            //             <button class="input-btn">Comment</button>
                                            //         </form>
                                            //     </div>
                                            // </div>
                                            $('.media-big .comment-media').remove();
                                            if ($(this).attr('is-clicked') == "false") {
                                                var CommentMediaDiv = $('<div>');
                                                CommentMediaDiv.addClass('comment-media');
                                                var ReplyFormDiv = $('<div>');
                                                ReplyFormDiv.addClass('article-reply-form');
                                                var form = $('<form>');
                                                var textarea = $('<textarea>');
                                                textarea.addClass('input');
                                                textarea.attr('placeholder', 'Type your comment...');
                                                textarea.attr('id', 'cmt2-content');
                                                textarea.val("@" + $(this).prev().prev().find("h5").html() + ": ");
                                                textarea.appendTo(form);
                                                var btn = $('<button>');
                                                btn.addClass('input-btn').html('Comment');
                                                btn.attr('id', 'cmt2-btn');
                                                btn.appendTo(form);
                                                form.appendTo(ReplyFormDiv);
                                                ReplyFormDiv.appendTo(CommentMediaDiv);
                                                $(this).after(CommentMediaDiv);
                                                $(this).attr('is-clicked', 'true');
                                            } else {
                                                $(this).attr('is-clicked', 'false');
                                            }
                                        })
                                        $(document).on('click', '#cmt2-btn', function () {
                                            var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
                                            var url = contextpath + "/comment";
                                            var closest_mediabig = $(this).parents('.media-big');
                                            $.ajax({
                                                type: "POST",
                                                url: url,
                                                data: {
                                                    ArticleID: "${currArt.getArticleID()}",
                                                    AccountID: "${CurrentReader.getAccountID()}",
                                                    RepliedCommentID: closest_mediabig.find('.media-body').attr('commentid'),
                                                    Content: $("#cmt2-content").val(),
                                                    NoOfLikes: 0,
                                                    Level: 2
                                                },
                                                success: function (responseText) {
                                                    if (responseText != "failed") {
                                                        //render comment
                                                        var media_smallDiv = $('<div>');
                                                        media_smallDiv.addClass('media media-small');
                                                        var media_leftDiv = $('<div>');
                                                        media_leftDiv.addClass('media-left');
                                                        var media_bodyDiv = $('<div>');
                                                        media_bodyDiv.addClass('media-body');
                                                        media_bodyDiv.attr('accountid', ${CurrentReader.getAccountID()})
                                                        media_bodyDiv.attr('commentid', responseText);
                                                        //media-left
                                                        var img = $('<img>');
                                                        img.attr('src', '${contextpath}/${CurrentReader.getProfilePicture()}');
                                                                                img.appendTo(media_leftDiv);
                                                                                //media body
                                                                                var media_headingDiv = $('<div>');
                                                                                media_headingDiv.addClass('media-heading');
                                                                                //
                                                                                var h5 = $('<h5>');
                                                                                h5.html("${CurrentReader.getFirstName()}" + " " + "${CurrentReader.getLastName()}")
                                                                                var span = $('<span>');
                                                                                span.addClass('reply-time');
                                                                                var d = new Date();
                                                                                var time = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                                                                                span.html(time);
                                                                                h5.appendTo(media_headingDiv);
                                                                                span.appendTo(media_headingDiv);
                                                                                media_headingDiv.appendTo(media_bodyDiv);
                                                                                //
                                                                                var p = $('<p>');
                                                                                p.html($("#cmt2-content").val());
                                                                                p.appendTo(media_bodyDiv);
                                                                                //
                                                                                var a = $('<a href="#/" class="reply-btn" style="font-weight: bold" is-clicked="false">Reply</a>');
                                                                                a.appendTo(media_bodyDiv);
                                                                                //
                                                                                var a2 = $('<a class="delete-btn" href="#/"><i class="fa fa-times"></i></a>');
                                                                                a2.attr('commentid', responseText);
                                                                                a2.appendTo(media_bodyDiv);
                                                                                //
                                                                                media_smallDiv.append(media_leftDiv, media_bodyDiv);
                                                                                //
                                                                                closest_mediabig.append(media_smallDiv);
                                                                                $('.media-big .comment-media').remove();
                                                                            } else {
                                                                                alert("2");
                                                                            }
                                                                        }
                                                                    })

                                                                })
                                                                $(document).on('click', '.delete-btn', function () {
                                                                    var commentid = $(this).attr('commentid');
                                                                    var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
                                                                    var url = contextpath + "/comment";
                                                                    var this_parent = $(this).parent();
                                                                    var media_small = $(this).parents('.media-small');
                                                                    $.ajax({
                                                                        type: "POST",
                                                                        url: url,
                                                                        data: {
                                                                            CommentID: commentid,
                                                                            mode: "delete",

                                                                        },
                                                                        success: function (responseText) {
                                                                            if (responseText = "success") {
                                                                                if (this_parent.hasClass("media-big")) {
                                                                                    this_parent.remove();
                                                                                } else {
                                                                                    media_small.remove();
                                                                                }
                                                                            } else {
                                                                                alert("2");
                                                                            }
                                                                        }

                                                                    })


                                                                })
                                                                loadBookmark();
                                                                function loadBookmark() {
                                                                    if ("${CurrBookmark}" != "") {
                                                                        $(".star-bookmark").css("color", "yellow");
                                                                        $("#bm-title").val("${CurrBookmark.getTitle()}");
                                                                    } else {
                                                                        $("#btn-bm-delete").attr("disabled", "true");
                                                                    }
                                                                }
                                                                $("#btn-bm-save").click(function () {
                                                                    $("#bm-loader").toggleClass("loader");
                                                                    var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
                                                                    var url = contextpath + "/bookmark";
//                                                                    alert("ArticleID = " + "${currArt.getArticleID()}");
//                                                                    alert("BookmarkID = " + "${CurrBookmark.getBookmarkID()}");
//                                                                    alert("AccountID = " + "${CurrentReader.getAccountID()}");
                                                                    $.ajax({
                                                                        type: "POST",
                                                                        url: url,
                                                                        data: {
                                                                            BookmarkID: "${CurrBookmark.getBookmarkID()}",
                                                                            Title: $("#bm-title").val(),
                                                                            ArticleID: "${currArt.getArticleID()}",
                                                                            AccountID: "${CurrentReader.getAccountID()}",
                                                                            Mode: "save"
                                                                        },
                                                                        success: function (responseText) {
                                                                            if (responseText == "success") {
//                                                                                alert("1");

                                                                            } else {
//                                                                                alert("2");
                                                                            }
                                                                            location.reload();
                                                                        }

                                                                    })
                                                                })
                                                                $("#btn-bm-delete").click(function () {
                                                                    $("#bm-loader").toggleClass("loader");
                                                                    var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
                                                                    var url = contextpath + "/bookmark";
                                                                    $.ajax({
                                                                        type: "POST",
                                                                        url: url,
                                                                        data: {
                                                                            ArticleID: "${currArt.getArticleID()}",
                                                                            AccountID: "${CurrentReader.getAccountID()}",
                                                                            BookmarkID: "${CurrBookmark.getBookmarkID()}",
                                                                            Mode: "delete"
                                                                        },
                                                                        success: function (responseText) {
                                                                            if (responseText == "success") {
//                                                                                alert("1");

                                                                            } else {
//                                                                                alert("2");
                                                                            }
                                                                            location.reload();
                                                                        }

                                                                    })
                                                                })



                                                            })
        </script>

    </body>

</html>