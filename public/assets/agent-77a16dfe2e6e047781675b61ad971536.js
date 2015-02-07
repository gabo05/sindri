(function() {
  $(function() {
    return $(document).on('click', '#preview-picture', function() {
      return $('#picture').trigger('click');
    });
  });

}).call(this);
