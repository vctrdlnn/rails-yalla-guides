//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require underscore
//= require gmaps/google
//= require_tree .

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
});
