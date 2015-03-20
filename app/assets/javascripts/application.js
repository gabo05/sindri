// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
$(document).on('ready', function(){
	//Initialize jQuery Datepicker
    $('.date').datetimepicker({
        format: 'DD/MM/YYYY'
    });
    $('.date-month').datetimepicker({
        viewMode: 'months',
        format: 'MM'
    });
    //Initialize jQuery Minicolors
	$('.minicolors-input').minicolors({
		position: 'bottom right'
	});
	$('.minimal-blue input').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue',
        increaseArea: '20%' // optional
    });
    $('.square-blue input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
    });
	if(typeof initialize === 'function')
    	initialize();
});