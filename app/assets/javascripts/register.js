var strongRegex = new RegExp("^(?=.{6,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W).*$", "g");
var initialize = function(){
	$(document).on('submit','#register-form', function(e){
		e.preventDefault();
		//inputs
		first_name = $('#agent_first_name');
		email = $('#email');
		pass = $('#password');
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
		if(!validateEmail(email.val())){
			showValidationMessage(email, 'Ingrese una dirección de correo válida');
			return;
		}
		if(pass.val() != conpass.val()){
			conpass.val('');
			showValidationMessage(conpass, 'Las contraseñas no coinciden');
			return;
		}
		if(pass.val().length < 6){
			showValidationMessage(pass, 'Las contraseña debe tener una longitud mayor o igual a 6 caracteres');
			return;
		}
			
		if(strongRegex.test(pass.val())){
			showValidationMessage(conpass, 'Las contraseña es muy débil. Debe incluir mayúsculas, minúsculas, números y caracteres especiales');
			return;
		}

		this.submit();
	});

	$(document).on('submit', '#chpass', function(e){
		e.preventDefault();


		pass = $('#newpass');
		conpass = $('#confirm_password');

		if(pass.val() != conpass.val()){
			conpass.val('');
			showValidationMessage(conpass, 'Las contraseñas no coinciden');
			return;
		}
		if(pass.val().length < 6){
			showValidationMessage(conpass, 'Las contraseña debe tener una longitud mayor o igual a 6 caracteres');
			return;
		}
			
		if(strongRegex.test(pass.val().value)){
			showValidationMessage(conpass, 'Las contraseña es muy débil. Debe incluir mayúsculas, minúsculas, números y caracteres especiales');
			return;
		}
		this.submit();
	});
}
