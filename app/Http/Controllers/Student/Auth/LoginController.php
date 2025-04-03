<?php

namespace App\Http\Controllers\Student\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login() {
        return view('student.auth.login');
    }

    public function loginPost(Request $request) {
        $request->validate([
            'username'=> 'required',
            'password'=> 'required'
        ]);
        
        $credentials = $request->only('username','password');
        if (Auth::guard('student')->attempt($credentials)) {
            return redirect()->route('student.dashboard');
        }
        return back()->withErrors([
            'username' => 'The provided credentials do not match our records.',
        ]);
    }

    public function logout() {
        auth('student')->logout();
        return redirect('/student/login');
    }
}
