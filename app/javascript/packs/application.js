// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap"
import "animate.css"
import "../stylesheets/application_extended.scss"

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()

    // $('.toast').toast('show')
})


global.toastr = require("toastr")

toastr.options = {
    // "closeButton": false,
    // "debug": false,
    // "positionClass": "toast-bottom-right",
    // "onclick": null,
    // "showDuration": "300",
    // "hideDuration": "1000",
    // "timeOut": "5000",
    // "extendedTimeOut": "1000",
    // "showEasing": "swing",
    // "hideEasing": "linear",
    // "showMethod": "fadeIn",
    // "hideMethod": "fadeOut"
}

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
