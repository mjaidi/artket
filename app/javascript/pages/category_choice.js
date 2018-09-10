$(document).ready(function(){
 $(".category-choices input:checked").each((l,input) => {
    console.log(input);
    $(input).parent.addClass('active-category');
  });
  
  $(".category-choice").click(function(){
    $(this).toggleClass("active-category");
    console.log(this);
  });
});
