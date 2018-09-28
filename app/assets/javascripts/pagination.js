
$(function () {
        $('.pagination a').on("click", function () {
                $.get(this.href, null, null, 'script');
                return false;
        });
        $( "#city" ).val( $.urlParam('city') || "");
        $( "#category" ).val( $.urlParam('category') || "");
        $( "#subcategory" ).val( $.urlParam('subcategory') || "");
});

$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return decodeURI(results[1]) || 0;
    }
}