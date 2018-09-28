$('#category_id').change(function() {
  var category_id = $(this).val();
 $.ajax({
    url: "categories/" + category_id + "/get_subcategories",
    type: "GET",
    dataType: "script",
    data: { "category_id": category_id },
  });
});