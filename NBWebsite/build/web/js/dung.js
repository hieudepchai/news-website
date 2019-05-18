$(function () {

    $("#logout-a").click(function () {
        $("#logout-form").submit();

    })
    
    //account manage
     $("#lower-inputfile").change(function (event) {
        $("#upper-inputfile").val( $("#lower-inputfile").val());
    })
//    $("#account_table tbody tr").click(function(e){
//        $("#account_table tbody").children(".red").toggleClass("red");
//        $(this).toggleClass("red");
//        $("#inputAccountID").val($(this).find(".td-AccountID").html());
//        $("#inputUsername").val($(this).find(".td-Username").html());
//        $("#inputFirstName").val($(this).find(".td-FirstName").html());
//        $("#inputLastName").val($(this).find(".td-LastName").html());
//        $("#inputEmail").val($(this).find(".td-Email").html());
//        $("#inputPhone").val($(this).find(".td-Phone").html());
//        $("#inputAccountTypeID").val($(this).find(".td-AccountTypeID").html());
//        $("#inputProfilePicture").val($(this).find(".td-ProfilePicture").html());
//        $("#inputValid").val($(this).find(".td-valid").html());
//    })


})