$(function() {
  $("#specialisation_category_id").change(function() {
    var specialisation_category_id = parseInt($(this).val());
    var $specialisation_id_dropdown = $("#specialisation_id");
    $specialisation_id_dropdown.html("");

    if (specialisation_category_id != 0) {
      $.ajax({
        url: "/specialisation_categories/" + specialisation_category_id + "/specialisations",
        type: "GET",
        success: function(results) {

          for (index in results) {
            var result = results[index];
            $specialisation_id_dropdown.append("<option value=" + result.id + ">" + result.name + "</option>");
          }
        }
      });
    }
  });

  $("#search-form").submit(function(e) {
    e.preventDefault();

    var searchQuery = $("#search").val();
    var specialisation_id = $("#specialisation_id").val();

    $.ajax({
      url: "/hospitals/search",
      type: "POST",
      data: {
        search: searchQuery,
        specialisation_id: specialisation_id
      },
      success: function(results) {
        //create empty LatLngBounds object
        var bounds = new google.maps.LatLngBounds();

        for (element in results) {
          var result = results[element];
          console.log(result);
          var lat = result.geometry.location.lat;
          var lng = result.geometry.location.lng;

          var latlng = new google.maps.LatLng(lat, lng);

          var marker = new google.maps.Marker({
              position: latlng,
              map: window.map,
              title: result.name,
              vicinity: result.vicinity,
              app_id: result.app_id,
              matches_specialisation: result.matches_specialisation
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

            // if (this.matches_specialisation) {
            // }

            infowindow.setContent($infowindowContent.html());

            map.setCenter(this.getPosition());
          });

          // var iconBase = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png/';
          // var icons = {
          //   hospitals: {
          //     icon: iconBase + 'green-dot.png'
          //   }
          // };


          map.fitBounds(bounds);
        }
      }
    });
  });
});