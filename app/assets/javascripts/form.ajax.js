$(document).on('submit', 'form[data-ajax="true"]', function(e){
	e.preventDefault();

	var form = $(this);
	var data = form.serialize();

	$.ajax({
		type: form.attr('method'),
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