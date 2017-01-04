
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require i18n
//= require i18n/translations
//= require select2
//= require dhtmlxcommon
//= require dhtmlxgrid
//= require dhtmlxgridcell
//= require dhtmlxdataprocessor
//= require lost_hour
//= require highcharts
//= require init_chart
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap-datepicker
//= require users
//= require filter-data
//= require filter-box
//= require blank_option_filter
//= sprints

$(document).on("page:change", function(){
  $(".datepicker").datepicker({
    format: I18n.t("date.format"),
    autoclose: true
  });

  $( "#assignee" ).select2({
    multiple: true,
    theme: "bootstrap",
    width: '100%'
  });

  $(".hide-flash").delay(2000).fadeOut("slow");
});

function resetOrder() {
  var stt = 0;
  var list_record = $('#list-records').find('.trow .stt:visible').not('.header').not('.sum');
  $.each(list_record, function(){
    stt++;
    $(this).html(stt);
  });
}
