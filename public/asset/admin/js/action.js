function stopLoader() {
    $.unblockUI();
}

function showLoader() {

    $.blockUI({
        message: lodingImage,
        baseZ: 2000,
        css: {
            border: '0',
            cursor: 'wait',
            backgroundColor: 'transparent'
        },
    });

}

$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    if (jQuery().dataTable) {
        $.extend(true, $.fn.dataTable.defaults, {
            oLanguage: {
                oPaginate: {
                    sNext: '<span class="pagination-default"></span><span class="pagination-fa"><i class="fa fa-angle-double-right"></i></span>',
                    sPrevious: '<span class="pagination-default"></span><span class="pagination-fa"><i class="fa fa-angle-double-left"></i></i></span>'
                }
            }
        });
    };

    if (jQuery().validate) {

        jQuery.validator.setDefaults({
            errorPlacement: function (error, element) {
                $(error).addClass('text-danger');
                error.insertAfter(element);
            }
        });

        jQuery.validator.addMethod("unique", function (value, element, params) {
            var prefix = params;
            var selector = jQuery.validator.format("[name!='{0}']{1}", element.name, prefix);
            var matches = new Array();
            $(selector).each(function (index, item) {
                if (value == $(item).val()) {
                    matches.push(item);
                }
            });
            return matches.length == 0;
        }, "Value is not unique.");


        jQuery.validator.classRuleSettings.unique = {
            unique: true
        };

        jQuery.validator.addMethod("phonenumber", function (value, element) {
            var a = value;
            var filter =
                /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
            if (filter.test(a)) {
                return true;
            } else {
                return false;
            }
        }, 'Please enter a valid phone number.');

        $.validator.addMethod('filesize', function (value, element, param) {
            if (element.files.length) {
                return this.optional(element) || (element.files[0].size <= param)
            }
            return true;
        }, 'File size must be less than 5mb.');

        $.validator.addMethod('ckdata', function (value, element, param) {
            var editor = CKEDITOR.instances[$(element).attr('id')];
            if (editor.getData().length <= 0) {
                return false;
            } else {
                return true;
            }
        }, 'This field is required.');

    }

    $(document).on('click', '.delete-confrim', function (e) {
        e.preventDefault();

        var el = $(this);
        var url = el.attr('href');
        var id = el.data('id');
        var refresh = el.closest('table');

        message.fire({
            title: 'Are you sure',
            text: "You want to delete this ?",
            type: 'warning',
            customClass: {
                confirmButton: 'btn btn-success shadow-sm mr-2',
                cancelButton: 'btn btn-danger shadow-sm'
            },
            buttonsStyling: false,
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
        }).then((result) => {
            if (result.value) {

                //showLoader();
                $.ajax({
                    type: "POST",
                    url: url,
                    cache: false,
                    data: {
                        id: id,
                        _method: 'DELETE'
                    }
                }).always(function (respons) {

                    //stopLoader();

                    $(refresh).DataTable().ajax.reload();

                }).done(function (respons) {

                    message.fire({
                        type: 'success',
                        title: 'Success',
                        text: respons.message
                    });

                }).fail(function (respons) {
                    var data = respons.responseJSON;
                    message.fire({
                        type: 'error',
                        title: 'Error',
                        text: data.message ? data.message :
                            'something went wrong please try again !'
                    });

                });
            }
        });

    });
    //Function for take confirmation from admin user to unassign employee to class and subject and also use for get method route
    $(document).on('click', '.action-confrim', function (e) {
        e.preventDefault();

        var el = $(this);
        var url = el.attr('href');
        var refresh = el.closest('table');

        message.fire({
            title: 'Are you sure',
            text: "You want to delete this ?",
            type: 'warning',
            customClass: {
                confirmButton: 'btn btn-success shadow-sm mr-2',
                cancelButton: 'btn btn-danger shadow-sm'
            },
            buttonsStyling: false,
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
        }).then((result) => {
            if (result.value) {

                //showLoader();
                $.ajax({
                    type: "GET",
                    url: url,
                    cache: false
                }).always(function (respons) {
                    $(refresh).DataTable().ajax.reload();

                }).done(function (respons) {

                    message.fire({
                        type: 'success',
                        title: 'Success',
                        text: respons.message
                    });

                }).fail(function (respons) {
                    var data = respons.responseJSON;
                    message.fire({
                        type: 'error',
                        title: 'Error',
                        text: data.message ? data.message :
                            'something went wrong please try again !'
                    });

                });
            }
        });

    });
    //End of above
    $(document).on('click', '.change-status', function (e) {

        var el = $(this);
        var url = el.data('url');
        var table = el.data('table');
        var id = el.val();
        
        $.ajax({
            type: "POST",
            url: url,
            data: {
                id: id,
                status: el.prop("checked"),
                table: table,
            }
        }).always(function (respons) { }).done(function (respons) {

            message.fire({
                type: 'success',
                title: 'Success',
                text: respons.message
            });

        }).fail(function (respons) {

            message.fire({
                type: 'error',
                title: 'Error',
                text: 'something went wrong please try again !'
            });

        });

    });

     $(document).on('click', '.academicyear', function (e) {

        var el = $(this);
        var url = el.data('url');
        var table = el.data('table');
        var id = el.val();
        $('.academicyear').not(this).prop('checked', false);  
        
        $.ajax({
            type: "POST",
            url: url,
            data: {
                id: id,
                is_default: el.prop("checked"),
                table: table,
            }
        }).always(function (respons) { }).done(function (respons) {

            message.fire({
                type: 'success',
                title: 'Success',
                text: respons.message
            });


        }).fail(function (respons) {
            if(respons.status == 422){
               message.fire({
                    type: 'warning',
                    title: 'Warning',
                    text: respons.responseText
                }); 
            } else {
                message.fire({
                    type: 'error',
                    title: 'Error',
                    text: 'something went wrong please try again !'
                });
            }

        });

    });

    $(document).on('click', '.call-modal', function (e) {
        e.preventDefault();
        var el = $(this);
        var url = el.data('url');
        var target = el.data('target-modal');

        $.ajax({            
          type: "GET",
          url: url
        }).always(function () {
            $('#load-modal').html(' ')
        }).done(function (res) {
            //console.log(status);
            $('#load-modal').html(res.html);
            $(target).modal('toggle');
        }).fail(function (jqXHR, status, errorThrown) { 
            if(jqXHR.status == 422)
            {
                 message.fire({
                    type: 'warning',
                    title: 'Warning',
                    text: jqXHR.responseText
                });
            }
            
            
        });
    });

});
