(function ($) {
    //init var
    var signup_res = 0;
    var login_res = 0;
    var ReaderObj;
    $("input").attr("autocomplete", "off");
    "use strict"
    // header date
    var weekday = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    var month = ['January', 'Februaray', 'Mars', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    setInterval(loadHeaderDate, 950);
    ;

    // end of header date
    $(window).on('scroll', function () {
        // Fixed Nav
        var wScroll = $(this).scrollTop();
        wScroll > $('header').height() ? $('#nav-header').addClass('fixed') : $('#nav-header').removeClass('fixed');

        // Back to top appear
        wScroll > 740 ? $('#back-to-top').addClass('active') : $('#back-to-top').removeClass('active')
    });
    // sign up
    // ---button close
    $('#sign-up-txt').click(function () {
        $("#sign-up-container").fadeTo(200, 1);
    })

    $('#top-header  .close-btn').click(function () {
        $("#sign-up-container").fadeOut(200);
    })
    $('#sign-up-btn').click(function ()
    {
        var error = 0;
        var isInputEmpty = 0;
        $("#signup-form input").each(function () {
            if ($(this).val() == "") {
                isInputEmpty = 1;
                error = 1;
                $("#SignupResult").html("Blanks are not allowed!!!");
                return false;
            }
        });
        if ($("#signup-password").val().length < 6) {
            error = 1;
            $("#SignupResult").html("Password must have at least 6 characters.");
        }

        if ($("#signup-password").val() != $("#input-repassword").val()) {
            error = 1;
            $("#SignupResult").html("Password does not match.");
        }

        console.log("isInputEmpty = " + isInputEmpty);
        if (error == 1) {


        } else {
            $("#loader1").toggleClass("loader");
            var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
            var url = contextpath + "/rsignup";
            $.ajax({
                method: "POST",
                url: url,
                data: $("#signup-form").serialize(),

                success: function (responseText) {
                    $("#loader1").toggleClass("loader");

                    if (responseText == "success")
                    {
                        $("#SignupResult").html("Signed up successfully!!!");
                        setTimeout(function () {
                            $("#login-here").click();
                        }, 1000);

                    } else {
                        $("#SignupResult").html("Failed to sign up...");
                    }

                }

            });
        }

    })
    $("#login-here").click(function ()
    {
        $('#top-header  .close-btn').click();
        $('#log-in-txt').click();

    })
    // --- end of button close
    // end of sign up
    // log in
    $('#log-in-txt').click(function () {
        $("#login-container").fadeTo(200, 1);
        $("#LoginResult").html("");
    })

    $('#top-header  .close-btn').click(function () {
        $("#login-container").fadeOut(200);
    })
    $('#login-btn').click(function ()
    {
        $("#loader2").toggleClass("loader");
        var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
        var url = contextpath + "/rlogin";
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'json',
            data: $("#login-form").serialize(),
            success: function (responseJSON) {
                console.log(responseJSON);
                console.log(typeof (responseJSON))
                //tra ve kieu object
                $("#loader2").toggleClass("loader");
                if (responseJSON.AccountID == 0)
                {
                    $("#LoginResult").html("Failed to login!!!");
                } else {
                    ReaderObj = responseJSON;

                    $("#LoginResult").html("Login Successfully!!!");
                    setTimeout(function () {
                        location.reload();
                    }, 1000);

                }


            }
        })
    }
    )
    $("#signup-here").click(function () {
        $('#login-header  .close-btn').click();
        $('#sign-up-txt').click();
    })

    // ---end of log in
    // logged acc collapse
    $('.logged-acc').on(
            {
                mouseenter: function () {
                    $('.logged-acc-collapse').css(
                            {
                                "visibility": "visible",
                                "opacity": "1"
                            }
                    )
                }
                // mouseleave: function(){
                // 	$('.logged-acc-collapse').css(
                // 		{
                // 			"visibility": "hidden",
                // 			"opacity": "0"
                // 		}
                // 	)
                // }
            })
    $(document).click(function (e) {
        var targetclass = e.target.className;
        if (targetclass != 'logged-acc')
        {
            $('.logged-acc-collapse').css(
                    {
                        "visibility": "hidden",
                        "opacity": "0"
                    }
            )
        }
    })

    // end of collapse


    // Back to top
    $('#back-to-top').on("click", function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
    });

    // Mobile Toggle Btn
    $('#nav-header .nav-collapse-btn').on('click', function () {
        $('#main-nav').toggleClass('nav-collapse');
    });

    // Search Toggle Btn
    $('#nav-header .search-collapse-btn').on('click', function () {
        $(this).toggleClass('active');
        $('.search-form').toggleClass('search-collapse');
    });



    // Owl Carousel
    // $('#owl-carousel-1').owlCarousel({
    // 	loop:true,
    // 	margin:0,
    // 	dots : false,
    // 	nav: true,
    // 	navText : ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    // 	autoplay : true,
    // 	responsive:{
    // 		0:{
    // 			items:1
    // 		},
    // 		992:{
    // 			items:2
    // 		},
    // 	}
    // });

    // $('#owl-carousel-4').owlCarousel({
    // 	items:1,
    // 	loop:true,
    // 	margin:0,
    // 	dots : true,
    // 	nav: false,
    // 	autoplay : true,
    // });


    // list sub-menu click

    $(".sub-nav-list li").click(function () {
        $(".sub-nav-list .active").toggleClass("active");
        $(this).toggleClass("active");
    })
//    $(".next-page-nav-list li").click(function () {
//        $(".next-page-nav-list  .active").toggleClass("active");
//        $(this).toggleClass("active");
//    })
    // end oflist sub-menu click
    // load functions
    function loadHeaderDate() {
        var d = new Date();
        var year = d.getFullYear();
        var curr_date = weekday[d.getDay()] + ', ' + month[d.getMonth()] + ' ' + d.getDate() + ' ' + d.getFullYear() + ', ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
        $('#header-date').html(curr_date);

    }
    function setDefaultAttr() {

    }
    // end of load functions

})(jQuery);
