var areasData = {};
var categoriesData = {};
var organiztionData = {};

var initialize = function(){
	//Switches
	$('#settings_admin').bootstrapSwitch()
    $('#settings_client').bootstrapSwitch()
    $('#settings_notifications').bootstrapSwitch()

	//Initialize jQuery Steps Form
	$('#configuration-wizard').steps({
		headerTag: "h2",
		bodyTag: "section",
		transitionEffect: "slideLeft",
		onStepChanging: function(event, currentIndex, newIndex){
			if(currentIndex == 0)
				return validateOrganization();
			return true;
		},
	    onFinished: function (event, currentIndex){
	        submitInitConfig()
	    }

	});
	$('.minicolors-input').minicolors({
		position: 'bottom right'
	});
	disableInitialState(true);

	$(document).on('change', 'input[name="suggested"]', function(){
		var suggested = isSuggested();

		disableInitialState(suggested);

		if(suggested){
			$('#sc_suggested').show();
			$('#sc_custom').hide();
		}
		else{
			$('#sc_suggested').hide();
			$('#sc_custom').show();
		}
	});
}
var isSuggested = function(){
	return $('input[name="suggested"]:checked').val() === 'suggested';
}
var disableInitialState = function(disable){
	$('*[id^="st_"').prop('disabled', disable);
}
var validateOrganization = function(){
	bn = $('#name');
	if(isEmpty(bn)){
		showValidationMessage(bn, 'Ingrese un nombre valido para la organización');
		return false;
	}

	return true;
}
var validateState = function(){
	sb = $('#st_name');
	if(isEmpty(sb)){
		showValidationMessage(sb, 'Ingrese un nombre válido para el estado');
		return false;
	}
	return true;
}
var submitInitConfig = function(){
	if(validateOrganization()){
		$('#organization-form').submit();
	}
}

var after_save_org = function(org){
	var areas = $('.check-item-area:checked');
	var ids = [];

	areas.each(function(index){
		ids.push($(this).data('value'));
	});
	var d = {areas_id: ids.join('_'), business_id: org.id };
	$.ajax({
		type: 'GET',
		url: '/catalog/add_areas',
		data: d,
		dataType: 'json'
	}).done(function(result){
		after_save_areas(result);
	}).fail(function(jqXHR, textStatus, errorThrow){
		console.error(textStatus);
	});
}
var after_save_areas = function(org){
	var categories = $('.check-item-category:checked');
	var ids = [];

	categories.each(function(index){
		ids.push($(this).data('value'));
	});

	$.ajax({
		type: 'GET',
		url: '/catalog/add_categories',
		data: {categories_id: ids.join('_'), business_id: org.id},
		dataType: 'json',
	}).done(function(result){
		after_save_categories(result);
	}).fail(function(jqXHR, textStatus, errorThrow){
		console.error(textStatus);
	});
}
var after_save_categories = function(org){
	var data;
	if(isSuggested()){
		var states = $('.check-item-state:checked');
		var ids = [];

		states.each(function(index){
			ids.push($(this).data('value'));
		});
		data = {business_id: org.id, states_id: ids.join('_'), suggested: 'suggested'};
	}
	else{
		if(validateState()){
			data = {
				name: $('#st_name').val(),
				description: $('#st_description').val(),
				color: $('#st_color').val(),
				business_id: org.id,
				suggested: 'custom'
			}
		}
		else return;
	}
	$.ajax({
		type: 'GET',
		url: '/catalog/add_states',
		data: data,
		dataType: 'json',
	}).done(function(result){
		if(result.status == 'OK')
			window.location = '/business/edit/'+result.id;
	}).fail(function(jqXHR, textStatus, errorThrow){
		console.error(textStatus);
	});
}