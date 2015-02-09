// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require ../stylesheets/js/bootstrap.min
//= require lib/jquery.gritter/js/jquery.gritter
//= require_tree .

var gritter = function(title, message, errorLevel)
{
    $.gritter.add({
        title: title,
        text: message,
        class_name: errorLevel == 0 ? 'success' : 'danger'
    });
};


var nano = function (template, data) {
    return template.replace(/\{([\w\.]*)\}/g, function(str, key) {
        var keys = key.split("."), v = data[keys.shift()];
        for (var i = 0, l = keys.length; i < l; i++) v = v[keys[i]];
        return (typeof v !== "undefined" && v !== null) ? v : "";
    });
};

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
