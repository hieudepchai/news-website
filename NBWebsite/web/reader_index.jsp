<%-- 
    Document   : reader_index
    Created on : May 19, 2019, 11:29:17 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Index</title>
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/index.css" />
        <jsp:include page="reader_css.jsp"/>

    </head>

    <body>
        <c:set var="CatBiMap" value="${sessionScope.CatBiMap}"/>
        <c:set var="CatMap" value="${CatBiMap.getForwardMap()}"/>
        <c:set var="NewsList"  value="${generalArticleMap[(CatBiMap.getBackward("News")).intValue()]}"/>
        <c:set var="WorldList" value="${generalArticleMap[(CatBiMap.getBackward("World")).intValue()]}" />
        <c:set var="BusinessList" value="${generalArticleMap[(CatBiMap.getBackward("Business")).intValue()]}" />
        <c:set var="EduList" value="${generalArticleMap[(CatBiMap.getBackward("Education")).intValue()]}" />
        <c:set var="EnterList" value="${generalArticleMap[(CatBiMap.getBackward("Entertainment")).intValue()]}" />
        <c:set var="SportList" value="${generalArticleMap[(CatBiMap.getBackward("Sport")).intValue()]}" />
        <c:set var="TechList" value="${generalArticleMap[(CatBiMap.getBackward("Technology")).intValue()]}" />
        <c:set var="TravelList" value="${generalArticleMap[(CatBiMap.getBackward("Travel")).intValue()]}" /> 
        <c:set var="iNews" value="0"/>
        <c:set var="iWorld" value="0"/>
        <c:set var="iBusiness" value="0" />
        <c:set var="iEdu" value="0"/>
        <c:set var="iEnter" value="0"/>
        <c:set var="iSport" value="0"/>
        <c:set var="iTech" value="0"/>
        <c:set var="iTravel" value="0"/> 

        <!-- Header -->

        <!-- /Header -->
        <!-- HOME HOT ARTICLES -->
        <jsp:include page="reader_header_nonav.jsp"/>
        <!-- END HOME HOT ARTICLES -->
        <!-- HOT NEWS SECTION -->
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-9" id="hot-news-section-left">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row" id="hot-news-section-1">  
                                    <article class="article" articleid="${NewsList[0].getArticleID()}" catid="${NewsList[0].getCategoryID()}" subid="${NewsList[0].getSubCategoryID()}">
                                        <div class="col-sm-7">
                                            <div class="article-img" id="hot-news-img-1">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(NewsList[0].getArticleID())}" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="article-body">
                                                <h4 class="article-title">
                                                    <a href="#">
                                                        ${NewsList[0].getHeading()}
                                                    </a>
                                                </h4>
                                                <ul class="article-meta">
                                                    <li><i class="fa fa-clock-o"></i>${NewsList[0].getLastModified()}</li>
                                                
                                                    <li>${NewsList[0].getAuthor()}</li>
                                                </ul>
                                                <p>
                                                    ${NewsList[0].getShortDescription()}
                                                </p>
                                            </div>
                                        </div>
                                    </article>                                  
                                </div>
                            </div>
                        </div>

                        <div class="row" id="hot-news-section-2">
                            <div class="col-sm-4">
                                <article class="article" ArticleID="${WorldList[0].getArticleID()}" CatID="${WorldList[0].getCategoryID()}" SubID="${WorldList[0].getSubCategoryID()}">
                                    <div class="article-img">
                                        <a href="#">
                                            <img src="${imgLib.getThumbnail(WorldList[0].getArticleID())}" alt="">
                                        </a>
                                    </div>
                                    <div class="article-body">
                                        <h4 class="article-title ">
                                            <a href="#">
                                                ${WorldList[0].getHeading()}
                                            </a>
                                        </h4>
                                        <ul class="article-meta">
                                            <li><i class="fa fa-clock-o"></i> ${WorldList[0].getLastModified()}</li>
                                        
                                            <li>${WorldList[0].getAuthor()}</li>
                                        </ul>
                                        <p>
                                            ${WorldList[0].getShortDescription()}
                                        </p>
                                    </div>
                                </article>               
                            </div>
                            <div class="col-sm-4">
                                <article class="article" ArticleID="${BusinessList[0].getArticleID()}" CatID="${BusinessList[0].getCategoryID()}" SubID="${BusinessList[0].getSubCategoryID()}">
                                    <div class="article-img">                              
                                        <a href="#">
                                            <img src="${ imgLib.getThumbnail(BusinessList[0].getArticleID())}" alt="">
                                        </a>
                                    </div>
                                    <div class="article-body">
                                        <h4 class="article-title ">
                                            <a href="#">
                                                ${BusinessList[0].getHeading()}
                                            </a>
                                        </h4>
                                        <ul class="article-meta">
                                            <li><i class="fa fa-clock-o"></i>${BusinessList[0].getLastModified()}</li>
                                        
                                            <li>${BusinessList[0].getAuthor()}</li>
                                        </ul>
                                        <p>
                                            ${BusinessList[0].getShortDescription()}
                                        </p>
                                    </div> 
                                </article>
                            </div>
                            <div class="col-sm-4">
                                <article class="article" ArticleID="${EduList[0].getArticleID()}" CatID="${EduList[0].getCategoryID()}" SubID="${EduList[0].getSubCategoryID()}"> 
                                    <div class="article-img">
                                        <a href="#">
                                            <img src="${imgLib.getThumbnail(EduList[0].getArticleID())}" alt="">
                                        </a>
                                    </div>
                                    <div class="article-body">
                                        <h4 class="article-title ">
                                            <a href="#">
                                                ${EduList[0].getHeading()}
                                            </a>
                                        </h4>
                                        <ul class="article-meta">
                                            <li><i class="fa fa-clock-o"></i> ${EduList[0].getLastModified()}</li>
                                        
                                            <li>${EduList[0].getAuthor()}</li>
                                        </ul>
                                        <p>
                                            ${EduList[0].getShortDescription()}
                                        </p>
                                    </div>
                                </article>           
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 hidden-sm hidden-xs" id="hot-news-section-right">
                        <div id="hot-news-section-3">
                            <div class="most-read-section">
                                <h4 class="most-read-title">Latest</h3>
                            </div>
                            <ul id="scrolling-heading-section">
                                <c:forEach var="GAM" items="${generalArticleMap}">
                                    <c:if test="${GAM.value!=[]}">
                                        <li>                               
                                            <span class="article"  articleid="${GAM.value[2].getArticleID()}" catid="${GAM.value[2].getCategoryID()}" subid="${GAM.value[2].getSubCategoryID()}">
                                                <a href="#/">
                                                    ${GAM.value[2].getHeading()}
                                                </a>                                                
                                            </span>                                        
                                        </li>
                                        <li>                               
                                            <span class="article"  articleid="${GAM.value[3].getArticleID()}" catid="${GAM.value[3].getCategoryID()}" subid="${GAM.value[3].getSubCategoryID()}">
                                                <a href="#/">
                                                    ${GAM.value[3].getHeading()}
                                                </a>                                                
                                            </span>                                        
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- END OF HOT NEWS SECTION -->
        <!-- SECTION -->
        <div class="section">
            <!-- CONTAINER -->
            <div class="container">
                <!-- ROW -->
                <div class="row">
                    <!-- Main Column -->
                    <div class="col-lg-12 col-md-12">
                        <!-- section title -->
                        <div class="section-title">
                            <h2 class="title">News of the day</h2>
                        </div>
                        <!-- /section title -->
                        <div class="row">
                            <!-- NOTD COLUMN 1 -->
                            <c:forEach var="i" begin="1" end="3">
                                <div class="col-sm-4 notd-article-1">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <article class="article" ArticleID="${NewsList[i].getArticleID()}" CatID="${NewsList[i].getCategoryID()}" SubID="${NewsList[i].getSubCategoryID()}">
                                                <div class="article-img">
                                                    <a href="#">
                                                        <img src="${imgLib.getThumbnail(NewsList[i].getArticleID())}" alt="">
                                                    </a>
                                                </div>
                                                <div class="article-body">
                                                    <div class="article-title">
                                                        <a href="#">
                                                            ${NewsList[i].getHeading()}
                                                        </a>
                                                    </div>
                                                    <ul class="article-meta">
                                                        <li><i class="fa fa-clock-o"></i>${NewsList[i].getLastModified()}</li>
                                                    
                                                        <li>${NewsList[i].getAuthor()}</li>
                                                    </ul>
                                                    <p>
                                                        ${NewsList[i].getShortDescription()}
                                                    </p>
                                                </div>
                                            </article>                           
                                        </div>
                                    </div>
                                </div>                               
                            </c:forEach>
                            <!-- /NOTD COLUMN 1 -->
                        </div>
                        <div class="row">
                            <!-- NOTD COLUMN 1 -->
                            <c:forEach var="i" begin="1" end="3">
                                <div class="col-sm-4 notd-article-1">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <article class="article" ArticleID="${WorldList[i].getArticleID()}" CatID="${WorldList[i].getCategoryID()}" SubID="${WorldList[i].getSubCategoryID()}">
                                                <div class="article-img">
                                                    <a href="#">
                                                        <img src="${imgLib.getThumbnail(WorldList[i].getArticleID())}" alt="">
                                                    </a>
                                                </div>
                                                <div class="article-body">
                                                    <div class="article-title">
                                                        <a href="#">
                                                            ${WorldList[i].getHeading()}
                                                        </a>
                                                    </div>
                                                    <ul class="article-meta">
                                                        <li><i class="fa fa-clock-o"></i> ${WorldList[i].getLastModified()}</li>
                                                    
                                                        <li>${WorldList[i].getAuthor()}</li>
                                                    </ul>
                                                    <p>
                                                        ${WorldList[i].getShortDescription()}
                                                    </p>
                                                </div>
                                            </article>                         
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>             
                            <!-- /NOTD COLUMN 1 -->

                        </div>
                        <div class="row">
                            <!-- NOTD COLUMN 1 -->
                            <div class="col-sm-4 notd-article-1">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <article class="article" ArticleID="${EnterList[0].getArticleID()}" CatID="${EnterList[0].getCategoryID()}" SubID="${EnterList[0].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(EnterList[0].getArticleID())}" alt="">
                                                </a>
                                            </div>
                                            <div class="article-body">
                                                <div class="article-title">
                                                    <a href="#">
                                                        ${EnterList[0].getHeading()}
                                                    </a>
                                                </div>
                                                <ul class="article-meta">
                                                    <li><i class="fa fa-clock-o"></i> ${EnterList[0].getLastModified()}</li>
                                                
                                                    <li>${EnterList[0].getAuthor()}</li>
                                                </ul>
                                                <p>
                                                    ${EnterList[0].getShortDescription()}
                                                </p>
                                            </div>
                                        </article>
                                    </div>
                                </div>
                            </div>
                            <!-- /NOTD COLUMN 1 -->
                            <!-- NOTD COLUMN 2 -->
                            <div class="col-sm-4 notd-article-1">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <article class="article" ArticleID="${SportList[0].getArticleID()}" CatID="${SportList[0].getCategoryID()}" SubID="${SportList[0].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(SportList[0].getArticleID())}" alt="">
                                                </a>
                                            </div>
                                            <div class="article-body">
                                                <div class="article-title">
                                                    <a href="#">
                                                        ${SportList[0].getHeading()}
                                                    </a>
                                                </div>
                                                <ul class="article-meta">
                                                    <li><i class="fa fa-clock-o"></i> ${SportList[0].getLastModified()}</li>
                                                
                                                    <li>${SportList[0].getAuthor()}</li>
                                                </ul>
                                                <p>
                                                    ${SportList[0].getShortDescription()}
                                                </p>
                                            </div>
                                        </article>
                                    </div>
                                </div>
                            </div>
                            <!-- /NOTD COLUMN 2 -->
                            <!-- NOTD COLUMN 3 -->
                            <div class="col-sm-4 notd-article-1">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <article class="article" ArticleID="${TechList[0].getArticleID()}" CatID="${TechList[0].getCategoryID()}" SubID="${TechList[0].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(TechList[0].getArticleID())}" alt="">
                                                </a>
                                            </div>
                                            <div class="article-body">
                                                <div class="article-title">
                                                    <a href="#">
                                                        ${TechList[0].getHeading()}
                                                    </a>
                                                </div>
                                                <ul class="article-meta">
                                                    <li><i class="fa fa-clock-o"></i>${TechList[0].getLastModified()}</li>
                                                
                                                    <li>${TechList[0].getAuthor()}</li>
                                                </ul>
                                                <p>
                                                    ${TechList[0].getShortDescription()}
                                                </p>
                                            </div>   
                                        </article>
                                    </div>
                                </div>
                            </div>
                            <!-- /NOTD COLUMN 3 -->
                        </div>
                    </div>
                    <!-- /Main Column -->
                </div>
                <!-- /ROW -->
            </div>
            <!-- /CONTAINER -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- CONTAINER -->
            <div class="container">
                <!-- ROW -->
                <div class="row">
                    <!-- Main Column LEFT COLUMN -->
                    <div class="col-md-8">
                        <!-- row cat -->
                        <!-- row  article 2 3-->
                        <div class="section-article-2-3">
                            <!-- 2-above -->
                            <div class="row">
                                <!-- section title -->
                                <div class="col-md-12">
                                    <div class="section-title">
                                        <a href="${pageContext.request.contextPath}/articles/News">
                                            <h2 class="title">NEWS </h2>
                                        </a>

                                    </div>
                                </div>
                                <!-- /section title -->

                                <!-- Column 1 -->
                                <c:forEach var="i" begin="4" end="5">
                                    <div class="col-md-6 col-sm-6">
                                        <!-- ARTICLE -->
                                        <article class="article" ArticleID="${NewsList[i].getArticleID()}" CatID="${NewsList[i].getCategoryID()}" SubID="${NewsList[i].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(NewsList[i].getArticleID())}" alt="">
                                                </a>
                                                <ul class="article-info">
                                                    <li class="article-type"><i class="fa fa-camera"></i></li>
                                                </ul>
                                            </div>
                                            <div class="article-body">
                                                <h3 class="article-title"><a href="#">${NewsList[i].getHeading()}</a>
                                                </h3>
                                                <ul class="article-meta">
                                                    <li><i class="fa fa-clock-o"></i> ${NewsList[i].getLastModified()}</li>
                                                
                                                    <li>${NewsList[i].getAuthor()}</li>
                                                </ul>
                                                <p>${NewsList[i].getShortDescription()}</p>
                                            </div>
                                        </article>
                                        <!-- /ARTICLE -->
                                    </div>
                                </c:forEach>
                                <!-- /Column 1 -->
                            </div>
                            <!-- /2-ablove -->
                            <!-- 3-below -->
                            <div class="row">
                                <!-- Column 1 -->
                                <c:forEach var="i" begin="6" end="8">
                                    <div class="col-md-4 col-sm-4 section-article-2-3-below">
                                        <!-- ARTICLE -->
                                        <article class="article" ArticleID="${NewsList[i].getArticleID()}" CatID="${NewsList[i].getCategoryID()}" SubID="${NewsList[i].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(NewsList[i].getArticleID())}" alt="">
                                                </a>
                                                <ul class="article-info">
                                                    <li class="article-type"><i class="fa fa-file-text"></i></li>
                                                </ul>
                                            </div>
                                            <div class="article-body">
                                                <h4 class="article-title"><a href="#">${NewsList[i].getHeading()}</a>
                                                </h4>
                                                <ul class="article-meta two-rows-meta">
                                                    <li><i class="fa fa-clock-o"></i>${NewsList[i].getLastModified()}</li>                                         
                                                    <li class="author-name"> ${NewsList[i].getAuthor()}</li>
                                                </ul>
                                            </div>
                                        </article>
                                        <!-- /ARTICLE -->
                                    </div>  
                                </c:forEach>
                                <!-- /Column 1 -->

                            </div>
                            <!-- /3 below -->
                        </div>

                        <!-- /row article 2 3 -->
                        <!-- row  article 2 3-->
                        <div class="section-article-2-3">
                            <!-- 2-above -->
                            <div class="row">
                                <!-- section title -->
                                <div class="col-md-12">
                                    <div class="section-title">
                                        <a href="${pageContext.request.contextPath}/articles/World">
                                            <h2 class="title">WORLD</h2>
                                        </a>                                      
                                    </div>
                                </div>
                                <!-- /section title -->                               
                                <!-- Column 1 -->
                                <c:forEach var="i" begin="4" end="5">
                                    <div class="col-md-6 col-sm-6">
                                        <!-- ARTICLE -->
                                        <article class="article" ArticleID="${WorldList[i].getArticleID()}" CatID="${WorldList[i].getCategoryID()}" SubID="${WorldList[i].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(WorldList[i].getArticleID())}" alt="">
                                                </a>
                                                <ul class="article-info">
                                                    <li class="article-type"><i class="fa fa-camera"></i></li>
                                                </ul>
                                            </div>
                                            <div class="article-body">
                                                <h3 class="article-title"><a href="#">${WorldList[i].getHeading()}</a>
                                                </h3>
                                                <ul class="article-meta">
                                                    <li><i class="fa fa-clock-o"></i>${WorldList[i].getLastModified()}</li>
                                                
                                                    <li>${WorldList[i].getAuthor()}</li>
                                                </ul>
                                                <p>${WorldList[i].getShortDescription()}</p>
                                            </div>
                                        </article>
                                        <!-- /ARTICLE -->
                                    </div>
                                </c:forEach>

                                <!-- /Column 1 -->


                            </div>
                            <!-- /2-ablove -->
                            <!-- 3-below -->
                            <div class="row">
                                <!-- Column 1 -->
                                <c:forEach var="i" begin="6" end="8" >
                                    <div class="col-md-4 col-sm-4 section-article-2-3-below">
                                        <!-- ARTICLE -->
                                        <article class="article" ArticleID="${WorldList[i].getArticleID()}" CatID="${WorldList[i].getCategoryID()}" SubID="${WorldList[i].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(WorldList[i].getArticleID())}" alt="">
                                                </a>
                                                <ul class="article-info">
                                                    <li class="article-type"><i class="fa fa-file-text"></i></li>
                                                </ul>
                                            </div>
                                            <div class="article-body">
                                                <h4 class="article-title"><a href="#">${WorldList[i].getHeading()}</a>
                                                </h4>
                                                <ul class="article-meta two-rows-meta">
                                                    <li><i class="fa fa-clock-o"></i> ${WorldList[i].getLastModified()}</li>
                                                
                                                    <li class="author-name"> ${WorldList[i].getAuthor()}</li>
                                                </ul>
                                            </div>
                                        </article>
                                        <!-- /ARTICLE -->
                                    </div>
                                </c:forEach>
                                <!-- /Column 1 -->                              
                            </div>
                            <!-- /3 below -->
                        </div>

                        <!-- /row article 2 3 -->

                        <!-- row  article 2 3-->
                        <div class="section-article-2-3">
                            <!-- 2-above -->
                            <div class="row">
                                <!-- section title -->
                                <div class="col-md-12">
                                    <div class="section-title">
                                        <a href="${pageContext.request.contextPath}/articles/News">
                                            <h2 class="title">BUSINESS</h2>
                                        </a>

                                    </div>
                                </div>
                                <!-- /section title -->
                                <!-- Column 1 -->
                                <c:forEach var="i" begin="1" end="2">
                                    <div class="col-md-6 col-sm-6">
                                        <!-- ARTICLE -->
                                        <article class="article" ArticleID="${BusinessList[i].getArticleID()}" CatID="${BusinessList[i].getCategoryID()}" SubID="${BusinessList[i].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(BusinessList[i].getArticleID())}" alt="">
                                                </a>
                                                <ul class="article-info">
                                                    <li class="article-type"><i class="fa fa-camera"></i></li>
                                                </ul>
                                            </div>
                                            <div class="article-body">
                                                <h3 class="article-title"><a href="#">${BusinessList[i].getHeading()}</a>
                                                </h3>
                                                <ul class="article-meta">
                                                    <li><i class="fa fa-clock-o"></i>${BusinessList[i].getLastModified()}</li>
                                                
                                                    <li>${BusinessList[i].getAuthor()}</li>
                                                </ul>
                                                <p>${BusinessList[i].getShortDescription()}</p>
                                            </div>
                                        </article>
                                        <!-- /ARTICLE -->
                                    </div>
                                </c:forEach>

                                <!-- /Column 1 -->
                            </div>
                            <!-- /2-ablove -->
                            <!-- 3-below -->
                            <div class="row">
                                <!-- Column 1 -->
                                <c:forEach var="i" begin="3" end="5">
                                    <div class="col-md-4 col-sm-4 section-article-2-3-below">
                                        <!-- ARTICLE -->
                                        <article class="article" ArticleID="${BusinessList[i].getArticleID()}" CatID="${BusinessList[i].getCategoryID()}" SubID="${BusinessList[i].getSubCategoryID()}">
                                            <div class="article-img">
                                                <a href="#">
                                                    <img src="${imgLib.getThumbnail(BusinessList[i].getArticleID())}" alt="">
                                                </a>
                                                <ul class="article-info">
                                                    <li class="article-type"><i class="fa fa-file-text"></i></li>
                                                </ul>
                                            </div>
                                            <div class="article-body">
                                                <h4 class="article-title"><a href="#">${BusinessList[i].getHeading()}</a>
                                                </h4>
                                                <ul class="article-meta two-rows-meta">
                                                    <li><i class="fa fa-clock-o"></i>${BusinessList[i].getLastModified()}</li>
                                                
                                                    <li class="author-name"> ${BusinessList[i].getAuthor()}</li>
                                                </ul>
                                            </div>
                                        </article>
                                        <!-- /ARTICLE -->
                                    </div>                                    
                                </c:forEach>
                                <!-- /Column 1 -->
                            </div>
                            <!-- /3 below -->
                        </div>

                        <!-- /row article 2 3 -->

                        <div class="row">
                            <!-- Column 1 -->
                            <div class="col-md-6 col-sm-6">
                                <!-- section title -->
                                <div class="section-title">
                                    <a href="${pageContext.request.contextPath}/articles/Entertainment">
                                        <h2 class="title">Entertainment</h2>
                                    </a>
                                </div>
                                <!-- /section title -->

                                <!-- ARTICLE -->
                                <article class="article" ArticleID="${EnterList[1].getArticleID()}" CatID="${EnterList[1].getCategoryID()}" SubID="${EnterList[1].getSubCategoryID()}">
                                    <div class="article-img">
                                        <a href="#">
                                            <img src="${imgLib.getThumbnail(EnterList[1].getArticleID())}" alt="">
                                        </a>
                                        <ul class="article-info">
                                            <li class="article-type"><i class="fa fa-camera"></i></li>
                                        </ul>
                                    </div>
                                    <div class="article-body">
                                        <h3 class="article-title"><a href="#">${EnterList[1].getHeading()}</a>
                                        </h3>
                                        <ul class="article-meta">
                                            <li><i class="fa fa-clock-o"></i>${EnterList[1].getLastModified()}</li>
                                        
                                            <li>${EnterList[1].getAuthor()}</li>
                                        </ul>
                                        <p>${EnterList[1].getShortDescription()}</p>
                                    </div>
                                </article>
                                <!-- /ARTICLE -->

                                <!-- ARTICLE -->
                                <c:forEach var="i" begin="2" end="3">
                                    <article class="article widget-article" ArticleID="${EnterList[i].getArticleID()}" CatID="${EnterList[i].getCategoryID()}" SubID="${EnterList[i].getSubCategoryID()}">
                                        <div class="article-img">
                                            <a href="#">
                                                <img src="${imgLib.getThumbnail(EnterList[i].getArticleID())}" alt="">
                                            </a>
                                        </div>
                                        <div class="article-body">
                                            <h4 class="article-title"><a href="#">${EnterList[i].getHeading()}</a>
                                            </h4>
                                            <ul class="article-meta">
                                                <li><i class="fa fa-clock-o"></i> ${EnterList[i].getLastModified()}</li>
                                            
                                            </ul>
                                        </div>
                                    </article>
                                </c:forEach>

                                <!-- /ARTICLE -->

                                <!-- /ARTICLE -->
                            </div>
                            <!-- /Column 1 -->

                            <!-- Column 2 -->
                            <div class="col-md-6 col-sm-6">
                                <!-- section title -->
                                <div class="section-title">
                                    <a href="${pageContext.request.contextPath}/articles/Sport">
                                        <h2 class="title">Sport</h2>
                                    </a>
                                </div>
                                <!-- /section title -->

                                <!-- ARTICLE -->
                                <article class="article" ArticleID="${SportList[1].getArticleID()}" CatID="${SportList[1].getCategoryID()}" SubID="${SportList[1].getSubCategoryID()}">
                                    <div class="article-img">
                                        <a href="#">
                                            <img src="${imgLib.getThumbnail(SportList[1].getArticleID())}" alt="">
                                        </a>
                                        <ul class="article-info">
                                            <li class="article-type"><i class="fa fa-file-text"></i></li>
                                        </ul>
                                    </div>
                                    <div class="article-body">
                                        <h3 class="article-title"><a href="#">${SportList[1].getHeading()}</a>
                                        </h3>
                                        <ul class="article-meta">
                                            <li><i class="fa fa-clock-o"></i>${SportList[1].getLastModified()}</li>
                                        
                                            <li>${SportList[1].getAuthor()}</li>
                                        </ul>
                                        <p>${SportList[1].getShortDescription()}</p>
                                    </div>
                                </article>
                                <!-- /ARTICLE -->

                                <!-- ARTICLE -->
                                <c:forEach var="i" begin="2" end="3">
                                    <article class="article widget-article" ArticleID="${SportList[i].getArticleID()}" CatID="${SportList[i].getCategoryID()}" SubID="${SportList[i].getSubCategoryID()}">
                                        <div class="article-img">
                                            <a href="#">
                                                <img src="${imgLib.getThumbnail(SportList[i].getArticleID())}" alt="">
                                            </a>
                                        </div>
                                        <div class="article-body">
                                            <h4 class="article-title"><a href="#">${SportList[i].getHeading()}</a>
                                            </h4>
                                            <ul class="article-meta">
                                                <li><i class="fa fa-clock-o"></i>${SportList[i].getLastModified()}</li>
                                            
                                                <li>${SportList[i].getAuthor()}</li>
                                            </ul>
                                        </div>
                                    </article>
                                </c:forEach>

                                <!-- /ARTICLE -->
                            </div>
                            <!-- /Column 2 -->
                        </div>
                        <!-- /row -->

                    </div>
                    <!-- /Main Column -->

                    <!-- Aside Column -->
                    <div class="col-md-4">
                        <!-- Ad widget -->
                        <div class="widget center-block hidden-xs">
                            <img class="center-block" src="./img/ad-1.jpg" alt="">
                        </div>
                        <!-- /Ad widget -->

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

                        <!-- article widget -->
                        <div class="widget">
                            <div class="widget-title">
                                <a href="${pageContext.request.contextPath}/articles/Technology">
                                    <h2 class="title">TECHNOLOGY</h2>
                                </a>
                            </div>

                            <!-- owl carousel 3 -->
                            <div id="owl-carousel-1" class="owl-carousel owl-theme center-owl-nav">
                                <!-- ARTICLE -->
                                <c:forEach var="i" begin="1" end="3">
                                    <article class="article" ArticleID="${TechList[i].getArticleID()}" CatID="${TechList[i].getCategoryID()}" SubID="${TechList[i].getSubCategoryID()}">
                                        <div class="article-img">
                                            <a href="#">
                                                <img src="${imgLib.getThumbnail(TechList[i].getArticleID())}" alt="">
                                            </a>
                                            <ul class="article-info">
                                                <li class="article-type"><i class="fa fa-file-text"></i></li>
                                            </ul>
                                        </div>
                                        <div class="article-body">
                                            <h4 class="article-title"><a href="#">${TechList[i].getHeading()}</a>
                                            </h4>
                                            <ul class="article-meta">
                                                <li><i class="fa fa-clock-o"></i>${TechList[i].getLastModified()}</li>
                                            
                                                <li>${TechList[i].getAuthor()}</li>
                                            </ul>
                                        </div>
                                    </article>  
                                </c:forEach>

                                <!-- /ARTICLE -->
                            </div>
                            <!-- /owl carousel 3 -->                         
                            <!-- ARTICLE -->
                            <c:forEach var="i" begin="4" end="6"> 
                                <article class="article widget-article" ArticleID="${TechList[i].getArticleID()}" CatID="${TechList[i].getCategoryID()}" SubID="${TechList[i].getSubCategoryID()}" >
                                    <div class="article-img">
                                        <a href="#">
                                            <img src="${imgLib.getThumbnail(TechList[i].getArticleID())}" alt="">
                                        </a>
                                    </div>
                                    <div class="article-body">
                                        <h4 class="article-title"><a href="#">${TechList[i].getHeading()}</a></h4>
                                        <ul class="article-meta">
                                            <li><i class="fa fa-clock-o"></i> ${TechList[i].getLastModified()}</li>
                                        
                                            <li>${TechList[i].getAuthor()}</li>
                                        </ul>
                                    </div>
                                </article>
                            </c:forEach>
                            <!-- /ARTICLE -->

                        </div>
                        <!-- /article widget -->
                        <hr>
                        <div class="widget">
                            <div class="widget-title">
                                <a href="${pageContext.request.contextPath}/articles/Travel">
                                    <h2 class="title">TRAVEL</h2>
                                </a>
                            </div>

                            <!-- owl carousel 3 -->
                            <div id="owl-carousel-2" class="owl-carousel owl-theme center-owl-nav">
                                <!-- ARTICLE -->
                                <c:forEach var="i" begin="0" end="2">
                                    <article class="article" ArticleID="${TravelList[i].getArticleID()}" CatID="${TravelList[i].getCategoryID()}" SubID="${TravelList[i].getSubCategoryID()}">
                                        <div class="article-img">
                                            <a href="#">
                                                <img src="${imgLib.getThumbnail(TravelList[i].getArticleID())}" alt="">
                                            </a>
                                            <ul class="article-info">
                                                <li class="article-type"><i class="fa fa-file-text"></i></li>
                                            </ul>
                                        </div>
                                        <div class="article-body">
                                            <h4 class="article-title"><a href="#">${TravelList[i].getHeading()}</a>
                                            </h4>
                                            <ul class="article-meta">
                                                <li><i class="fa fa-clock-o"></i>${TravelList[i].getLastModified()}</li>
                                            
                                                <li>${TravelList[i].getAuthor()}</li>
                                            </ul>
                                        </div>
                                    </article>
                                </c:forEach>
                                <!-- /ARTICLE -->
                            </div>
                            <!-- /owl carousel 3 -->
                            <!-- ARTICLE -->
                            <c:forEach var="i" begin="3" end="5"> 
                                <article class="article widget-article" ArticleID="${TravelList[i].getArticleID()}" CatID="${TravelList[i].getCategoryID()}" SubID="${TravelList[i].getSubCategoryID()}">
                                    <div class="article-img">
                                        <a href="#">
                                            <img src="${imgLib.getThumbnail(TravelList[i].getArticleID())}" alt="">
                                        </a>
                                    </div>
                                    <div class="article-body">
                                        <h4 class="article-title"><a href="#">${TravelList[i].getHeading()}</a></h4>
                                        <ul class="article-meta">
                                            <li><i class="fa fa-clock-o"></i> ${TravelList[i].getLastModified()}</li>
                                        
                                            <li>${TravelList[i].getAuthor()}</li>
                                        </ul>
                                    </div>
                                </article>
                            </c:forEach>
                            <!-- /ARTICLE -->
                        </div>
                        <!-- /article widget -->
                        <hr>
                        <div class="widget">
                            <div class="widget-title">
                                <h2 class="title">EDUCATION</h2>
                            </div>
                            <c:forEach var="i" begin="1" end="3">
                                <div class="widget-single-article">
                                    <article class="article single-article" ArticleID="${EduList[i].getArticleID()}" CatID="${EduList[i].getCategoryID()}" SubID="${EduList[i].getSubCategoryID()}">
                                        <div class="single-article-img">
                                            <a href="#">
                                                <img src="${imgLib.getThumbnail(EduList[i].getArticleID())}" alt="">
                                            </a>
                                        </div>
                                        <div class="single-article-title">
                                            <h4 class="article-title"> <a href="#">${EduList[i].getHeading()}</a>
                                            </h4>
                                        </div>
                                        <div class="article-meta">
                                            <li><i class="fa fa-clock-o"></i> ${EduList[i].getLastModified()}</li>
                                        
                                            <li>${EduList[i].getAuthor()}</li>
                                        </div>
                                        <p>
                                            ${EduList[i].getShortDescription()}
                                        </p>
                                    </article>
                                </div>
                            </c:forEach>

                        </div>
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
            <img class="center-block" src="./img/ad-3.jpg" alt="">
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
                            <h2 class="title">Popular Video</h2>
                            <div id="nav-carousel-3" class="custom-owl-nav pull-right"></div>
                        </div>
                        <!-- /section title -->

                        <!-- owl carousel 2 -->
                        <div id="owl-carousel-3" class="owl-carousel owl-theme">
                            <!-- ARTICLE -->
                            <!--                            <article class="article thumb-article">
                                                            <div class="article-img">
                                                                <img src="./img/img-thumb-1.jpg" alt="">
                                                            </div>
                                                            <div class="article-body">
                                                                <ul class="article-info">
                                                                    <li class="article-category"><a href="#">News</a></li>
                                                                    <li class="article-type"><i class="fa fa-video-camera"></i></li>
                                                                </ul>
                                                                <h3 class="article-title"><a href="#">Duis urbanitas eam in, tempor consequat.</a></h3>
                                                                <ul class="article-meta">
                                                                    <li><i class="fa fa-clock-o"></i> January 31, 2017</li>
                                                                
                                                                </ul>
                                                            </div>
                                                        </article>-->
                            <!-- /ARTICLE -->

                        </div>
                        <!-- /owl carousel 2 -->
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
        <script src="js/index.js"></script>
        <script>

            $(function () {
                var context = "${pageContext.request.contextPath}";
                var catobj = {}
            <c:forEach var="cat" items="${CatMap}">
                catobj["${cat.key}"] = "${cat.value}"
            </c:forEach>
                $(".article").each(function () {
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