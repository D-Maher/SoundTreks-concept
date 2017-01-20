$(document).ready(function(){
  addSoundTrek();

  var options = {
    enableHighAccuracy: true,
    maximumAge: 0
  }
  navigator.geolocation.getCurrentPosition(initialize, error, options);
});

function initialize(location){
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: location.coords.latitude, lng: location.coords.longitude},
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(location.coords.latitude, location.coords.longitude)
  });

  var infoWindowOptions = {
    content: "<a href=https://www.youtube.com/watch?v=dQw4w9WgXcQ>Playlist</a>"
  }

  var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
  google.maps.event.addListener(marker,"click",function(e){
    infoWindow.open(map, marker);
  })
  marker.setMap(map)
}

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
};

function addSoundTrek() {
  $('#add-playlist').on("submit", function() {
    $.ajax({
      url: '/path/to/file',
      type: 'POST',
      dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
      data: {param1: 'value1'},
    })
    .done(function() {
      console.log("PLAYLIST RESPONSE RECEIVED!!!");
    })
    .fail(function() {
      console.log("error");
    });

  })
}
