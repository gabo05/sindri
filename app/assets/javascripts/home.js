var initialize = function(){
    $(document).on('click', '#search', function(){
        var key = $('#key').val()
        window.location += encodeURI('?ticket_id='+key)
    });
}