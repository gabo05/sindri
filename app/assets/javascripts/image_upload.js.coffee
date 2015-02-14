$ ->
    $(document).on('click', '#preview-picture', () ->
        $('#picture').trigger('click')
    )
    readImage = (input) ->
        if input.files and input.files[0]
            reader = new FileReader()
            reader.onload = (e) ->
                $('#preview-picture').attr('src', e.target.result);
            reader.readAsDataURL(input.files[0])
            
    $(document).on('change', '.picture-field', () ->
        readImage(this);
    )
        