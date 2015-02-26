var initialize = function(){
	$document.on('submit','#register-form', function(e){
		e.preventDefault();
		//inputs
		first_name = $('#agent_first_name');
		email = $('#email');
		pass = $('password');
		conpass = $('#confirm_password');
		//Validations
		if(isEmpty(first_name)){
			showValidationMessage(first_name,'El campo Nombre es requerido');
			return;
		}
		if(isEmpty(email)){
			showValidationMessage(email, 'El campo correo es requerido');
			return;
		}
		if(!validateEmail(email)){
			showValidationMessage(email, 'Ingrese una dirección de correo válida');
			return;
		}
		if(pass != conpass){
			conpass.val('');
			showValidationMessage(conpass, 'Las contraseñas no coinciden');
			return;
		}

		this.submit();
	});
}
