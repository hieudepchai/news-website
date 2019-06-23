$(function () {
    //account manage
    //init var
    var action = 0;
$("#category_table tbody tr").click(function (e) {
        $("#category_table tbody").children(".red").toggleClass("red");//Doi mau` khi hover vao` table la red
        $(this).toggleClass("red");
        $("#inputCategoryID").val($(this).find(".td-CategoryID").html());
        $("#inputCategoryName").val($(this).find(".td-CategoryName").html());
        
        $("#categoryselect").children().removeAttr("selected");
        var optselector = "#categoryselect option:contains(" + $(this).find(".td-ParentID").html() + ")";
        $(optselector).prop('selected', true);
})
    DisableAllInput();
    function clearInput(){
        $("#category_form,input").val("");

    }
    function DisableAllInput() {
        $("#category_form,input,select").prop("disabled", "disabled");
    }
    function EnableAllInput(){
         $("#category_form,input,select").prop("disabled", false);
    }
    $("#btn-row .btn-success").click(function () {
        $("#btn-row .btn-success").attr('disabled', 'disabled');
        $("#mybtn-save").attr('disabled', false);


        if ($(this).text().match("Add"))
        {
            clearInput();
            EnableAllInput();
            $("#hidden-input").val(1);
            action = 1;
            $("#inputCategoryID").attr("disabled", "disabled");
        } else if ($(this).text().match("Edit"))
        {
            clearInput();
            EnableAllInput();
            $("#hidden-input").val(2);
            action = 2;

        } else {
            $("#inputCategoryID, #hidden-input").attr("disabled", false);
            $("#hidden-input").val(3);
            action = 3;
        }

    })
    //btn-reset
    $("#mybtn-reset").click(function () {
        clearInput();
        DisableAllInput();
        $("#btn-row .btn-success").attr('disabled', false);
        $("#mybtn-save").attr("disabled", "disabled");
    })

})