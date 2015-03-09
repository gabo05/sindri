/*
ti x ar,ag,cli, cat
ti re, v, pa
*/
var after_generate_report = function(result){
	result.noRowsMessage = 'No hay resultados que mostrar';
	$('.table').SimpleTable(result);
}
var initialize = function(){
	
}