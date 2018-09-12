search = document.getElementById("search-box");
icon = document.getElementById("search-icon");
console.log(icon);
icon.addEventListener("click", (e) => {
  e.preventDefault();
  search.classList.toggle("hidden");
})