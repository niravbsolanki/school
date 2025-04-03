<?php

use App\Http\Middleware\IfAdminNotRedirect;
use App\Http\Middleware\IfAdminRedirect;
use App\Http\Middleware\IfParentNotRedirect;
use App\Http\Middleware\IfParentRedirect;
use App\Http\Middleware\IfStudentNotRedirect;
use App\Http\Middleware\IfStudentRedirect;
use App\Http\Middleware\IfTeacherNotRedirect;
use App\Http\Middleware\IfTeacherRedirect;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->alias([
            'admin.guest' => IfAdminNotRedirect::class,
            'admin.auth'=>IfAdminRedirect::class,
            'teacher.guest' => IfTeacherNotRedirect::class,
            'teacher.auth'=>IfTeacherRedirect::class,
            'student.guest' => IfStudentNotRedirect::class,
            'student.auth'=>IfStudentRedirect::class,
            'myparent.guest' => IfParentNotRedirect::class,
            'myparent.auth'=>IfParentRedirect::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
