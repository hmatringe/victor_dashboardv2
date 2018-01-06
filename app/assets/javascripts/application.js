// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//

//--- Angle
// dependency devise_logout start
//= require jquery
//= require jquery_ujs
// dependency devise_logout end
//= require angle/app.init
//= require_tree ./angle/modules
//= require_tree ./angle/custom


$(function() {
   $('#flash').delay(500).fadeIn('normal', function() {
      $(this).delay(500).fadeOut();
   });
});