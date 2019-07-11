// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap.min
//= require bootstrap-table
//= require bootstrap-datepicker
//= require bootstrap-sprockets
//= require chosen.jquery
//= require_tree .

$( document ).ready(function() {

  $('.chosen-select').chosen({
    no_results_text: 'Oops, nothing found!',
    width: '100%',
    search_contains: true
  });

  $('#bootstrap-table, .bootstrap-table').bootstrapTable({
    pagination: true,
    pageList: [10, 20, 50, 100, 200],
    onPageChange: function (number, size) {
      $('.payslip_attribute_value').editable();
    }
  });

});