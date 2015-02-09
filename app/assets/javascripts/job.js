var process_error_to_html_form = function(prefix, errors, form) {
    form.find('div.form-group').removeClass('has-error').find('span.help-block').empty();
    $.each(errors, function(k,v) {
        var selector = $('#' + prefix + k);
        selector.next('span.help-block').html('<strong>' + k + '</strong>  ' + v + ' ');
        selector.parent().parent().addClass('has-error');
    });
};

var reset_form = function(form) {
    form.find("input, textarea").val("");
};

var activeTab = function(tabname) {
    $('.nav-tabs a[href="#' + tabname + '"]').tab('show');
};

$(function() {

    var new_job = $('#new_job');
    var open_jobs = $('#open_jobs_table');
    var all_jobs = $('#all_jobs_table');
    var job_row = '<tr>' +
                    '<td style="width:30%;">{title}</td>' +
                    '<td>{application_deadline}</td>' +
                    '<td class="text-right"><span class="badge badge-warning">0</span></td>' +
                  '</tr>';
    new_job.submit(function (e) {
        $.ajax({
            url : 'jobs',
            data: new_job.serializeArray(),
            dataType : 'json',
            type : 'post',
            success : function(data) {
                gritter('Success', 'Great! Your job has been saved successfully', 0);
                reset_form(new_job);
                open_jobs.find('tbody').append(nano(job_row, data));
                all_jobs.find('tbody').append(nano(job_row, data));
                activeTab('open-jobs');
            },
            error: function(xhr) {
                var errors = $.parseJSON(xhr.responseText).errors;
                gritter('Opps!!', 'Please fix those errors.', 1);
                process_error_to_html_form('job_', errors, new_job);
            }
        });

        return false;
    });

    $('#job_application_deadline').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: "yy-mm-dd",
        yearRange:  "2015:+0",
        altFormat:  "yy-mm-dd",
        duration:   "slow"
    });
});
