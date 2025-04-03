@extends('layouts.auth')
@section('title', 'Parent Login')
@section('content')
<div class="login-page-wrap" style="background-image: url(''); background-repeat: no-repeat; background-size: cover; }">
    <div class="login-page-content">
        <div class="login-box">
            <div class="item-logo">
           <h3>Parent Login</h3> 
            </div>
         
            <form method="POST" role="form" action="{{ route('parent.login') }}" class="login-form" name="loginForm" id="loginForm"> 
                @csrf
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" placeholder="Enter Username" class="form-control" id="username" name="username" value="{{ old('username') ?: old('username') }}">
                   <div class="text text-danger">{{$errors->first('username')}}</div>
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
