<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login() {
        return view('admin.auth.login');
    }

    public function loginPost(Request $request) {

        $request->validate([
            'name'=> 'required',
            'password'=> 'required'
        ],[
            'name.required' => 'The username field is required.' 
        ]);
        
        $credentials = $request->only('name','password');
        if (Auth::guard('admin')->attempt($credentials)) {
            return redirect()->route('admin.dashboard');
        }
        return back()->withErrors([
            'name' => 'The provided credentials do not match our records.',
        ]);
    }

    public function logout() {
        auth('admin')->logout();
        return redirect('/admin/login');
    }
}
