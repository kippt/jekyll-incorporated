$(function() {
  $(".full img").on("click", function() {
    $(this).toggleClass("zoom");
  });

  $('video').appear();

  $('video').on('appear', function(a, elems) { 
    this.play();
  });

  $('video').on('disappear', function(a, elems) {
    this.pause();
  });

});