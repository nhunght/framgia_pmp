$(document).on('page:change', function() {
  // open filter box
  $('.ic-filter').on('click', function(e){
    type = $(this).data('type');
    filter_type = $(this).data('filter')
    $.ajax({
      url: '/filter_datas',
      type: 'GET',
      data: {
        type: type,
        filter_type: filter_type,
        name: 'f-' + type
      },
      success: function(result){
        console.log(result);
      }
    });
  });
});
