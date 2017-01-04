var show_blank_option = function() {
  var find_blank_cell = function(list_record, div_blank_option){
    $.each(list_record, function(){
      if($.trim($(this).text()) == "") {
        div_blank_option.removeClass("hidden");
        return false;
      }
    });
  };

  $.each($("[class*= blank-option]"), function(){
    try {
      var element_name = $(this).parent().parent().attr("class").split(" ")[1].substring(2);
      list_record = $(".listsort ." + element_name);
      find_blank_cell(list_record, $(this));
      if ($(this).hasClass("hidden")) {
        $(this).remove();
      }
    } catch(e) {}
  })
};
