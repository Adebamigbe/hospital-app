$(function() {
  var mapOptions = {
    zoom: 2,
    center: new google.maps.LatLng(0, 0)
  };

  if (document.getElementById('map-canvas') != null) {
    window.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    window.markers = [];

    window.removeMarkers = function() {
      for (var i = 0; i < markers.length; i++) {
        window.markers[i].setMap(null);
      }
    }
  }
})
