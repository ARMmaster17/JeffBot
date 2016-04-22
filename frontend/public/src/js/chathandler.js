$('#msgTrigger').on('click', function (e) {
    var msg = $('#inputArg').val();
    $('#inputArg').val("");
    $("#messageQueue").prepend("You: " + msg + "<br>");
    $.post("api/v1/post", {arg: msg}, function(result){
        $("#messageQueue").prepend("Jeff: " + result + "<br>");
    });
})