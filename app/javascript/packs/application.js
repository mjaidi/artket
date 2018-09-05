import "bootstrap";
// import {tabNavigation} from "../pages/index_search";

// tabNavigation();

  $('#searchTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});
  $('#searchTabs a[href="#artwork"]').tab('show');