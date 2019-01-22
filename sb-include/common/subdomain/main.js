$(function(){
  $.ajax({
    type: "GET",
    url: "https://odekakeshimasyo.me/sb-include/common/subdomain/css.html"
  }).done(function( source ) {
    $('head').append(source);
  });
});
