
$(function () {
    loadIsClickReply();
    $('#owl-carousel-1').owlCarousel({
        items: 1,
        loop: true,
        margin: 0,
        dots: false,
        nav: true,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        autoplay: true,
    });

    //load functions
    function loadIsClickReply() {
        $('.reply-btn').attr('is-clicked', 'false');
    }
    $("#please-login").click(function () {
        $("#log-in-txt").click();
    })
    $(".star-bookmark").click(function () {
      if($('#bookmark-form').attr('IsOpened')=='false'){

          $('#bookmark-form').attr('IsOpened','true');
          $("#bookmark-form").css('max-height','300px');
      }
      else{
            $('#bookmark-form').attr('IsOpened','false');
            $("#bookmark-form").css('max-height','0px');
      }
      
    })

}
)
