$('#msgTrigger').on('click', function (e) {
    var msg = $('#inputArg').val();
    $('#inputArg').val("");
    $("#messageQueue").prepend("<div class=\"message_container\"><div class=\"message_user\">" + msg + "</div></div>");
    //$.post("api/v1/post", {arg: msg}, function(result){
    //    $("#messageQueue").prepend("<div class=\"message_container\"><div class=\"message_jeff\">" + result + "</div></div>");
    //});
    $.ajax({
        type: "POST",
        url: "api/v1/post",
        data: {arg: msg},
        timeout: 20000,
        success: function(result, status, xhr){
            $("#messageQueue").prepend("<div class=\"message_container\"><div class=\"message_jeff\">" + result + "</div></div>");
        }
    });
})
