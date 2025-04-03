<!doctype html>
<html class="no-js" lang="en">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>School | @yield('title')</title>
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="#">
    <!-- Normalize CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/normalize.css') }}">
    <!-- Main CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/main.css') }}">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/plugin/bootstrap/css/bootstrap.min.css') }}">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/all.min.css') }}">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/fonts/flaticon.css') }}">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/animate.min.css') }}">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/style.css') }}">
    <link href="{{asset('asset/admin/js/tost/build/toastr.css')}}" rel="stylesheet" type="text/css" />
    <!-- Modernize js -->
    <script src="{{ asset('asset/admin/js/modernizr-3.6.0.min.js') }}"></script>
    <script>
        window.Laravel = @json([
            'csrfToken' => csrf_token(),
        ])
    </script>
    @stack('css')
    @stack('style')
</head>

<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>

    @yield('content')

    <script src="{{ asset('asset/admin/js/jquery-3.3.1.min.js') }}"></script>
    <!-- Plugins js -->
    <script src="{{ asset('asset/admin/js/plugins.js') }}"></script>
    <!-- Popper js -->
    <script src="{{ asset('asset/admin/js/popper.min.js') }}"></script>
    <!-- Bootstrap js -->
    <script src="{{ asset('asset/admin/plugin/bootstrap/js/bootstrap.min.js') }}"></script>
    <!-- Scroll Up Js -->
    <script src="{{ asset('asset/admin/js/jquery.scrollUp.min.js') }}"></script>
    <!-- Validation -->
    <script src="{{ asset('asset/admin/js/jquery-validation/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('asset/admin/js/jquery-validation/additional-methods.min.js') }}"></script>
    <!-- Custom Js -->
    <script src="{{ asset('asset/admin/js/main.js') }}"></script>
    <script type="text/javascript" src="{{ asset('asset/admin/js/tost/build/toastr.min.js')}}"></script>
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
    @stack('js')
    @stack('scripts')


    @if (session('success'))
    <script type="text/javascript">
        toastr.success('{{ Session::get('
            success ') }}', 'Success');
    </script>
    @endif

    @if (session('danger'))
    <script type="text/javascript">
        toastr.error('{{ Session::get('
            danger ') }}', 'Error');
    </script>
    @endif

    @if(session()->has('message'))
    <div class="alert alert-success" style="color: green;">
        {{ session()->get('message') }}
    </div>
    @endif

</body>

</html>