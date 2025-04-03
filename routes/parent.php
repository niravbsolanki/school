<?php

use App\Http\Controllers\Parent\Auth\LoginController;
use App\Http\Controllers\Parent\DashboardController;
use Illuminate\Support\Facades\Route;

//Teacher Guest
Route::prefix('parent')->middleware('myparent.guest')->group(function(){
    Route::get('login', [LoginController::class,'login'])->name('parent.login');
    Route::post('login-post', [LoginController::class,'loginPost'])->name('parent.login');
});

//Teacher Auth
Route::prefix('parent')->middleware('myparent.auth')->group(function(){
    Route::get('logout', [LoginController::class,'logout'])->name('parent.logout');
    Route::get('dashboard', [DashboardController::class,'index'])->name('parent.dashboard');
});