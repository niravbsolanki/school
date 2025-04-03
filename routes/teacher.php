<?php

use App\Http\Controllers\Teacher\AnnouncementController;
use App\Http\Controllers\Teacher\DashboardController;
use App\Http\Controllers\Teacher\Auth\LoginController;
use App\Http\Controllers\Teacher\StudentController;

use Illuminate\Support\Facades\Route;

//Teacher Guest
Route::prefix('teacher')->middleware('teacher.guest')->group(function(){
    Route::get('login', [LoginController::class,'login'])->name('teacher.login');
    Route::post('login-post', [LoginController::class,'loginPost'])->name('teacher.login');
});

//Teacher Auth
Route::prefix('teacher')->middleware('teacher.auth')->group(function(){
    Route::get('logout', [LoginController::class,'logout'])->name('teacher.logout');
    Route::get('dashboard', [DashboardController::class,'index'])->name('teacher.dashboard');
    Route::get('teancher-announce', [DashboardController::class,'indexTeancherAnnouncement'])->name('teacher.teancher-announce.index');
    Route::get('student', [StudentController::class,'index'])->name('teacher.student.index');
    Route::get('parent', [StudentController::class,'indexParent'])->name('teacher.parent.index');
    Route::get('announce', [AnnouncementController::class,'index'])->name('teacher.announce');
    Route::post('announce/store', [AnnouncementController::class,'store'])->name('teacher.announce.store');
    Route::get('student-login/{id}', [StudentController::class,'teacherStudentLogin'])->name('teacher.login.student');
    Route::get('parent-login/{id}', [StudentController::class,'teacherParentLogin'])->name('teacher.login.parent');

});
