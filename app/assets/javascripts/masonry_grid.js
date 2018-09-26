// Initialize Masonry inside Foundation 5.5 Tab component
$(window).load(function() {
  $('.masonry-row').masonry({
    itemSelector: '.masonry-item'
  });
});

// Reinitialize masonry inside each panel after the relative tab link is clicked - 
$('body').delegate('.tab-title a','click',function(){
  // $('.tab-title a').on('click', function() {
  // do async to allow menu to open
  setTimeout( function() {
    $('.masonry-row').masonry({
      itemSelector: '.masonry-item'
    });
  }, 500);
});