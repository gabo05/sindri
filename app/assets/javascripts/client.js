var initialize = function(){
	load_picture();

	$(document).on('submit','#agent_form',function(e){
		e.preventDefault();

		var first_name = $('#first_name');
		var last_name = $('#last_name');
		var email = $('#email');

		if(isEmpty(first_name)){
			showValidationMessage(first_name,'El campo Nombre es requerido');
			return;
		}
		if(isEmpty(last_name)){
			showValidationMessage(last_name,'El campo Apellido es requerido');
			return;
		}
		if(isEmpty(email)){
			showValidationMessage(email,'El campo Email es requerido');
			return;
		}

		if(!validateEmail(email.val())){
			showValidationMessage(email, 'Ingrese una dirección de correo válida');
			return;
		}

		this.submit();
	});
}
