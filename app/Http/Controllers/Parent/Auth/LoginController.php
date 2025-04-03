<?php

namespace App\Http\Controllers\Parent\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login() {
        return view('parent.auth.login');
    }

    public function loginPost(Request $request) {
        $request->validate([
            'username'=> 'required',
            'password'=> 'required'
        ]);
        
        $credentials = $request->only('username','password');
        if (Auth::guard('myparent')->attempt($credentials)) {
            return redirect()->route('parent.dashboard');
        }
        return back()->withErrors([
            'username' => 'The provided credentials do not match our records.',
        ]);
    }

    public function logout() {
        auth('myparent')->logout();
        return redirect('/parent/login');
    }
}
