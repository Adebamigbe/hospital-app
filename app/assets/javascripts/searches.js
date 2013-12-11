$(function() {
  $("#search-form").submit(function(e) {
    e.preventDefault();

    var searchQuery = $("#search").val();

    $.ajax({
      url: "/hospitals/search",
      type: "POST",
      data: {
        search: searchQuery
      },
      success: function(results) {
        console.log(results);

        //create empty LatLngBounds object
        var bounds = new google.maps.LatLngBounds();

        for (element in results) {
          var result = results[element];
          var lat = result.geometry.location.lat;
          var lng = result.geometry.location.lng;

          var latlng = new google.maps.LatLng(lat, lng);

          var marker = new google.maps.Marker({
              position: latlng,
              map: window.map,
              title: result.name
          });

          //extend the bounds to include each marker's position
          bounds.extend(marker.position);
        }

        map.fitBounds(bounds);
      }
    });
  });
});