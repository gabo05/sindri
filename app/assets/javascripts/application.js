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

	$(document).on('submit', 'form[data-ajax="true"]', function(e){
		e.preventDefault();

		var form = $(this);
		var data = form.serialize();

		$.ajax({
			type: 'POST',
			url: form.attr('action'),
			data: data,
			dataType: form.data('type')
		}).done(function(result){
			if(window[form.data('success')])
				window[form.data('success')](result);
		}).fail(function(jqXHR, textStatus){
			if(window[form.data('fail')])
				window[form.data('fail')](jqXHR, textStatus);
		}).always(function(){
			if(window[form.data('completed')])
				window[form.data('completed')]();
		});
	});
	$('.date').datetimepicker({
        format: 'DD/MM/YYYY'
    });
	if(typeof initialize === 'function')
    	initialize();
});