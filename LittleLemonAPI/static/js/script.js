$("form").on("submit", function (e) {
    var dataString = $(this).serialize();

    // alert(dataString); return false; 
    $.ajax({
        type: "POST",
        url: "/api/users",
        data: dataString,
        success: function () {
            $("#create_user").html("<div id='message'></div>");
            $("#message")
                .html("<h2>User Created</h2>")
                .hide()
                .fadeIn(1500, function () {
                    $("#message").append(
                        "<img id='checkmark' src='images/check.png' />"
                    );
                });
        }
    });
    e.preventDefault();
});