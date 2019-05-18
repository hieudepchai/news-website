// JavaScript source code

//dropdown of alert button and profile icon (right side)
function fadeIn(el) {
    el.style.opacity = 0;
    el.style.display = "block";

    (function fade() {
        var val = parseFloat(el.style.opacity);
        if (!((val += 0.1) >= 1.1)) {
            el.style.opacity = val;
            requestAnimationFrame(fade);
        }
    }());
}

function fadeOut(el) {
    (function fade() {
        var val = parseFloat(el.style.opacity);
        if ((val -= 0.1) == 0) {
            el.style.opacity = 0;
            el.style.display = "none";
        } else {
            el.style.opacity = val;
            requestAnimationFrame(fade);
        }
    }());
}

// Initialise all the required variables
var btn = document.querySelectorAll(".dropdown-toggle");

/*
 *	Button click event listeners
 *	Keeps track of the button click.
 */
btn.forEach(function (btn) {
    btn.addEventListener("click", function (e) {
        e.stopPropagation();
        var sibling = btn.nextElementSibling,
            firstVisible = document.querySelector('.show'),
            dropDown;

        /*
         * Remove the visible class if an element is already in the DOM
         */


        if (!sibling.classList.contains("show")) {
            btn.setAttribute('aria-expanded', true);
            sibling.classList.add("show");
            sibling.setAttribute('aria-hidden', false);
            //fadeIn(sibling);


        } else if (sibling.classList.contains("show")) {
            btn.setAttribute('aria-expanded', false);
            sibling.classList.remove("show");
            sibling.setAttribute('aria-hidden', true);
            //fadeOut(sibling);

        }

        if (firstVisible) {
            //fadeOut(firstVisible);
            firstVisible.classList.remove("show");
            firstVisible.setAttribute('aria-hidden', true);
            firstVisible.previousElementSibling.setAttribute('aria-expanded', false);
        }
    });
});
document.addEventListener("click", function () {
    var visible = document.querySelector('.show');

    if (visible) {
        visible.classList.remove('show');
        visible.setAttribute('aria-hidden', true);
        visible.previousElementSibling.setAttribute('aria-expanded', false);
        //fadeOut(visible);

    }
});


