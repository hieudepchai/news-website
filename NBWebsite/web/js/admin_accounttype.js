$(function () {
    //account manage
    //init var
    var action = 0;

$("#accounttype_table tbody tr").click(function (e) {
        $("#accounttype_table tbody").children(".red").toggleClass("red");//Doi mau` khi hover vao` table la red
        $(this).toggleClass("red");
        $("#inputTypeID").val($(this).find(".td-TypeID").html());        
        $("#inputNametype").val($(this).find(".td-Name").html());
//Check vao checkbox moi khi click vao table tuong ung`
        if($(this).find(".td-ReaderRight").html()=="✔"){ 
            $('#cb-ReaderRight').prop('checked', 'checked');}
        else{
            $('#cb-ReaderRight').prop('checked', false);
        }        
        if($(this).find(".td-JRight").html()=="✔"){
            $('#cb-JLRight').prop('checked', true);}
        else{
            $('#cb-JLRight').prop('checked', false);
        }    

        if($(this).find(".td-AdminRight").html()=="✔"){
            $('#cb-AdminRight').prop('checked', true);}
        else{
            $('#cb-AdminRight').prop('checked', false);
        }    

        if($(this).find(".td-AccountMng").html()=="✔"){
            $('#cb-AccountMng').prop('checked', true);}
        else{
            $('#cb-AccountMng').prop('checked', false);
        }        

        if($(this).find(".td-AccountTypeMng").html()=="✔"){
            $('#cb-AccountTypeMng').prop('checked', true);}
        else{
            $('#cb-AccountTypeMng').prop('checked', false);
        }        

        if($(this).find(".td-ArticleMng").html()=="✔"){
            $('#cb-ArticleMng').prop('checked', true);}
        else{
            $('#cb-ArticleMng').prop('checked', false);
        }      

        if($(this).find(".td-CommentMng").html()=="✔"){
            $('#cb-CommentMng').prop('checked', true);}
        else{
            $('#cb-CommentMng').prop('checked', false);
        }      

        if($(this).find(".td-BookmarkMng").html()=="✔"){
            $('#cb-BookmarkMng').prop('checked', true);}
        else{
            $('#cb-BookmarkMng').prop('checked', false);
        }        

        if($(this).find(".td-FeedbackMng").html()=="✔"){
            $('#cb-FeedbackMng').prop('checked', true);}
        else{
            $('#cb-FeedbackMng').prop('checked', false);
        }        

        if($(this).find(".td-ImgMng").html()=="✔"){
            $('#cb-ImgMng').prop('checked', true);}
        else{
            $('#cb-ImgMng').prop('checked', false);
        }        

        //
    })
//Doi so 1 thanh dau check
 $('#accounttype_table tr td:not(:first-child)').each(function () {

        if($(this).html()=="1")
            $(this).html("&#10004;");
        else if ($(this).text().match(0))
            $(this).text('');
});

    //Nut add edit delete
    $("#btn-row .btn-success").click(function () {
        $("#btn-row .btn-success").attr('disabled', 'disabled');
        $("#mybtn-save").attr('disabled', false);
        if ($(this).text().match("Add"))
        {
            clearInput();
            EnableAllInput();
            $("#inputTypeID").prop("disabled", "disabled");            
            $("#hidden-input").val(1);
        } else if ($(this).text().match("Edit"))
        {
            clearInput();
            EnableAllInput();
            $("#hidden-input").val(2);
            action = 2;

        } else {
            $("#inputTypeID").prop("disabled", false);
            $("#inputTypeID, #hidden-input").attr("disabled", false);
            $("#hidden-input").val(3);
            action = 3;
        }
        
    })
    $("#mybtn-reset").click(function(){
            DisableAllInput();

        clearInput();
        $("#btn-row .btn-success").attr('disabled', false);
        $("#mybtn-save").attr("disabled", "disabled");
        $(":checkbox").prop("checked", false);
    })
        DisableAllInput();

    function clearInput(){
        $("#type_form,input").val("");
        $(":checkbox").prop("checked", false);

    }
    function DisableAllInput() {
        $("#type_form,input").prop("disabled", "disabled");
    }
    function EnableAllInput(){
         $("#type_form,input").prop("disabled", false);
         $("#checkbox-list input").val(1);
    }

});
