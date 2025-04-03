@extends('layouts.auth')
@section('title', 'Admin Login')
@section('content')
<div class="login-page-wrap" style="background-image: url(''); background-repeat: no-repeat; background-size: cover; }">
    <div class="login-page-content">
        <div class="login-box">
            <div class="item-logo">
           <h3>Admin Login</h3> 
            </div>
         
            <form method="POST" role="form" action="{{ route('admin.login') }}" class="login-form" name="loginForm" id="loginForm"> 
                @csrf
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" placeholder="Enter Username" class="form-control" id="name" name="name" value="{{ old('name') ?: old('name') }}">
                   <div class="text text-danger">{{$errors->first('name')}}</div>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" placeholder="Enter password" class="form-control" id="password" name="password">
                </div>
                <div class="text text-danger">{{$errors->first('password')}}</div>
                <div class="form-group">
                    <button type="submit" class="login-btn">Login</button>
                </div>
            </form>
           
        </div>
    </div>
</div>

@endsection

