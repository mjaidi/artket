import GMaps from 'gmaps/gmaps.js';

// Index Page Google Maps

// function mapsLoad () {
//   const mapElement = document.getElementById('map');
//   if (mapElement) { // don't try to build a map if there's no div#map to inject in
//     const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
//     const markers = JSON.parse(mapElement.dataset.markers);
//     map.addMarkers(markers);
//     if (markers.length === 0) {
//       map.setZoom(2);
//     } else if (markers.length === 1) {
//       map.setCenter(markers[0].lat, markers[0].lng);
//       map.setZoom(14);
//     } else {
//       map.fitLatLngBounds(markers);
//     }
//   };
// };

// mapsLoad(); 


// Gallery Contact Page Static Map
const mapElementContact = document.getElementById('map-contact');
if (mapElementContact) { // don't try to build a map if there's no div#map to inject in
  const markers = JSON.parse(mapElementContact.dataset.markers);
  const map = new GMaps({ el: '#map-contact', lat: markers.lat, lng: markers.lng });
  map.addMarker(markers);
  map.setCenter(markers[0].lat, markers[0].lng);
  map.setZoom(14);
};

