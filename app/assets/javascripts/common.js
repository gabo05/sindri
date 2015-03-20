//Validations
function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
function isEmpty(input){
	return input.val().replace(' ', '') == ''
}
function showValidationMessage(input, message){
	applyInputStyle(input,'error');
	showPopover(input, message);
}
function showPopover(input, message){
	input.focus()
		.popover({
			html: true,
			content: message,
			container: 'body',
			placement: 'top'
		});
}
function applyInputStyle(input, class_name){
	input.parent().parent().addClass('has-'+class_name);
}