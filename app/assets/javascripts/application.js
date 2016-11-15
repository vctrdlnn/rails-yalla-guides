//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
});
