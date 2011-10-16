function initMap() {
  $.locations = $.parseJSON($.locations);
  $.gmap = new google.maps.Map(document.getElementById("map"), {
    zoom: 8,
    center: new google.maps.LatLng($.locations[0].latitude, $.locations[0].longitude),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  for (var i = 0; i < $.locations.length; ++i) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng($.locations[i].latitude, $.locations[i].longitude),
      map: $.gmap
    });

    var infoWindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, "click", (function(marker, i) {
      return function() {
        infoWindow.setContent('<div class="marker-html">' + $.locations[i].place + '</div>');
        infoWindow.open($.gmap, marker);
      }
    })(marker, i));
  }
}
