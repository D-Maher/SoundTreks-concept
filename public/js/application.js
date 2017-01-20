// $(document).ready(function() {
  // var mapOptions = {
  //   center: new google.maps.LatLng(37.0, -122.0),
  //   zoom: 12,
  //   mapTypeId: google.maps.mapTypeId.ROADMAP
  // }
  // new google.maps.Map($("#map"), mapOptions);
  // console.log("HI!")
  // userCoords = navigator.geolocation.getCurrentPosition(function(){});
  // console.log(userCoords);
  // debugger;
// });

// var getLocation = function() {
//   var myLocation;
//   myLocation =
//   console.log("myLocation: " + myLocation);
//   return myLocation;
// }

// function(location){
//     return location;
//   }

function initialize(location){
  console.log(location);
  // debugger;
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: location.coords.latitude, lng: location.coords.longitude},
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(location.coords.latitude, location.coords.longitude)
  })
  marker.setMap(map)
}

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
};

$(document).ready(function(){
  var options = {
    enableHighAccuracy: true,
    maximumAge: 0
  }
  navigator.geolocation.getCurrentPosition(initialize, error, options);
});
