(function($){
    $.fn.DataTable = function(options){
        var settings = $.extend({
            columns: [],
            data: []
        }, options);
        
        return this.each(function(){
            table = $(this);
            head = $('<thead><tr></tr></thead>');
            body = $('<tbody></tbody>');
            
            columns = settings.columns;
            
            for(var i = 0; i < columns.length; i++){
                field = columns[i];
                tdh = $('<td></td>');
                tdh.text(field);
                head.append(tdh);
            }
            for(var j = 0; j < data.length; j++){
                row = data[j]; 
                tbRow = $('<tr></tr>');
                
                for(var k = 0; k < row.length; k++){
                    value = row[k];
                    td = $('<td></td>');
                    td.text(value);
                    tbRow.append(td);
                }
                body.append(tbRow);
            }
            console.log('head: '+head.html());
            console.log('body: '+body.html());
            table.append(head);
            table.append(body);
        });
    }
}(jQuery))