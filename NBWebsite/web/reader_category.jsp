<%-- 
    Document   : reader_category
    Created on : May 31, 2019, 2:22:42 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>${param.category} ${param.subcat}</title>
        <jsp:include page="reader_css.jsp"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/cat.css" />
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
    </head>
    <body>
        <c:set var="CatBiMap" value="${sessionScope.CatBiMap}"/>
        <c:set var="CatMap" value="${CatBiMap.getForwardMap()}"/>
        <c:set var="iArt" value="0"/>
        <!-- Header -->
        <jsp:include page="reader_header_nav.jsp"/>
        <!-- /Header -->

        <!-- Section: Hot news -->
        <div class="section">
            <div class="container" id="hot-news-section">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <article class="article article-top" ArticleID="${ArtByCat[iArt].getArticleID()}" CatID="${ArtByCat[iArt].getCategoryID()}" SubID="${ArtByCat[iArt].getSubCategoryID()}">
                            <div id="article-top-1">
                                <div class="article-img">
                                    <a href="#">
                                        <img src="${pageContext.request.contextPath}/${imgLib.getThumbnail(ArtByCat[iArt].getArticleID())}" alt="article-top-1-img">
                                    </a>
                                </div>
                                <h3 class="article-title" id="article-top-1-heading">
                                    <a href="#">${ArtByCat[iArt].getHeading()}</a>
                                </h3>
                                <ul class="article-meta">
                                    <li><i class="fa fa-clock-o"></i> ${ArtByCat[iArt].getLastModified()}</li>
                                   
                                    <li><span>${ArtByCat[iArt].getAuthor()}</span></li>
                                </ul>
                                <div id="article-top-1-content">
                                    <p>
                                        ${ArtByCat[iArt].getShortDescription()}
                                    </p>
                                </div>
                            </div>
                            <c:set var="iArt" value="${iArt+1}"/>
                        </article>
                    </div>
                    <div class="col-md-3 col-sm-4">
                        <article class="article article-top" ArticleID="${ArtByCat[iArt].getArticleID()}" CatID="${ArtByCat[iArt].getCategoryID()}" SubID="${ArtByCat[iArt].getSubCategoryID()}">
                            <div id="article-top-2">
                                <div class="article-img">
                                    <a href="#">
                                        <img src="${pageContext.request.contextPath}/${imgLib.getThumbnail(ArtByCat[iArt].getArticleID())}" alt="article-top-1-img">
                                    </a>
                                </div>
                                <h3 class="article-title" id="article-top-1-heading">
                                    <a href="#">${ArtByCat[iArt].getHeading()}</a>
                                </h3>
                                <ul class="article-meta">
                                    <li><i class="fa fa-clock-o"></i> ${ArtByCat[iArt].getLastModified()}</li>
                                   
                                    <li><span>${ArtByCat[iArt].getAuthor()}</span></li>
                                </ul>
                                <div id="article-top-1-content">
                                    <p>
                                        ${ArtByCat[iArt].getShortDescription()}
                                    </p>
                                </div>
                            </div>
                            <c:set var="iArt" value="${iArt+1}"/>

                        </article>
                    </div>
                    <div class="col-md-3 col-sm-8">
                        <div class="article-top">
                            <div class="row" id="article-top-3-4">
                                <div class="col-md-12 col-sm-6">
                                    <article class="article" id="article-top-3" ArticleID="${ArtByCat[iArt].getArticleID()}" CatID="${ArtByCat[iArt].getCategoryID()}" SubID="${ArtByCat[iArt].getSubCategoryID()}"
                                             >                                     
                                        <div class="article-img">
                                            <a href="#">
                                                <img src="${pageContext.request.contextPath}/${imgLib.getThumbnail(ArtByCat[iArt].getArticleID())}" alt="article-top-1-img">                      
                                            </a>
                                        </div>
                                        <h3 class="article-title" id="article-top-1-heading">
                                            <a href="#">${ArtByCat[iArt].getHeading()}</a>
                                        </h3>
                                        <ul class="article-meta">
                                            <li><i class="fa fa-clock-o"></i> ${ArtByCat[iArt].getLastModified()}</li>
                                           
                                            <li><span>${ArtByCat[iArt].getAuthor()}</span></li>
                                        </ul>
                                        <div id="article-top-1-content">
                                            <p>
                                                ${ArtByCat[iArt].getShortDescription()}
                                            </p>
                                        </div>                                       
                                        <c:set var="iArt" value="${iArt+1}"/>
                                    </article>
                                </div>
                                <div class="col-md-12 col-sm-6">
                                    <div class="article-top">
                                        <article class="article" id="article-top-4" ArticleID="${ArtByCat[iArt].getArticleID()}" CatID="${ArtByCat[iArt].getCategoryID()}" SubID="${ArtByCat[iArt].getSubCategoryID()}"
                                                 >
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${pageContext.request.contextPath}/${imgLib.getThumbnail(ArtByCat[iArt].getArticleID())}" alt="article-top-1-img">
                                                </a>
                                            </div>
                                            <h3 class="article-title" id="article-top-1-heading">
                                                <a href="#">${ArtByCat[iArt].getHeading()}</a>
                                            </h3>
                                            <ul class="article-meta">
                                                <li><i class="fa fa-clock-o"></i> ${ArtByCat[iArt].getLastModified()}</li>
                                               
                                                <li><span>${ArtByCat[iArt].getAuthor()}</span></li>
                                            </ul>
                                            <div id="article-top-1-content">
                                                <p>
                                                    ${ArtByCat[iArt].getShortDescription()}
                                                </p>
                                            </div>                                       
                                            <c:set var="iArt" value="${iArt+1}"/>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of hot news section -->
        <!-- Section: Lastest news and popular -->
        <div class="section" id="latest-news-header">
            <div class="container">
                <div class="row">
                    <!-- LEFT COLUMN -->
                    <div class="col-lg-8 list-col-left  article-list-section ">
                        <div  class="col-title">
                            LATEST NEWS
                        </div>
                        <c:set var="totalNo" value="${((ArtByCat.size()-4)/5)}"/>
                        <c:if test="${(totalNo -totalNo.intValue())>0}">
                            <c:set var="totalNo" value="${totalNo.intValue()+1}"/>
                        </c:if>
                        <div class="row">
                            <div class="col-sm-12"> 
                                <div id="ArtPageWrap" CurrentPage="1">
                                    <c:if test="${totalNo>=2}">
                                        <c:forEach var="ipage" begin="1" end="${totalNo-1}">
                                            <div class="ArtPage" id="ArtPage${ipage}">
                                                <c:forEach  begin="${ipage*5-1}" end="${ipage*5+3}">
                                                    <article class="row article latest-news-row" ArticleID="${ArtByCat[iArt].getArticleID()}" CatID="${ArtByCat[iArt].getCategoryID()}" SubID="${ArtByCat[iArt].getSubCategoryID()}">
                                                        <div class="col-md-5">
                                                            <div class="article-img">
                                                                <a href="#">
                                                                    <img src="${pageContext.request.contextPath}/${imgLib.getThumbnail(ArtByCat[iArt].getArticleID())}" alt="article-img">                                            
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-7">
                                                            <h4 class="article-title">
                                                                <a>${ArtByCat[iArt].getHeading()}</a>
                                                            </h4>
                                                            <ul class="article-meta">
                                                                <li><i class="fa fa-clock-o"></i> ${ArtByCat[iArt].getLastModified()}</li>
                                                               
                                                                <li><span>${ArtByCat[iArt].getAuthor()}</span></li>
                                                            </ul>
                                                            <div class="article-content">
                                                                ${ArtByCat[iArt].getShortDescription()}
                                                            </div>
                                                        </div>
                                                        <c:set var="iArt" value="${iArt+1}"/>
                                                    </article> 
                                                </c:forEach>
                                            </div>
                                        </c:forEach>                                           
                                    </c:if>
                                    <div class="ArtPage" id="ArtPage${totalNo}">
                                        <c:forEach  begin="${iArt}"  end="${ArtByCat.size()-1}">
                                            <article class="row article latest-news-row" ArticleID="${ArtByCat[iArt].getArticleID()}" CatID="${ArtByCat[iArt].getCategoryID()}" SubID="${ArtByCat[iArt].getSubCategoryID()}">
                                                <div class="col-md-5">
                                                    <div class="article-img">
                                                        <a href="#">
                                                            <img src="${pageContext.request.contextPath}/${imgLib.getThumbnail(ArtByCat[iArt].getArticleID())}" alt="article-img">                                            
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-md-7">
                                                    <h4 class="article-title">
                                                        <a>${ArtByCat[iArt].getHeading()}</a>
                                                    </h4>
                                                    <ul class="article-meta">
                                                        <li><i class="fa fa-clock-o"></i> ${ArtByCat[iArt].getLastModified()}</li>
                                                       
                                                        <li><span>${ArtByCat[iArt].getAuthor()}</span></li>
                                                    </ul>
                                                    <div class="article-content">
                                                        ${ArtByCat[iArt].getShortDescription()}
                                                    </div>
                                                </div>
                                                <c:set var="iArt" value="${iArt+1}"/>
                                            </article> 
                                        </c:forEach>
                                    </div>
                                </div>                                                
                            </div>                   
                        </div>
                        <div class="next-page-nav">
                            <ul class="next-page-nav-list">
                                <li id="page-first"><a href="#latest-news-header">First</a></li>
                                <li id="page-back"><a href="#latest-news-header">&lt;</a> </li>
                                <li id="page-no"><span id="curr-no">1</span>/<span id="total-no">${totalNo}</span></li>
                                <li id="page-next"><a href="#latest-news-header">&gt;</a> </li>
                                <li id="page-last"><a href="#latest-news-header">Last</a></li>
                            </ul>
                        </div>

                    </div>
                    <!-- RIGHT COLUMN -->
                    <div class="col-lg-4 list-col-right">
                        <div class="col-title">
                            MOST POPULAR
                        </div>
                        <!--                        <div class="article single-article">
                                                    <div class="single-article-img">
                                                        <img src="img/img-widget-1.jpg" alt="">
                                                    </div>
                                                    <div class="single-article-title">
                                                        <h5 class="article-title"> <a href="#">This is title This is title This is title</a>
                                                        </h5>
                                                    </div>
                                                    <div class="article-meta">
                                                        <li><i class="fa fa-clock-o"></i> April 1, 2019</li>
                                                       
                                                        <li>BY NGUYEN MINH HIEU</li>
                                                    </div>
                                                    <p>
                                                        hieu dep trai hieu dep trai hieu dep trai hieu dep trai hieu dep trai hieu dep trai
                                                        hieu dep trai hieu dep trai
                                                        hieu dep trai hieu dep trai hieu dep trai hieu dep trai hieu dep trai hieu dep trai
                                                    </p>
                                                </div>-->

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
                </div>
            </div>
        </div>
        <!-- End of section latest news and popular -->
        <jsp:include page="reader_footer.jsp"/>
        <!-- jQuery Plugins -->
        <jsp:include page="reader_js.jsp"/>
        <script src="${pageContext.request.contextPath}/js/index.js"></script>
        <script>
            $(function () {
                //set active
                setArticleCat();
                function setArticleCat() {

                    $(".main-nav li a").each(function () {
                        if ($(this).html() == "${param.category}")
                        {
                            $(this).parent().addClass("active");
                        }

                    }
                    )
                }
                activeSubCat();
                function activeSubCat()
                {
                    var subcat = "${param.subcat}";
                    if (subcat != null)
                    {
                        $(".sub-nav-list li").each(function () {
                            if ($(this).children().html() == subcat) {
                                $(this).addClass("active");
                            }
                        })
                    }
                }
                //pagination
                displayArtPageWrap();
                var total_no = Number($("#total-no").html());
                function displayArtPageWrap() {
                    var currentpage = $("#ArtPageWrap").attr('currentpage');
                    $("#ArtPageWrap").children('.ArtPage').each(function () {
                        var ArtPageID = $(this).attr('id');
                        if (!ArtPageID.includes(currentpage)) {
                            $(this).css('display', 'none');
                        }
                    })
                }
                function setArtPageWrap(currentpage) {
                    $("#ArtPageWrap").attr('currentpage', currentpage);
                    $("#ArtPageWrap").children('.ArtPage').each(function () {
                        var ArtPageID = $(this).attr('id');
                        if (!ArtPageID.includes(currentpage)) {
                            $(this).css('display', 'none');
                        } else {
                            $(this).css('display', 'block');
                        }
                    })
                }
                $("#page-next").click(function () {
                    var curr_no = Number($("#curr-no").html());
                    if (curr_no < total_no) {
                        $("#curr-no").html(curr_no + 1);
                        setArtPageWrap(curr_no + 1);
                    }
                })
                $("#page-back").click(function () {
                    var curr_no = Number($("#curr-no").html());
                    if (curr_no > 1) {
                        $("#curr-no").html(curr_no - 1);
                        setArtPageWrap(curr_no - 1);
                    }
                })
                $("#page-first").click(function () {
                    $("#curr-no").html(1);
                    setArtPageWrap(1);
                })
                $("#page-last").click(function () {
                    $("#curr-no").html(total_no);
                    setArtPageWrap(total_no);
                })
                //
                var context = "${pageContext.request.contextPath}";
                var catobj = {}
            <c:forEach var="cat" items="${CatMap}">
                catobj["${cat.key}"] = "${cat.value}"
            </c:forEach>
                $("article").each(function () {
                    var articleid = $(this).attr('articleid');
                    var catid = parseInt($(this).attr('catid'));
                    var subid = parseInt($(this).attr('subid'));
                    console.log(subid);
                    if (subid != 0) {
                        var url = context + "/articles/" + catobj[catid] + "/" + catobj[subid] + "/" + articleid;
                    } else {
                        var url = context + "/articles/" + catobj[catid] + "/" + articleid;
                    }
                    $(this).find("a").attr("href", url);

                })

            })
        </script>
    </body>
</html>
