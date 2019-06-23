<%-- 
    Document   : journalist_compose
    Created on : May 4, 2019, 9:57:19 AM
    Author     : quan1
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>${title}</title>

     <%@ include file="/css.jsp" %> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/editor.css" />

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>    
    <jsp:include page="/journalist_header.jsp" flush="true"/>

    <div id="wrapper">
        <!--Menu-->
        <jsp:include page="/journalist_navMenu.jsp" flush="true"/>
        <form id="form1" method="post" action="${pageContext.request.contextPath}/manage/journalist/compose" enctype="multipart/form-data">
            <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

                <div class="container-fluid">
                    <!-- Page Heading-->
                    <div class="d-sm-flex align-items-center justify-content-center mb-4">
                        <h1 class="h3 mb-0 mr-auto text-gray-800 float-left">Compose</h1>
                    </div>
                    <!--Content-->
                    <div class="row">
                        <div class="col-xl-9 mb-4">
                            <div class="form-group">
                                <input class="shadow form-subject form-control-subject font-weight-bold" id="subjectInput" name="subjectInput" type="text" placeholder="Subject" />
                            </div>
                            <div>
                                <button id="addImgTopic" type="button" class="mr-auto d-inline-block btn btn-sm btn-primary shadow-sm px-3 py-1" data-toggle="modal" data-target="#addImgModal" data-backdrop="static" data-keyboard="true">
                                    <i class=" mr-2 fas fa-upload"></i>
                                    Insert Image Topic
                                </button>
    <div class="modal fade" id="addImgModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog-11">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h5 class="modal-title text-gray-900">Insert image</h5>
                    
                </div>
                <div class="modal-body">                    
                    
                    <div class="row">
                        <div id="imgErrMsg" style="width: 100%;"></div>
                        <div class="tabbable tabs-left">
                            <ul class="nav nav-tabs">
                                <li name='articleImage' class="">
                                    <a aria-expanded="true" href="#prevArticleImg" data-toggle="tab">Article Image</a>
                                </li>
                                <li name='fromComputer' class="active">
                                    <a aria-expanded="true" href="#uploadImageBar" data-toggle="tab">From Computer</a>
                                </li>
                                <li class="">
                                    <a aria-expanded="true" href="#imageFromLibary" data-toggle="tab">From Libary</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane" id="prevArticleImg">
                                <div class="PrevArticleImgForm row ml-auto mt-2" name="addMoreImg">                        
                                    <c:forEach items="${listImageArticle}" var="image">
                                        <c:choose>
                                            <c:when test="${image.getThumbnail() == 1}">
                                                <a class="ImgPreviewModal my-1 mx-1" href="javascript:void(0)" title="Image Topic">
                                                    <img class="" src="${pageContext.request.contextPath}/${image.getSource()}" height="120" width="150"/>
                                                </a>
                                                <input type='hidden' name='prevTopicImg' value="${pageContext.request.contextPath}/${image.getSource()}">
                                            </c:when>
                                            <c:otherwise>
                                                <a class="ImgPreviewModal my-1 mx-1" href="javascript:void(0)">
                                                    <img class="" src="${pageContext.request.contextPath}/${image.getSource()}" height="120" width="150"/>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        
                                    </c:forEach> 
                                </div>
                            </div>
                            <div class="tab-pane active" id="uploadImageBar">
                                <input class="inline-form-control" type="file" id="videoImage" name="videoImage" accept="file_extension|audio/*|video/*|image/*|media_type*" size="60" style="width: 400px"/>
                                <div name="previewTopicImg" class="ImgPreviewModal my-4 ml-3" style="display: none">
                                    <img id="previewTopicImg" class="mx-0" width="150" height="120"/>
                                </div>
                                <div name="loader" class="mt-5 mb-4 ml-6"></div>
                            </div>
                            <div class="tab-pane" id="imageFromLibary">
                                <div class="addImgForm row ml-auto mt-2" name="addMoreImg">                        
                                    <c:forEach items="${sessionScope.listImage}" var="item">
                                        <a class="ImgPreviewModal my-1 mx-1" href="javascript:void(0)">
                                            <img class="" src="${pageContext.request.contextPath}/${item.getSource()}" height="120" width="150"/>
                                        </a>
                                    </c:forEach> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <button id="InsertImgDone" class="btn btn-success" type="button">Done</button>
                    
                </div>
            </div>
        </div>
    </div>
