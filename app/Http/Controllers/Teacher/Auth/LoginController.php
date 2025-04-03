<?php

namespace App\Http\Controllers\Teacher\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login() {
        return view('teacher.auth.login');
    }

    public function loginPost(Request $request) {
        $request->validate([
            'username'=> 'required',
            'password'=> 'required'
        ]);
        // dd($request->all());
        
        $credentials = $request->only('username','password');
        if (Auth::guard('teacher')->attempt($credentials)) {
            return redirect()->route('teacher.dashboard');
        }
        return back()->withErrors([
            'username' => 'The provided credentials do not match our records.',
        ]);
    }

    public function logout() {
        auth('teacher')->logout();
        return redirect('/teacher/login');
    }
}
