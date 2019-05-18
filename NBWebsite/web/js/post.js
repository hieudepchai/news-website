
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

    $('.media-big .reply-btn').click(function () {
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
            textarea.appendTo(form);
            var btn = $('<button>');
            btn.addClass('input-btn').html('Comment');
            btn.appendTo(form);
            form.appendTo(ReplyFormDiv);
            ReplyFormDiv.appendTo(CommentMediaDiv);
            $(this).after(CommentMediaDiv);
            $(this).attr('is-clicked', 'true');
        }
        else {
            $(this).attr('is-clicked', 'false');
        }
    })
    //load functions
    function loadIsClickReply() {
        $('.reply-btn').attr('is-clicked', 'false');
    }
}
)
