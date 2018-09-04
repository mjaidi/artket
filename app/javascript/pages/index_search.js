
if (document.getElementById("index-page")) {
  var client = algoliasearch("VPTDOH7269","5db3592736a869790b3f1e30ec8d797c");
  var index = client.initIndex('Artwork');
  index.search('maxim', { hitsPerPage: 10, page: 0 })
    .then(function searchDone(content) {
      console.log(content)
    })
    .catch(function searchFailure(err) {
      console.error(err);
    });
}