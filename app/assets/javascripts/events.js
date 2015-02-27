// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Find events
$('.btn').on('click', function() {
  var artist = $('input#artist').val();
  alert(artist + 'hi');
  
  // $.ajax({
  //   type: 'GET',
  //   url: 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.placefinder%20where%20text%3D%22' + place + '%22&format=json&callback=',
  //   dataType: 'json'
  // }).done(function(data){
  //   console.log(data.query.results.Result.latitude);
  //   var lat = data.query.results.Result.latitude;
  //   var long = data.query.results.Result.longitude;
  //   mapImage(lat, long);
  // }).error(function(error) {
  //   console.log(error);
  // });
  
});


//Find given city location on map
// $('.city').on('click', function() {
//   var place = $('input#city').val();
//   console.log(place);
  
//   $.ajax({
//     type: 'GET',
//     url: 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.placefinder%20where%20text%3D%22' + place + '%22&format=json&callback=',
//     dataType: 'json'
//   }).done(function(data){
//     console.log(data.query.results.Result.latitude);
//     var lat = data.query.results.Result.latitude;
//     var long = data.query.results.Result.longitude;
//     mapImage(lat, long);
//   }).error(function(error) {
//     console.log(error);
//   });
  
// });