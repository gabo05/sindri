var load_picture = function(){
    $(document).on('click', '#preview-picture', function(){
        $('#'+$(this).data('file')).trigger('click')
    });
    readImage = function(input){
        if(input.files && input.files[0])
            reader = new FileReader();
            reader.onload = function(e){
                $('#preview-picture').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
    };
    $(document).on('change', '.picture-field', function(){
        readImage(this);
    });
}       