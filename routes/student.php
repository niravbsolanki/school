<?php

use App\Http\Controllers\Student\Auth\LoginController;
use App\Http\Controllers\Student\DashboardController;
use Illuminate\Support\Facades\Route;

//Teacher Guest
Route::prefix('student')->middleware('student.guest')->group(function(){
    Route::get('login', [LoginController::class,'login'])->name('student.login');
    Route::post('login-post', [LoginController::class,'loginPost'])->name('student.login');
});

//Teacher Auth
Route::prefix('student')->middleware('student.auth')->group(function(){
    Route::get('logout', [LoginController::class,'logout'])->name('student.logout');
    Route::get('dashboard', [DashboardController::class,'index'])->name('student.dashboard');
});