<!--                                <input type="file" id="file" name='file' value='editorImg' accept="file_extension|audio/*|video/*|image/*|media_type*" style="display: none"/> -->
<!--                                <input type="file" data-role="magic-overlay" data-target="#addImg" data-edit="insertImage" />-->
                            </div>
                            <div class="container">
                                <div class="row">

                                    <div class="col-lg-12 nopadding text-gray-800">
                                        <textarea id="txtEditor" class="form-subject form-control-subject"></textarea>
                                    </div>
                                        <input type="hidden" name="selectedVehicles" id="selectedVehicles"/>
                                        <input type="hidden" name="ArticleID"/>
                                        <input type="hidden" name="ArticleStatus"/>
                                        <input type="hidden" name="journalistID"/>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mt-4">
                                    <button type='button' id="saveArticle" name='save' value="Article" class="ml-3 mr-5 btn btn-sm btn-primary shadow-sm" title="Save as uncensored article">Save Article</button>
                                    <button type='button' id="saveDraft" name='save' value="Draft" class="mr-auto btn btn-sm btn-primary shadow-sm" title="Save as draft">Save Draft</button>                                     
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="card shadow mb-3">
                                <!--Card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Post</h6>
                                </div>
                                <!--card body-->
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-center mb-1">
                                        <a name="btnPreview" class="mr-auto btn btn-sm btn-primary shadow-sm">Preview</a>                                        
                                    </div>
                                    
                                    <div id="previewContainer" class="fullscreen-container">
                                        <a class="close-btn mr-3"><i class="fas fa-times"></i></a>
                                        <div id="preview" class="form-popup">
                                            <div id="sign-up-header" class="form-popup-header">
                                                <h3 class="text-gray-800">Preview</h3>

                                            </div>
                                            <div class="pre-content flex-column">
                                                <div class="form-popup-form">
                                                    <img name="topicImg" class="mx-2 my-2" height="400" width="100%" />
                                                    <h3 name="subjectAr" class="font-weight-bold text-gray-900">anh yeu am</h3>
                                                    <h6 name="timeAr" class="text-gray-400 mt-0" style="text-transform:uppercase;"></h6>
                                                    <div class="mt-4 text-gray-900" name="contentAr"></div>
                                                    <div class="d-flex mt-4">
                                                        <a name="cate1" class="px-3 py-1" href="javascript:void(0)" style="border: 1px solid;">World</a>
                                                        <a name="cate2" class="ml-1 px-3 py-1" href="javascript:void(0)" style="border: 1px solid;">Asia</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-1 ml-0">
                                            <i class="fas fa-map-pin"></i>
                                        </div>
                                        <div class="text-gray-900">Status: <b>Draft</b> <a class="ml-1" href="#">edit</a></div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-1 ml-0">
                                            <i class="fas fa-eye"></i>
                                        </div>
                                        <div class="text-gray-900">Sharing: <b>Public </b> <a class="ml-1" href="#">edit</a></div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-1">
                                        <div class="col-1 ml-0">
                                            <i class="fas fa-calendar-alt"></i>
                                        </div>
                                        <div class="text-gray-900">Upload: <b>Now</b> <a class="ml-1" href="#">edit</a></div>
                                    </div>
                                    <div class="row no-gutters align-items-center mb-2">
                                        <div class="col-1 ml-0">
                                            <i class="fab fa-vimeo-v"></i>
                                        </div>
                                        <div class="text-gray-900">Readability:<b>Need improvement</b> </div>
                                    </div>
                                </div>
                            </div>                            

                            <div id="categories" class="card shadow mb-4">
                                <!--Card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Categories</h6>
                                </div>
                                <!--card body-->
                                <div class="card-body card-scroll">
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb1" type="checkbox" name="category" value="News"/>
                                        <label class="text-gray-900">News</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb2" type="checkbox" name="category" value="World"/>
                                        <label class="text-gray-900">Wolrd</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Africa"/>
                                        <label class="text-gray-900">Africa</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Americas"/>
                                        <label class="text-gray-900">Americas</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Asia"/>
                                        <label class="text-gray-900">Asia</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Australian"/>
                                        <label class="text-gray-900">Australian</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb02" type="checkbox" name="category" value="Europe"/>
                                        <label class="text-gray-900">Europe</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb3" type="checkbox" name="category" value="Business"/>
                                        <label class="text-gray-900">Business</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb03" type="checkbox" name="category" value="Economy"/>
                                        <label class="text-gray-900">Economy</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb03" type="checkbox" name="category" value="Industries"/>
                                        <label class="text-gray-900">Industries</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb03" type="checkbox" name="category" value="Companies"/>
                                        <label class="text-gray-900">Companies</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb4" type="checkbox" name="category" value="Education"/>
                                        <label class="text-gray-900">Education</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb5" type="checkbox" name="category" value="Entertainment"/>
                                        <label class="text-gray-900">Entertainment</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb05" type="checkbox" name="category" value="Celebrity"/>
                                        <label class="text-gray-900">Celebrity</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb05" type="checkbox" name="category" value="Music"/>
                                        <label class="text-gray-900">Music</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb05" type="checkbox" name="category" value="Fashion"/>
                                        <label class="text-gray-900">Fashion</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb6" type="checkbox" name="category" value="Sport"/>
                                        <label class="text-gray-900">Sport</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb06" type="checkbox" name="category" value="Football"/>
                                        <label class="text-gray-900">Football</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb06" type="checkbox" name="category" value="Tennis"/>
                                        <label class="text-gray-900">Tennis</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb06" type="checkbox" name="category" value="Others"/>
                                        <label class="text-gray-900">Others</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb7" type="checkbox" name="category" value="Technology"/>
                                        <label class="text-gray-900">Technology</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb07" type="checkbox" name="category" value="Product"/>
                                        <label class="text-gray-900">Product</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb07" type="checkbox" name="category" value="Technology life"/>
                                        <label class="text-gray-900">Technology life</label>
                                    </div>

                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-0 radio chb8" type="checkbox" name="category" value="Travel"/>
                                        <label class="text-gray-900">Travel</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb08" type="checkbox" name="category" value="Place"/>
                                        <label class="text-gray-900">Place</label>
                                    </div>
                                    <div class="row no-gutters mb-1">
                                        <input class="col-2 ml-4 radio chb08" type="checkbox" name="category" value="Food"/>
                                        <label class="text-gray-900">Food</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card shadow">
                                <!--card header-->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Note</h6>
                                </div>
                                <!--card body-->
                                <div class="card-mess-body">
                                    <div id="prevMessage" class="row-message Previous-message-form">
                                        <c:set  var="admin" value="${AdminEditor}"></c:set>
                                        <c:forEach items="${listMessage}" var="mess">
                                            <c:choose>
                                                <c:when test="${admin.get(mess.getSenderID()) == null}">
                                                    <div class="col-12 mt-2 mr-3" >
                                                        <p class="small messageSend my-0 pr-2" title="${mess.getDateCreated()}" >${mess.getContent()}</p>    
                                                    </div>
                                                </c:when>
                                                <c:when test="${admin.get(mess.getSenderID()) != null}">
                                                    <div class="col-12 ml-1 mt-2 d-flex" >
                                                        <c:choose>
                                                            <c:when test="${admin.get(mess.getSenderID()).getProfilePicture() == null}">
                                                                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/img/profilepic/pric1.png">
                                                            </c:when>
                                                            <c:when test="${admin.get(mess.getSenderID()).getProfilePicture() != null}">
                                                                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/${admin.get(mess.getSenderID()).getProfilePicture()}">
                                                            </c:when>
                                                        </c:choose>
                                                        
                                                        <p class="ml-1 small messageReceive my-0 pl-2" title="${mess.getDateCreated()}" >${mess.getContent()}</p>
                    
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                        
                                    </div>
                                    <div class="form-group">
                                        <textarea id="note" name="note" onkeyup="new do_resize(this);" class="form-mess-subject textareaImputMess mt-2" rows="1"></textarea>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-7 mb-4">
                            
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
        </form>
        
    </div>

    
    <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>
    <script src="${pageContext.request.contextPath}/js/editor.js"></script>
    <script>
        $(document).ready(function () {
            $("#accordionSidebar li[name = dropdown]").addClass("active"); 
            $("#compose").addClass("active"); 
            $("#txtEditor").Editor();
        });
    </script>
    <script>
        var buttonClick = 0; //0: addImgTopic & 1: addImg
        var keyImg = 0; //0: from libary & 1: from computer
        var source;
        var sourcechosen = null;
    $("#addImgTopic").click(function(){
        buttonClick = 1;
    });
    
    $('button[name = save]').click(function(){
        var error = 0;
        var content = $(".Editor-editor").html();
        //alert(content);
        $("#selectedVehicles").val(content);
        var subject = $("#subjectInput").val();
        var countCb = $("#categories div > input:checked").length;  //number of checkboxes checked

        if (subject === '') {  //subject
            alert("Please entering the article subject");
            error = 1;
            return;
        }; 
        
//        if ($("input[name=videoImage]").get(0).files.length === 0){
//            alert("Please choosing an image topic!");
//            error = 1;
//            return;
//        }

        if (content === '<br>') {  //content
            alert("Please entering the article content!");
            error = 1;
            return;
        };

        if (countCb === 0) {   //categories
            alert("Please choosing category of the articles");
            error = 1;
            return;
        };

        if (error === 0)
        {
            //$("#form1").submit();
            $(this).attr("type", "submit");
        }
    });
    
    function InsImg(srcImgCurrent) {
                        //methods.restoreSelection.apply(this);
                        if (srcImgCurrent) {
                                document.execCommand('insertimage', false, srcImgCurrent);
                                $(".Editor-editor img").css({ 'max-height': '550px', 'max-width': '800px' }); 
//                                var div = $('<div/>').appendTo('.Editor-editor');
//                                var image = $('<img/>',{
//                                    src: srcImgCurrent,
//                                    style: "max-height:550px; max-width: 800px"
//                                                                                                                               
//				}).appendTo(div);
                        }
                        else {
                            alert('Please insert again!!!');
                            return false;
                        }

                        //$(this).data("editor").focus();
                }
                $("#videoImage").on('change', function () {
                    //$("#form1").submit();
                    var form = $("#form1")[0];
                    var data = new FormData(form);
                    $.ajax({
                        type: "post",
                        encType : "multipart/form-data",
                        url : "${pageContext.request.contextPath}/manage/journalist/compose",
                        cache : false,
                        processData : false,
                        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                        data: jQuery.param({buttonClick: buttonClick}),
                        
                        success: function(){
                            
                        },
                        error : function(msg) {
                            alert("Couldn't send button click, error: " + msg);
                        }
                    });
                    $.ajax({
                        type: "post",
                        encType : "multipart/form-data",
                        url : "${pageContext.request.contextPath}/manage/journalist/compose",
                        cache : false,
                        processData : false,
                        contentType : false,
                        data: data,
                        
                        success: function(responseText){
                            source = "${pageContext.request.contextPath}/" + responseText;  
                            $("div[name = previewTopicImg]").css('display', 'none');
                            $("div[name = loader]").addClass("loader");
                            setTimeout(function(){ 
                                $("#previewTopicImg").attr('src', source);
                                $("div[name = previewTopicImg]").css('display', 'block');
                                $("div[name = loader]").removeClass("loader");
                            }, 2000);
                            
                            keyImg = 1;
                        },
                        error : function(msg) {
                            alert("Couldn't upload file, error: " + msg);
                        }
                    });
                    
                });
    
    $(".ImgPreviewModal").click(function(){
        $(".ImgPreviewModal").css('border-color', '#ddd');
        $(this).css('border-color', 'blue');
        
        sourcechosen = $(this).children().attr('src');
    });
    
    $("#InsertImgDone").click(function(){
        //var error = 0;
        if (sourcechosen === null){            
            var message = "Please select an image.";
            var errorDiv=$('<div/>',{ class:"alert alert-danger"	}
				).append($('<button/>',{
									type:"button",
									class:"close",
									"data-dismiss":"alert",
									html:"x"
				})).append($('<span/>').html(message));
			errorDiv.appendTo($('#imgErrMsg'));
			setTimeout(function() { $('.alert').alert('close'); }, 3000);	
            return;
        }
        
        if (keyImg === 1){
            if (source !== sourcechosen){
                    $.ajax({
                        type: "post",
                        encType : "multipart/form-data",
                        url : "${pageContext.request.contextPath}/manage/journalist/compose",
                        cache : false,
                        processData : false,
                        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                        data: jQuery.param({
                            keyImg: keyImg, 
                            source: source,
                            sourcechosen: sourcechosen,
                            buttonClick2: buttonClick
                        }),
                        
                        success: function(){
                            
                        },
                        error : function(msg) {
                            alert("Couldn't delete file, error: " + msg);
                        }
                    });
            }        
        } else if (keyImg === 0){
                    $.ajax({
                        type: "post",
                        encType : "multipart/form-data",
                        url : "${pageContext.request.contextPath}/manage/journalist/compose",
                        cache : false,
                        processData : false,
                        contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                        data: jQuery.param({
                            keyImg: keyImg, 
                            sourcechosen: sourcechosen,
                            buttonClick2: buttonClick
                        }),
                        
                        success: function(){
                            
                        },
                        error : function(msg) {
                            alert("Couldn't delete file, error: " + msg);
                        }
                    });
        }
        
        if (buttonClick === 0 ){
            InsImg(sourcechosen);
        }
        if (buttonClick === 1 ){ //set image at preview form
            $("img[name = topicImg]").attr({ 'src': sourcechosen});
        }
        $("#addImgModal").modal('toggle');
        $(".ImgPreviewModal").css('border-color', '#ddd');
        keyImg = 0;
        sourcechosen = null;
    });
    
    function do_resize(textbox) {

        var maxrows=4; 
        var txt=textbox.value;
        var cols=textbox.cols;

        var arraytxt=txt.split('\n');
        var rows=arraytxt.length; 

        for (i=0;i<arraytxt.length;i++) 
            rows+=parseInt(arraytxt[i].length/cols);

        if (rows>maxrows) textbox.rows=maxrows;
            else textbox.rows=rows;
        
        $("#note").trigger('heightChange');
    }
    
    $("#note").bind('heightChange', function(){
        var height = $(this).height();
        var PrevHeight = 250 - height - 10;
        $("#prevMessage").css('height', PrevHeight);
    });
    
    <c:set  var="article" value="${Article}"></c:set>
    <c:set  var="cate" value="${sessionScope.listCate}"></c:set>
    $(document).ready(function(){
        var heading = "${article.getHeading()}";
        
        if (heading !== ""){
            $("img[name = topicImg]").attr({ 'src': $("input[name = prevTopicImg]").val()});
            
            $("li[name = articleImage]").css('display', 'block');
            $("li[name = articleImage]").addClass("active");
            $("#prevArticleImg").addClass("active");
            $("li[name = fromComputer]").removeClass("active");
            $("#uploadImageBar").removeClass("active");
            
            $("input[name = journalistID]").val(${article.getJournalistID()});
            
            var LastModified = new Date(Date.parse("${article.getDateCreated()}"));
            $("h6[name = timeAr]").text(LastModified.toDateString());
            $("input[name = ArticleID]").val(${article.getArticleID()});
            $("input[name = ArticleStatus]").val(${article.getDraft()});
            $("#subjectInput").val(heading);
            var editor = `${article.getShortDescription()}${article.getContent()}`;
            $(".Editor-editor").append(editor);
            $("input[value = ${cate.get(article.getCategoryID())}]").prop('checked', true);
            $("input[value = ${cate.get(article.getSubCategoryID())}]").prop('checked', true);                  
                        
            
        } else{
            $("li[name = articleImage]").css('display', 'none');
            $("li[name = fromComputer]").addClass("active");
            $("#uploadImageBar").addClass("active");
        }
                
    });
    </script>
</body>              
</html>
