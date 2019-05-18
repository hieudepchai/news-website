$(function () {
    $('#owl-carousel-1').owlCarousel({
        items: 1,
        loop: true,
        margin: 0,
        dots: false,
        nav: true,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        autoplay: true,
    });
    $('#owl-carousel-2').owlCarousel({
        items: 1,
        loop: true,
        margin: 0,
        dots: false,
        nav: true,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        autoplay: true,
    });
    $('#owl-carousel-3').owlCarousel({
        loop: false,
        margin: 15,
        dots: false,
        nav: true,
        navContainer: '#nav-carousel-3',
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        autoplay: false,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
        }
    });

})
