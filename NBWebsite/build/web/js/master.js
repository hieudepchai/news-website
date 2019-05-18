(function ($) {
	"use strict"
	// header date
	var weekday = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
	var month = ['January', 'Februaray', 'Mars', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
	setInterval(loadHeaderDate, 950);;

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

	// --- end of button close
	// end of sign up
	// log in
	$('#log-in-txt').click(function () {
		$("#login-container").fadeTo(200, 1);
	})

	$('#top-header  .close-btn').click(function () {
		$("#login-container").fadeOut(200);
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
	$(document).click(function(e){
		var targetclass = e.target.className;
		if( targetclass!= 'logged-acc')
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
	$(".next-page-nav-list li").click(function () {
		$(".next-page-nav-list  .active").toggleClass("active");
		$(this).toggleClass("active");
	})
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
