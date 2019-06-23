$(function () {
    $("#open-file").click(function () {
        $("#inputProfilePicture").click();
    })
    $("#inputProfilePicture").change(function () {
        $("#open-file").html($(this).val());
        $("#inputHidden").val($(this).val());
        console.log(this.files[0]);
        var fileReader = new FileReader();
        fileReader.onload = function (e) {

            $(".avatar").attr('src', e.target.result);
        }
        fileReader.readAsDataURL(this.files[0]);
    })
    $("#mybtn-save").click(function () {
        var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
        var url = contextpath + "/profile/submit";
        var form = $("#profile-form")[0];
        console.log(form);
        var data = new FormData(form);
        console.log(data);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: url,
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success: function (responseText) {
                if (responseText == "success") {
                    location.reload();
                } else {
                    $("#profile-res").html("Failed to update!!!");
                }
            }

        })
    })
    $("#mybtn-reset").click(function () {
        var error = 0;
        $("#pw-form input").each(function(){
            if($(this).val()==""){
                error=1;
                 $("#pw-res").html("Blanks are not allowed!!!");
                 return false;
            }
        })
        if ($("#inputPassword").val().legnth < 6) {
            $("#pw-res").html("Password must have at least 6 characters!!!");
            error = 1;
        }
        if ($("#inputPassword").val() != $("#inputRePassword").val()) {
            $("#pw-res").html("Password does not match!!!");
            error = 1;

        }
        if (error==1) {


        } else {
            var contextpath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
            var url = contextpath + "/profile/submit";
            $("#loader").toggleClass("loader");
            $.ajax({
                type: "POST",
                url: url,
                data: $("#pw-form").serialize(),
                success: function (responseText) {
                    if (responseText == "success") {
                        $("#pw-res").html("Update successfully!!!");
                        $("#pw-form .form-group input").each(function () {
                            $(this).val("");
                        })
                    } else {
                        $("#pw-res").html(responseText);
                    }
                    $("#loader").toggleClass("loader");
                }
            })

        }
    })
})
