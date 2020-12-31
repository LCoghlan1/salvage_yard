// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import 'bootstrap'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"

global.$ = require('jquery')

Rails.start()
Turbolinks.start()
ActiveStorage.start()

submit_message = function() {
  $('#message_body').on('keydown', function(e) {
    if (e.keyCode == 13) {
      $('button').click();
      e.target.value = "";
    };
  });
};
