$(function() {
  var mapOptions = {
    zoom: 2,
    center: new google.maps.LatLng(0, 0)
  };

  if (document.getElementById('map-canvas') != null) {
    window.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  }
})
