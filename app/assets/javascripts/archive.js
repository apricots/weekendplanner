$(document).ready(function(){

    $('.submittable').click(function() {
        $(this).parents('form:first').submit();
    });

}); 