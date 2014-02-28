//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap

$(document).ready(function($){
  $(document).on('click', '.btn-copy-description', function(e){
    e.preventDefault();
    $('.pdesc').val($('.cdesc').val());
  });
});

