//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
});
