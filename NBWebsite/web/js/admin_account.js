$(function () {
    //account manage
    //init var
    var action = 0;
    //function
    function clearInput() {
        $("#account_form input").val("");
    }
    function DisableAllInput() {
        $("#account_form input,select").prop("disabled", "disabled");
        $("#validselect, #typeselect").prop("disabled ", false);
    }
    function EnableAllInput() {
        $("#account_form input,select").prop("disabled", false);
    }
    function EnablePwInput() {
        $("#inputRePassword, #inputPassword").prop("disabled", false);
    }
    function DisablePwInput() {
        $("#inputRePassword, #inputPassword").prop("disabled", "disabled");
    }
    function checkBlack() {
        if (!$("#account_form input").val())
        {
            alert('abc');
        }
    }
    //load function
    DisableAllInput();
    //event
    $("#lower-inputfile").change(function (event) {
        $("#upper-inputfile").val($("#lower-inputfile").val());
    });
    //load cell data to input
    $("#account_table tbody tr").click(function (e) {
        $("#account_table tbody").children(".red").toggleClass("red");
        $(this).toggleClass("red");
        $("#inputAccountID").val($(this).find(".td-AccountID").html());
        $("#inputUsername").val($(this).find(".td-Username").html());
        $("#inputFirstName").val($(this).find(".td-FirstName").html());
        $("#inputLastName").val($(this).find(".td-LastName").html());
        $("#inputEmail").val($(this).find(".td-Email").html());
        $("#inputPhone").val($(this).find(".td-Phone").html());
        $("#inputProfilePicture").val($(this).find(".td-ProfilePicture").html());
        $("#inputValid").val($(this).find(".td-valid").html());
        //
        $("#validselect").children().removeAttr("selected");
        var validselector = "#validselect option:contains(" + $(this).find(".td-Valid").html() + ")";
        $(validselector).attr('selected', true);
        //
        $("#typeselect").children().removeAttr("selected");
        var optselector = "#typeselect option:contains(" + $(this).find(".td-AccountTypeID").html() + ")";
        $(optselector).prop('selected', true);
    })
    //btn-row
    $("#btn-row .btn-success ").click(function () {
        $("#btn-row .btn-success").attr('disabled', 'disabled');
        $("#mybtn-save").attr('disabled', false);


        if ($(this).text().match("Add"))
        {
            clearInput();
            EnableAllInput();
            $("#hidden-input").val(1);
            action = 1;
            $("#inputAccountID").attr("disabled", "disabled");
        } else if ($(this).text().match("Edit"))
        {
            clearInput();
            EnableAllInput();
            $("#hidden-input").val(2);
            action = 2;

        } else {
            $("#inputAccountID, #hidden-input").attr("disabled", false);
            $("#hidden-input").val(3);
            action = 3;
        }

    })
 
    //mybtn-save
    //btn-reset
    $("#mybtn-reset").click(function () {
        clearInput();
        DisableAllInput();
        $("#btn-row .btn-success").attr('disabled', false);
        $("#mybtn-save").attr("disabled", "disabled");
    })


});
