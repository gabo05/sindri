var initialize = function(){
	load_picture();

	$(document).on('submit','#business_form',function(e){
		e.preventDefault();

		var name = $('#business_name');

		if(isEmpty(name)){
			showValidationMessage(name,'El campo Nombre es requerido');
			return;
		}

		this.submit();
	});
}