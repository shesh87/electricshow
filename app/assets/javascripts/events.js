// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//Tracks current location on map
$( document ).ready(function() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success, error);
  }
});

function success(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  $.ajax({
    type: 'GET',
    url: 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' +latitude+ ',' +longitude+ '&sensor=true',
    dataType: 'json'
  }).done(function(data){
    console.log(data.results[1].address_components[1].long_name)
    var city = data.results[1].address_components[1].long_name
    $.post( "/search/" + city);
  }).error(function(error) {
    console.log(error);
  });
}

function error(n) {
  console.log(n.message);
  $('.error_msg').text("Could not locate your location.");
}





