$('#msgTrigger').on('click', function (e) {
    var msg = document.getElementById('messageQueue').value;
    $("#messageQueue").append("<p>${msg}</p>");
})