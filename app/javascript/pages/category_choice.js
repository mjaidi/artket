document.addEventListener("DOMContentLoaded", (e) => {
  e.preventDefault();
 document.querySelectorAll(".category-choices input").forEach((i) => {
    if (i.checked) {
     i.nextElementSibling.classList.add('active-category');
     };
  })
 console.log(e);
});
  
  
document.querySelectorAll(".category-choice").forEach((l) => {
  l.addEventListener("click", (e) => {
    e.preventDefault();
    console.log(l);
    l.classList.toggle("active-category");
    if(l.previousElementSibling.checked == false) {
        l.previousElementSibling.checked = true; 
    }
    else {
        if(l.previousElementSibling.checked == true) {
            l.previousElementSibling.checked = false; 
         }   
    }
    });
});
