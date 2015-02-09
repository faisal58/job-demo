$(function() {

    $('#seeker_dob').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: "yy-mm-dd",
        yearRange:  "1970:-18",
        altFormat:  "yy-mm-dd",
        duration:   "slow"
    });

    var seeker = $('.save_seeker');
    seeker.submit(function (e) {
        $.ajax({
            url : seeker.attr('action'),
            data: seeker.serializeArray(),
            dataType : 'json',
            type : 'post',
            success : function(data) {
                gritter('Huray!!', 'Your profile has been saved', 0);
            },
            error: function(xhr) {
                var errors = $.parseJSON(xhr.responseText).errors;
                gritter('Opps!!', 'Please fix those errors.', 1);
                process_error_to_html_form('seeker_', errors, seeker);
            }
        });

        return false;
    });

});
