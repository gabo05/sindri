// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
var rowTemplate;

var after_save = function(result){
    if(result.status === 'OK'){
        $('#activities tbody .no-records').hide();
        add_row(result.data.values[0]);
    }
};
var add_row = function(item){
    
    fromdate = parseDate(item.from);
    item.from = getFormatDate(fromdate);

    todate = parseDate(item.to);
    item.to = getFormatDate(todate);

    item.time = (todate.valueOf() - fromdate.valueOf())/1000/60/60/24

    var row   = rowTemplate(item);

    $('#activities tbody').append(row);
};
var loadGantt = function(data){
    $(".gantt").gantt(data);
};
var loadTable = function(data){
    source = data.source;
    for(var i = 0; i<source.length; i++){
        item = source[i].values[0];
        add_row(item);
    }
};
var loadData = function(partial){
    var id = $('#schedule_id').val();
    $('#activities tbody .no-records').show();
    $.ajax({
        type: 'GET',
        url: '/schedule/activities/'+id,
        dataType: 'json'
    }).done(function(result){
        if(result.status == 'OK'){
            $('#activities tbody .no-records').hide();
            if(partial == 'all'){
                loadGantt(result.data);
                loadTable(result.data);
            }
            else
                if(partial == 'gantt'){
                    loadGantt(result.data);
                }
                else{
                    loadTable(result.data);
                }
        }
        else
            if(result.status == 'NO-RECORDS'){
                $('#activities tbody .no-records').show();
            }
    }).fail(function(jqXHR, textStatus){
        console.error(textStatus);
    }).always(function(){
        
    });
};
var initialize = function(){
    var source   = $("#row-template").html();
    rowTemplate = Handlebars.compile(source);

    loadData('all');

    $('#dtp_start_date').on("dp.change",function (e) {
        $('#dtp_end_date').data("DateTimePicker").minDate(e.date);
    });
    $('#dtp_end_date').on("dp.change",function (e) {
        $('#dtp_start_date').data("DateTimePicker").maxDate(e.date);
    });

    $(document).on('click', '#dgantt', function(){
        loadData('gantt');
    });
};

//Date JSON Parser

var reISO = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*))(?:Z|(\+|-)([\d|:]*))?$/;
var reMsAjax = /^\/Date\((d|-|.*)\)[\/|\\]$/;
   
var parseDate = function (value) {
    if (typeof value === 'string') {
        var a = reISO.exec(value);
        if (a)
            return new Date(value);
        a = reMsAjax.exec(value);
        if (a) {
            var b = a[1].split(/[-+,.]/);
            return new Date(b[0] ? +b[0] : 0 - +b[1]);
        }
    }
    return value;
};
var getFormatDate = function(date){
    return date.getDate() +"/"+ (date.getMonth()+1)+"/"+date.getYear()
}

var validate = function(){
    var name = $('#name');
    var start = $('#start_date');
    var end = $('#end_date');
    if(isEmpty(name)){
        showValidationMessage(name,'El campo Nombre es requerido');
        return false;
    }
    if(isEmpty(start)){
        showValidationMessage(start,'El campo Inicia es requerido');
        return false;
    }
    if(isEmpty(end)){
        showValidationMessage(end,'El campo Inicia es requerido');
        return false;
    }
    return true;
}