$('#msgTrigger').on('click', function (e) {
    var msg = $('#inputArg').val();
    $('#inputArg').val("");
    $("#messageQueue").prepend("<div class=\"message_user\">" + msg + "</div>");
    $.post("api/v1/post", {arg: msg}, function(result){
        $("#messageQueue").prepend("<div class=\"message_jeff\">" + result + "</div>");
    });
})