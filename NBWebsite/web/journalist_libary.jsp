<%-- 
    Document   : journalist_libary
    Created on : May 10, 2019, 4:42:10 PM
    Author     : quan1
--%>
<%@ include file="/init.jsp" %> 
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Libary</title>

    <%@ include file="/css.jsp" %> 
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/editor.css" />
    
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="/journalist_header.jsp" flush="true"/>

    <div id="wrapper">
        <jsp:include page="/journalist_navMenu.jsp" flush="true"/>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <div class="card-tools bg-white">
                    <div class="d-flex flex-row">
<!--                        <input class="mx-2 my-1" type="date" name="from" style="width:200px;">
                        <input class="mx-2 my-1" type="date" name="to" style="width:200px;">                        
                        <input class="text-lg btn-input mx-1" id="saveBtn" type="button" value="Search" />-->
                    </div>

                </div>

                <div class="card-tools-body">

                    <form id="form1" method="post" action="${pageContext.request.contextPath}/manage/journalist/libary" enctype="multipart/form-data" autocomplete="off">
                        <div id="listImage" class="row mx-3 my-3">
                            <label class="add-img-border mx-1 my-1" title="Choose files to upload" for="file" style="cursor: pointer;">
                                <i class="ml-6 mt-52 text-gray-600 fas fa-plus" style="font-size: 50px;"></i>
                                <input id="file" name="file" type="file" accept="file_extension|audio/*|video/*|image/*|media_type*" multiple="multiple" style="display: none;" size="60"/>
                                <label class="h5 text-gray-600 mt-2" for="file" style="margin-left: 3.3rem;">
                                    Add image
                                </label>
                            </label>
    
                        <c:forEach items="${sessionScope.fileNameAndSource}" var="item">
                            <a class="img-border mx-1 my-1" href="javascript:void(0)">
                                <img class="" src="${pageContext.request.contextPath}/${item.getValue()}" title="${item.getKey()}" height="180" width="200" />
                            </a>
                        </c:forEach>                                              
                            
                        </div>
                    </form>

                    <!--footer-->
                    <footer class="sticky-footer bg-white mt-5">
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
                        
    <!-- show image -->
    <div id="previewContainer" class="fullscreen-container">
        <a class="close-btn mr-3"><i class="fas fa-times"></i></a>
        <img id="previewImg" class="form-popup-img" />
        <a name="prev" class="btn-prev mx-2">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a name="next" class="btn-next mx-2">
            <i class="fas fa-chevron-right"></i>
        </a>
        <div class="border-list-image d-flex" id="listImg">
            <div style="width: 200px"></div>
            <div style="overflow:hidden; display: flex;" name="listImg">
                
            </div>
            <div class="ml-auto" style="width: 200px"></div>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>
    <script>
        var srcListImg = new Array();
        <c:forEach items="${sessionScope.fileNameAndSource}" var="item">
            srcListImg.push("${pageContext.request.contextPath}/${item.getValue()}");
        </c:forEach>;
            
        $(document).ready(function(){
            $("#accordionSidebar li[name = libary]").addClass("active"); 
            var cImg = $(".img-border > img:visible");
            if (cImg.length < 12){
                $("footer").addClass("bottom-fixed");
            } else{
                $("footer").removeClass("bottom-fixed");
            }
        });
        //animation to move image
    function imgMove(clickImgPos) {
        var n = srcListImg.length; //the number of array's elements 

        if (n >= 17) { //17 image thumnails
            //alert(clickImgPos);
            if (clickImgPos < n - 8 && clickImgPos >= 8) {
                //alert("acb");
                var rLeft = n - 9 - clickImgPos; //rest of left
                $("#listImg img").animate({
                    left: rLeft * -78  //move left
                });
            } else if (clickImgPos < 8) {
                var fLeft = n - 1 - 15; //fixed left
                $("#listImg img").animate({
                    left: fLeft * -78  //move left
                });
            } else if (clickImgPos >= n - 8) {
                $("#listImg img").animate({
                    left: "0px"
                });
            }
        }
    };
    
    //draw list of images into div[name = listImg] depend on array srcListImg
    function handleListImg() {
        $("#listImg div[name = listImg] img").remove();
        for (var i = srcListImg.length - 1; i >= 0; i--) {
            var img = $('<img/>', {
                class: "aImage mx-1 my-1",
                src: srcListImg[i]
            }).appendTo("#listImg div[name = listImg]").click(function () {
                $("#previewImg").attr({ 'src': $(this).attr('src'), 'target': $(this).attr('target') });
                $("#listImg img").css('opacity', '0.4');
                $(this).css('opacity', '1');
                var clickImgPos = jQuery.inArray($(this).attr('src'), srcListImg);
                //alert(clickImgPos + " " + srcListImg.length);
                    imgMove(clickImgPos);
                });
        }
        //alert(srcListImg.length);
    };
    
    function prevMove(){
        var n = srcListImg.length;
        var PreImgPos = jQuery.inArray($("#previewImg").attr('src'), srcListImg);
        if (PreImgPos >= 0) {
            $("#previewImg").attr({ 'src': srcListImg[PreImgPos + 1] });
            $("#listImg img").css('opacity', '0.4');
            $("#listImg div[name = listImg] img").eq(n - 1 - PreImgPos - 1).css('opacity', '1');
            if (n >= 17) {
                if (PreImgPos < 8) {
                    var fLeft = n - 1 - 15; //fixed left
                    $("#listImg img").animate({
                        left: fLeft * -78
                    });
                } else if (PreImgPos >= n - 8) {
                    $("#listImg img").animate({
                        left: "0px"
                    });
                } else {
                    $("#listImg img").animate({
                        left: '+=78px'
                    });
                }
            }
        }
    }
    
    function nextMove(){
        var n = srcListImg.length;
        var PreImgPos = jQuery.inArray($("#previewImg").attr('src'), srcListImg);
        if (PreImgPos >= 0) {
            $("#previewImg").attr({ 'src': srcListImg[PreImgPos - 1] });
            $("#listImg img").css('opacity', '0.4');
            $("#listImg div[name = listImg] img").eq(n - 1 - PreImgPos + 1).css('opacity', '1');
            if (n >= 17) {
                if (PreImgPos < 8) {
                    var fLeft = n - 1 - 15; //fixed left
                    $("#listImg img").animate({
                        left: fLeft * -78
                    });
                } else if (PreImgPos >= n - 8) {
                    $("#listImg img").animate({
                        left: "0px"
                    });
                } else {
                    $("#listImg img").animate({
                        left: '-=78px'
                    });
                }
            }
        }
    }
    
    //go to previous image
    $("a[name = prev]").click(function () {
        prevMove();

    });

    //go to new image
    $("a[name = next]").click(function () {
        nextMove();
        
    });
    
    $(document).keydown(function(e){
    if (e.keyCode === 37) {
       prevMove();
    } else if (e.keyCode === 39){
        nextMove();
    }
    });
    
    //$(document).keydown(function (evt) { alert(evt.which); });
    
    $(".img-border > img").click(function(){
        //alert("acb");
        handleListImg();
        $("#previewImg").attr({ 'src': $(this).attr('src'), 'target': $(this).attr('target') });
        $("#previewContainer").css({ "display": "block", "opacity": "1" });

        var clickImgPos = jQuery.inArray($(this).attr('src'), srcListImg);
        $("#listImg img").css('opacity', '0.4');
        $("#listImg div[name = listImg] img").eq(srcListImg.length - 1 - clickImgPos).css('opacity', '1');
        //alert(clickImgPos + " " + srcListImg.length);

        imgMove(clickImgPos);
    });
    
    $("#file").on('change', function(){
        var form = $("#form1")[0];
        var data = new FormData(form);
       $.ajax({
            type: "post",
            encType : "multipart/form-data",
            url : "${pageContext.request.contextPath}/manage/journalist/libary",
            cache : false,
            processData : false,
            contentType : false,
            data: data,
                        
            success: function(responseJson){
                $.each(responseJson, function(key, value){
                        //alert(value);
                        var source = "${pageContext.request.contextPath}/" + value;
                        srcListImg.push(source);
                        var a = $('<a/>', {
                            class: "img-border mx-1 my-1",
                            href: "javascript:void(0)"
                        }).appendTo($('#listImage'));
                        setTimeout(function(){
                        $('<img/>', {
                            src: source,
                            height: "180px",
                            width: "200px"
                        }).appendTo(a);    
                        }, 1700);
                        
                    });
            },
            error : function(msg) {
                alert("Couldn't upload file, error: " + msg);
            }
        }); 
    });
    </script>
</body>
</html>
