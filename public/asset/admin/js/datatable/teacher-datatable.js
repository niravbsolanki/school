"use strict";
var table = $('#teacherDatatable').DataTable({
    processing: true,
    serverSide: true,
    ajax:  $('#teacherDatatable').attr('data-url'),
    columns: [
        {data: 'id', name: 'id'},
        {data: 'full_name', name: 'full_name'},
        {data: 'username', name: 'username'},
        {data: 'show_pwd', name: 'show_pwd'},
        {data: 'action', name: 'action', orderable: false, searchable: false},
    ]
});

$(document).on('click', '.del', function (e) {
            const el = $(this);
            const url = el.data('url');
            const id = el.data('id');
        if(confirm('Are you sure want to Delete this?')){
            $.ajax({
                type: "POST",
                url: url,
                cache: false,
                data: {
                    id: id,
                    _method: 'DELETE'
                }
            }).always(function (respons) {
                table.ajax.reload();
            }).done(function (respons) {
                toastr.success(respons.message, 'Success');
            }).fail(function (respons) {
                var data = respons.responseJSON;
                toastr.error(data, 'Error');
            });
        }
           
    
    });

