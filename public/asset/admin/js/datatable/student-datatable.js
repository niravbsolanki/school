"use strict";
var table = $('#studentDatatable').DataTable({
    processing: true,
    serverSide: true,
    ajax:  $('#studentDatatable').attr('data-url'),
    columns: [
        {data: 'id', name: 'id'},
        {data: 'full_name', name: 'full_name'},
        {data: 'username', name: 'username'},
        {data: 'email', name: 'email'},
        {data: 'enrollment_number', name: 'enrollment_number'},
        {data: 'action', name: 'action', orderable: false, searchable: false},
    ]
});



