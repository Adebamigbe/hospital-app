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
              title: result.name,
              vicinity: result.vicinity,
              app_id: result.app_id
          });

          //extend the bounds to include each marker's position
          bounds.extend(marker.position);

          var infowindow = new google.maps.InfoWindow({
            height: 500
          });

          google.maps.event.addListener(marker, 'click', function() {
            infowindow.close();
            infowindow.open(window.map, this);

            var $infowindowContent = $("<div style='height: 500px;'>");
            var $elementName = $("<p></p>");
            $elementName.html("<a href='/hospitals/" + this.app_id + "'><b>" + this.title + "</b></a>");
            var $elementVicinity = $("<p>");
            $elementVicinity.html(this.vicinity);
            $infowindowContent.append($elementName).append($elementVicinity);

            infowindow.setContent($infowindowContent.html());

            map.setCenter(this.getPosition());
          });
        }

        map.fitBounds(bounds);
      }
    });
  });
});