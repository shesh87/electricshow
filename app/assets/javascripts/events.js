// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.




$(document).ready(function() {
  if (navigator.geolocation && $('.home').length) {
    navigator.geolocation.getCurrentPosition(success, error);
  }
});

//NEED THIS GEO TRACKER TO ONLY DISPLAY ON HOME PAGE
//REVISE --> SECOND COLUMN SHOULD GIVE DROP DOWN BOX OF THE CITY USERS WANT CALENDAR EVENTS FOR

function error(n) {
  // console.log(n.message);
  $('.error_msg').text("Could not locate your location.");
}

function success(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  $.ajax({
    type: 'GET',
    url: '//maps.googleapis.com/maps/api/geocode/json?latlng=' +latitude+ ',' +longitude+ '&sensor=true',
    dataType: 'json'
  }).done(function(data){
    console.log(data)
    console.log(data.results[1].address_components[2].long_name)
    var city = data.results[1].address_components[2].long_name
    get30Events(city);
    // getTodayEvents(city);
  }).error(function(error) {
    alert('An error occurred while trying to find your location.');
  });
}


function get30Events(city) {
  $.ajax({
    url: '/search/' + city,
    type: "POST",
  }).done(function( msg ) {
    $('.js-30days, .js-today').empty();
    msg.forEach(function(show) {
      var fullDate = new Date();
      var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
      var twoDigitDate = fullDate.getDate()+"";if(twoDigitDate.length==1) twoDigitDate="0" +twoDigitDate;
      var currentDate = fullDate.getFullYear() + "-" + twoDigitMonth + "-" + twoDigitDate;
      
      if (currentDate == show.date) {
        getTodayEvents(show);
      } else {
        $('.js-30days').append("<li>"+show.date+" - <a href='/events/" +show.id+ "'>" +show.title+ "</a></li>");
      }
    });
  });
}


function getTodayEvents(show) {
  console.log(show.time);
  $('.js-today').append("<li><a href='/events/" +show.id+ "'>" +show.title+ "</a></li>");
  // $('.js-today').append("<li><a href='/events/" +show.id+ "'>" +show.title+ "</a> @ "+show.time+" </li>");
}









