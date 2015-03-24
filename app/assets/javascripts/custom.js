function toggleByClass(category){
  $('.category').each(function(index) {
    if ($(this).attr("id") == category.toLowerCase()) {
      $(this).show();
    }
    else {
      $(this).hide();
    }
  });
}
