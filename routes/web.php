<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect('/admin/login');
});

require __DIR__ . '/admin.php';
require __DIR__ . '/teacher.php';
require __DIR__ . '/student.php';
require __DIR__ . '/parent.php';
