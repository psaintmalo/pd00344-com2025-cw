// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require_tree .

var refresh_inter = null;

function ajax_refresh(destinationUrl, originUrl, postData) {

  if(originUrl == window.location.pathname) {

    console.log("refreshing");

    $.ajax({

      type: "POST",
      data: postData,
      url: destinationUrl

    });

  } else {

    console.log("clearing");
    clearInterval(refresh_inter);
    refresh_inter = null;

  }

}

function new_ajax_refresh(destinationUrl, originUrl, postData, freq) {

  if(refresh_inter != null) {
    console.log("Force clearing old interval");
    clearInterval(refresh_inter);
    refresh_inter = null;
  }

  refresh_inter = setInterval(ajax_refresh, freq, destinationUrl, originUrl, postData);

}
