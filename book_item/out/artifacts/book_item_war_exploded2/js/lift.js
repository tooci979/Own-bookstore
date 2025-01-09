 /* global bootstrap: false */
 (function () {
    'use strict'
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    tooltipTriggerList.forEach(function (tooltipTriggerEl) {
        new bootstrap.Tooltip(tooltipTriggerEl)
    })
})()

$(document).ready(function () {
    $("#main").load('tab1.html');
    $("a").click(function (e) {
        e.preventDefault();
        // $(this).tab('show');
        $("#main").load($(this).attr("href"));
    })
})