<?php

use App\Http\Controllers\Admin\AnnouncementController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\Admin\StudentController;
use App\Http\Controllers\Admin\TeacherController;
use Illuminate\Support\Facades\Route;

//Admin Guest
Route::middleware('admin.guest')->group(function(){
    Route::get('/admin/login', [LoginController::class,'login'])->name('admin.login');
    Route::post('/admin/login-post', [LoginController::class,'loginPost'])->name('admin.login');
});

//Admin Auth
Route::prefix('admin')->middleware('admin.auth')->group(function(){
    Route::get('logout', [LoginController::class,'logout'])->name('admin.logout');
    Route::get('dashboard', [DashboardController::class,'index'])->name('admin.dashboard');
    Route::get('announce', [AnnouncementController::class,'index'])->name('admin.announce');
    Route::post('announce/store', [AnnouncementController::class,'store'])->name('admin.announce.store');
    Route::resource('teacher', TeacherController::class);
    Route::get('student', [StudentController::class,'index'])->name('admin.student.index');
    Route::get('parent', [StudentController::class,'indexParent'])->name('admin.parent.index');
    Route::get('teancher-announce', [AnnouncementController::class,'indexTeacherAnnouncement'])->name('admin.teancher-announce.index');

});