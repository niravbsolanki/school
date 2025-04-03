"use strict";
var table = $('#parentDatatable').DataTable({
    processing: true,
    serverSide: true,
    ajax:  $('#parentDatatable').attr('data-url'),
    columns: [
        {data: 'id', name: 'id'},
        {data: 'full_name', name: 'full_name'},
        {data: 'username', name: 'username'},
        {data: 'email', name: 'email'},
        {data: 'phone', name: 'phone'},
        {data: 'action', name: 'action', orderable: false, searchable: false},
    ]
});


