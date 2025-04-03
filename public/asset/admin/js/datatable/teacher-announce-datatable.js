"use strict";
var table = $('#teacherAnnounceDatatable').DataTable({
    processing: true,
    serverSide: true,
    ajax:  $('#teacherAnnounceDatatable').attr('data-url'),
    columns: [
        {data: 'id', name: 'id'},
        {data: 'teachers.full_name', name: 'teachers.full_name'},
        {data: 'title', name: 'title'},
        {data: 'content', name: 'content'},
        {data: 'action', name: 'action', orderable: false, searchable: false},
    ]
});


