// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//Tracks current location on map
$( document ).ready(function() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success, error);
  }
});

function error(n) {
  console.log(n.message);
  $('.error_msg').text("Could not locate your location.");
}

function success(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  $.ajax({
    type: 'GET',
    url: 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' +latitude+ ',' +longitude+ '&sensor=true',
    dataType: 'json'
  }).done(function(data){
    // console.log(data)
    // console.log(data.results[1].address_components[2].long_name)
    var city = data.results[1].address_components[2].long_name
    getEvents(city);
  }).error(function(error) {
    // console.log(error);
    alert('An error occurred while trying to find your location.');
  });
}


function getEvents(city) {
  $.ajax({
    url: '/search/' + city,
    type: "POST",
  }).done(function( msg ) {
    console.log(msg)
    console.log(msg[0].title)

    $('.js-events').empty();
    msg.forEach(function(show) {
      console.log(show.title + ' - title of show')
        $('ul.js-events').html("<li><a href='/events/" +show.id+ "'>" +show.title+ "</a></li>");
    });

  });
}







