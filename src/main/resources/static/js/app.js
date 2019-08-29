$(document).ready(function () {
    $("form.register").hide()
    $("h2.register").click(function () {
        $('form.login').hide();
        $('form.register').show();
    })
    $("h2.login").click(function () {
        $('form.register').hide();
        $('form.login').show();
    })
});
