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
	//Initialize jQuery Minicolors
	$('.minicolors-input').minicolors({
		position: 'bottom right'
	});
}
var validateOrganization = function(){
	bn = $('#business_name');
	if(isEmpty(bn)){
		showValidationMessage(bn);
		return false;
	}

	return true;
}
var submitInitConfig() = function(){
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

	$.ajax({
		type: 'POST',
		url: '/catalog/areas/add',
		data: {data: JSON.stringify(ids), business_id: org.id },
		dataType: 'json',
		contentType: 'application/json'
	}).done(function(result){
		after_save_areas(result);
	}).fail(function(jqXHR, textStatus, errorThrow){
		console.log(textStatus);
	});
}
var after_save_areas = function(org){
	var categories = $('.check-item-category:checked');
	var ids = [];

	categories.each(function(index){
		ids.push($(this).data('value'));
	});

	$.ajax({
		type: 'POST',
		url: '/catalog/categories/add',
		data: {data: JSON.stringify(ids), business_id: org.id},
		dataType: 'json',
		contentType: 'application/json'
	}).done(function(result){
		if(result.status == 'OK')
			window.location = '/home/index/'+result.id;
	}).fail(function(jqXHR, textStatus, errorThrow){
		console.log(textStatus);
	});
}