(function ($) {
    "use strict"; // Start of use strict

    function toggle() {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
        if ($(".sidebar").hasClass("toggled")) {
            $('.sidebar .collapse').collapse('hide');
        };

        if ($("li[name=article] > a").hasClass("pl-4")) {
            $("li[name=article] > a").removeClass("pl-4");
        }
        else
            $("li[name=article] > a").addClass("pl-4");

        if ($("li[name=feedback] > a").hasClass("pl-4")) {
            $("li[name=feedback] > a").removeClass("pl-4");
        }
        else
            $("li[name=feedback] > a").addClass("pl-4");
    }

    // Toggle the side navigation
    $("#sidebarToggle, #sidebarToggleTop").on('click', function (e) {
        toggle();
        if ($(this).hasClass('active'))
            $(this).removeClass("active");
        else
            $(this).addClass("active");

        $("#accordionSidebar").hover(function () {
            if ($(this).hasClass("toggled")) {
                $("body").removeClass("sidebar-toggled");
                $(this).removeClass("toggled");

                $("li[name=article] > a").addClass("pl-4");
                $("li[name=feedback] > a").addClass("pl-4");
            }
        }, function () {
            toggle();
        });
    });

    // Close any open menu accordions when window is resized below 768px
    $(window).resize(function () {
        if ($(window).width() < 768) {
            $('.sidebar .collapse').collapse('hide');
        };
    });

    // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
    $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function (e) {
        if ($(window).width() > 768) {
            var e0 = e.originalEvent,
                delta = e0.wheelDelta || -e0.detail;
            this.scrollTop += (delta < 0 ? 1 : -1) * 30;
            e.preventDefault();
        }
    });

    // Scroll to top button appear
    $(document).on('scroll', function () {
        var scrollDistance = $(this).scrollTop();
        if (scrollDistance > 100) {
            $('.scroll-to-top').fadeIn();
        } else {
            $('.scroll-to-top').fadeOut();
        }
    });

    // Smooth scrolling using jQuery easing
    $(document).on('click', 'a.scroll-to-top', function (e) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top)
        }, 1000, 'easeInOutExpo');
        e.preventDefault();
    });

    // Dropdown of article
    $("a[name = dropdownAr]").click(function () {
        if ($(this).hasClass("collapsed")) {
            $(this).removeClass("collapsed");
            $("li[name = article]").removeClass("d-none");
            $("li[name = article]").addClass("d-block");
        }
        else {
            $(this).addClass("collapsed");
            $("li[name = article]").addClass("d-none");
            $("li[name = article]").removeClass("d-block");
        }
    })

    //close button of preview form
    $(".close-btn").click(function () {
        $("#previewContainer").css({ "display": "none", "opacity": "1" });
    })
    $(document).keyup(function (e) {
        //if (e.keyCode === 13) $('.save').click();     // enter
        if (e.keyCode === 27) $('.close-btn').click();   // esc
    });

    //count the number of div.aline visible
    function countItem() {
        var matched = $(".aline:visible");
        return matched.length;
    }

    //-----------------------------compose-writer----------------------------------
    //checkbox in categories
    $(".chb1, .chb2, .chb3, .chb4, .chb5, .chb6, .chb7, .chb8, .chb02, .chb03, .chb05, .chb06, .chb07, .chb08").change(function () {
        $(".chb1, .chb2, .chb3, .chb4, .chb5, .chb6, .chb7, .chb8, .chb02, .chb03, .chb05, .chb06, .chb07, .chb08").prop('checked', false);
        $(this).prop('checked', true);
    });
    $(".chb02").change(function () {
        $(".chb2").prop('checked', true);
    });
    $(".chb03").change(function () {
        $(".chb3").prop('checked', true);
    });
    $(".chb05").change(function () {
        $(".chb5").prop('checked', true);
    });
    $(".chb06").change(function () {
        $(".chb6").prop('checked', true);
    });
    $(".chb07").change(function () {
        $(".chb7").prop('checked', true);
    });
    $(".chb08").change(function () {
        $(".chb8").prop('checked', true);
    });

    //input a image and load into preview form
    $("input[name=videoImage]").on('change', function (evt) {
        var files = evt.target.files; // FileList object
//        for (var i = 0, f; f = files[i]; i++) {
//            //Loop thorugh all the files
//            if (!f.type.match('image.*') || !f.name.match(/(?:gif|jpg|png|jpeg)$/)) { //Process only Images
//                methods.showMessage.apply(this, ["imgErrMsg Invalid file type"]);
//                continue;
//            }
//            var reader = new FileReader();
//            reader.onload = (function (imageFile) {
//                return function (e) {
//                    $("img[name = topicImg]").attr({ 'src': e.target.result, 'title': escape(imageFile.name) });
//                }
//            })(f);
//            reader.readAsDataURL(f);
//        }
        var reader = new FileReader();
        reader.onload = (function (imageFile) {
            return function (e) {
                $("img[name = topicImg]").attr({ 'src': e.target.result, 'title': escape(imageFile.name) });
            };
        })(files[0]);
        reader.readAsDataURL(files[0]);
    });

    //check condition to open preview form
    $("a[name = btnPreview]").click(function () {
        var error = 0;
        var subject = $("#subjectInput").val();
        var content = $(".Editor-editor").html();
        var dNow = new Date();
        var countCb = $("#categories div > input:checked").length;  //number of checkboxes checked

        if (subject === '') {  //subject
            alert("Please entering the article subject");
            error = 1;
            return;
        } else {
            $("h3[name = subjectAr]").text(subject);
        }

        if ($("img[name = topicImg]").attr('src') === null) {  //image topic
            alert("Please choosing an image topic!");
            error = 1;
            return;
        }

        $("h6[name = timeAr]").text(dNow.toDateString());

        if (content === '<br>') {  //content
            alert("Please entering the article content!");
            error = 1;
            return;
        } else {
            //alert(content);
            $("div[name = contentAr]").text("");
            $("div[name = contentAr]").children().remove();
            $("div[name = contentAr]").append(content);
        }

        if (countCb === 1) {   //categories
            var cate = $("#categories div > input:checked").next().text();
            $("a[name = cate1]").text(cate);
            $("a[name = cate2]").hide();
        } else if (countCb === 2) {

            $("a[name = cate1]").text($("#categories div > input:checked").eq(0).next().text());
            $("a[name = cate2]").text($("#categories div > input:checked").eq(1).next().text());
        } else {
            alert("Please choosing category of the articles");
            error = 1;
            return;
        }

        if (error === 0)
            $("#previewContainer").css({ "display": "block", "opacity": "1" });
    });
    //-----------------------------------------------------------------------------

    //-----------------------------libary-writer-----------------------------------
    var srcListImg = ['img/img-lg-2.jpg', 'img/av-1.jpg']; //list of src

    //$(document).ready(handleListImg(srcListImg));

    //function pushImg(srcImg) {
    //    srcListImg.push(srcImg);
    //    var img = $('<img/>', {
    //        class: "aImage mx-1 my-1",
    //        src: srcImg
    //    }).appendTo("#listImg div[name = listImg]").click(clickImg)
    //}

    //input new image
    $("#file").on('change', function (evt) {
        var files = evt.target.files; // FileList object
        var output = [];
        for (var i = 0, f; f = files[i]; i++) {
            //Loop thorugh all the files
            if (!f.type.match('image.*') || !f.name.match(/(?:gif|jpg|JPG|png|jpeg)$/)) { //Process only Images
                //methods.showMessage.apply(this, ["imgAdd Invalid file type"]);
                alert("Invalid file type!")
                continue;
            }
            var reader = new FileReader();
            reader.onload = (function (imageFile) {
                return function (e) {
                    //Render Thumnails
                    var div = $('<div/>', { class: "img-border mx-1 my-1" });
                    var a = $('<a/>', {
                        target: "_blank",
                        name: "output"

                    });
                    srcListImg.push(e.target.result);

                    var image = $('<img/>', {
                        class: "mr-2 mb-2",
                        src: e.target.result,
                        title: escape(imageFile.name),
                        height: "200px",
                        width: "200px"
                    }).appendTo(a).click(function () { //click function of new image
                        handleListImg();
                        $("#previewImg").attr({ 'src': $(this).attr('src'), 'target': $(this).attr('target') });
                        $("#previewContainer").css({ "display": "block", "opacity": "1" });

                        var clickImgPos = jQuery.inArray($(this).attr('src'), srcListImg);
                        $("#listImg img").css('opacity', '0.4');
                        $("#listImg div[name = listImg] img").eq(srcListImg.length - 1 - clickImgPos).css('opacity', '1');
                        //alert(clickImgPos + " " + srcListImg.length);

                        imgMove(clickImgPos);

                    });
                    div.append(a).appendTo($('#listImage'));
                };
            })(f);
            reader.readAsDataURL(f);
        }
    }); 

     $('div[name = addMoreImg]').on('click', function(e){
        e.preventDefault();
        $('#file1')[0].click();
    });
    
    $('#addImg').on('click', function(e){
        e.preventDefault();
        $('#file')[0].click();
        $('#form1').submit();
    });
    //-----------------------------------------------------------------------------
    //-------------------------------reuse------------------------------------------
    //click refresh
    $("#refresh, #refresh > a, #refresh > a > i").click(function () {
        localStorage.setItem("kind", $("#kind").val());
        location.reload();
    });

    //delete an article
    $("#delete, #delete > a, #delete > a > i").click(function () {

        $(".aline > div > input:checked").parentsUntil("#aline").remove();
        var nItems = countItem();
        $('p[name = cItem]').text(nItems + " Items");
        $('p[name = nItems]').text("1-" + nItems + " of " + nItems);
    });

    //soft by subject (third column)
    $("#aline .aline > div > a[name = subject]").click(function () {
        var subject = $(this).html();
        $(this).text(subject);
        $("#aline .aline > div > a[name = subject]:not(:contains(" + subject + "))").parentsUntil("#aline").hide();
        var nItems = countItem();
        $('p[name = cItem]').text(nItems + " Items");
        $('p[name = nItems]').text("1-" + nItems + " of " + nItems);

    });

    //soft by status (fourth column)
    $("#aline .aline > div > a[name = status]").click(function () {
        var status = $(this).html();
        $(this).text(status);
        $("#aline .aline > div > a[name = status]:not(:contains(" + status + "))").parentsUntil("#aline").hide();
        var nItems = countItem();
        $('p[name = cItem]').text(nItems + " Items");
        $('p[name = nItems]').text("1-" + nItems + " of " + nItems);
    });
    //------------------------------------------------------------------------------
    //--------------------list of article-writer & draft-writer--------------------
    $(document).ready(function () {
        var nItems = countItem();
        $('p[name = cItem]').text(nItems + " Items");
    })

    //choose an article
    $("#aline .aline > div :checkbox").change(function () {
        if (this.checked) {
            $(this).parentsUntil("#aline").css("background-color", "#c2dbff");
        }
        else {
            $(this).parentsUntil("#aline").css("background-color", "#dddfeb");
        }
    })

    $("#select :checkbox").change(function () {
        if (this.checked) {
            $("#aline .aline > div :checkbox").prop('checked', true);
            $("#aline .aline > div :checkbox").parentsUntil("#aline").css("background-color", "#c2dbff");
            $(this).prop('checked', true);
        }
        else {
            $("#aline .aline > div :checkbox").prop('checked', false);
            $("#aline .aline > div :checkbox").parentsUntil("#aline").css("background-color", "#dddfeb");
            $(this).prop('checked', false);
        }
    });

    //choose all of articles
    $("#select a[name = all]").click(function () {
        $("#aline .aline > div :checkbox").prop('checked', true);
        $("#aline .aline > div :checkbox").parentsUntil("#aline").css("background-color", "#c2dbff");
        $("#select :checkbox").prop('checked', true);
    });

    //choose no article
    $("#select a[name = none]").click(function () {
        $("#aline .aline > div :checkbox").prop('checked', false);
        $("#aline .aline > div :checkbox").parentsUntil("#aline").css("background-color", "#dddfeb");
        $("#select :checkbox").prop('checked', false);
    });

   
    //-----------------------------------------------------------------------------

    //-----------------------------inbox-writer------------------------------------
    $(document).ready(function () {
        var nItems = countItem();
        $('p[name = nItems]').text("1-" + nItems + " of " + nItems);
        
    })

    //star
    $("div[name = stars]").click(function () {
        if ($(this).hasClass("active")) {
            $(this).removeClass("active");
        }
        else {
            $(this).addClass("active");
        }
    })
    $(".star > i").click(function () {
        if ($(this).hasClass("far")) {
            $(this).removeClass("far");
            $(this).addClass("fas");
            $(this).parent().addClass("active");
        } else {
            $(this).removeClass("fas");
            $(this).addClass("far");
            $(this).parent().removeClass("active");
        }
    })

    //choose starred
    $("#select a[name = starred]").click(function () {
        $("#aline > .aline > div > .star > .fas").parentsUntil(".d-flex").prev().prop('checked', true);
        $("#aline > .aline > div > .star > .fas").parentsUntil("#aline").css("background-color", "#c2dbff");
        $("#select :checkbox").prop('checked', true);
    })
    //-----------------------------------------------------------------------------

    //-----------------------------trash-writer------------------------------------
    function changeCmt(value) {
        if (value == "Articles") {
            $("#articles").removeClass('d-none');
            $("#articles").addClass('d-block');
            $("#comments").removeClass('d-block');
            $("#comments").addClass('d-none');
        } else if (value == "Comments") {
            $("#articles").removeClass('d-block');
            $("#articles").addClass('d-none');
            $("#comments").removeClass('d-none');
            $("#comments").addClass('d-block');
        }
        var nItems = countItem();
        $('p[name = nItems]').text("1-" + nItems + " of " + nItems);
    }

    $(document).ready(function () {
        var nItems = countItem();
        $('p[name = nItems]').text("1-" + nItems + " of " + nItems);
        var kind = localStorage.getItem("kind");

        if (kind != null) {
            $("#kind").val(kind);
            changeCmt(kind);
        } else {
            var kind = $("#kind").val();
            changeCmt(kind);
        }

    })

    //window.onbeforeunload = function () {
    //    alert($("#kind").val());
    //    localStorage.setItem("kind", $("#kind").val());
    //}

    window.onload = function () {
        localStorage.setItem("kind", $("#kind").val());
    }

    //change content of trash (article/comments)
    $("#kind").on('change', function () {
        var kind = this.value;
        changeCmt(kind);

    })

    

    //-----------------------------------------------------------------------------

    //-----------------------------profile-writer----------------------------------
    //gender click
    $("a[name = gender]").click(function () {
        $("input[name = gender]").prop("disabled", false);

    });

    //first name click
    $("a[name = firstName]").click(function () {
        var x = $('div[name = firstName] > input').length;
        if (!x) {
            var content = $("div[name = firstName]").html();
            $("div[name = firstName]").text(content);
            $("div[name = firstName]").text("");
            $("div[name = firstName]").append('<input type="text" style="width:300px;" placeholder="First name" value=' + content + ' />');
        }

    })

    //last name click
    $("a[name = lastName]").click(function () {
        var x = $('div[name = lastName] > input').length;
        if (!x) {
            var content = $("div[name = lastName]").html();
            $("div[name = lastName]").text(content);
            $("div[name = lastName]").text("");
            $("div[name = lastName]").append('<input type="text" style="width:300px;" placeholder="First name" value=' + content + ' />');
        }

    })

    //username click
    $("a[name = userName]").click(function () {
        var x = $('div[name = userName] > input').length;
        if (!x) {
            var content = $("div[name = userName]").html();
            $("div[name = userName]").text(content);
            $("div[name = userName]").text("");
            $("div[name = userName]").append('<input type="text" style="width:300px;" placeholder="First name" value=' + content + ' />');
        }

    })
    //-----------------------------------------------------------------------------
})(jQuery); // End of use strict




