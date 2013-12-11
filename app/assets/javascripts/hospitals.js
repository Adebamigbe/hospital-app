$(function() {
  var mapOptions = {
    zoom: 2,
    center: new google.maps.LatLng(0, 0)
  };

  window.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
})
