/*
ti x ar,ag,cli, cat
ti re, v, pa
*/
var after_generate_report = function(result){
	result.noRowsMessage = 'No hay resultados que mostrar';
	$('.table').SimpleTable(result);
}
var after_generate_graphic_ts = function(result){
	$('#graphic_ts').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Tickets por Estado'
        },
        xAxis: {
            categories: [
                'Estados'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'No Tickets'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} Tickets</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: result
    });
}
var after_generate_graphic_tc = function(result){
	$('#graphic_tc').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Tickets por Categorias'
        },
        xAxis: {
            categories: [
                'Categorias'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'No Tickets'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} Tickets</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: result
    });
}
var after_generate_graphic_sa = function(result){
    $('#graphic_sa').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Soluciones por Agente'
        },
        xAxis: {
            categories: [
                'Agentes'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'No Soluciones'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} Soluciones</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: result
    });
}
var initialize = function(){
	
	
}