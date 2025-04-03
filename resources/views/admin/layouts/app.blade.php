<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 20 Jul 2020 07:14:03 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    {{-- page title --}}
    <title> School | @yield('title') </title>

    <meta name="description" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('admin/img/favicon.png') }}">
    <!-- Normalize CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/normalize.css') }}">
    <!-- Main CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/main.css') }}">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/bootstrap.min.css') }}">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/all.min.css') }}">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/fonts/flaticon.css') }}">
    <!-- Full Calender CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/fullcalendar.min.css') }}">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/css/animate.min.css') }}">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ asset('asset/admin/style.css') }}">
    <!-- Modernize js -->
    <script src="{{ asset('asset/admin/js/modernizr-3.6.0.min.js') }}"></script>
    <link href="{{asset('asset/admin/js/tost/build/toastr.css')}}" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="{{ asset('asset/admin/css/jquery.dataTables.min.css') }}">
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
    <!-- Preloader End Here -->
    <div id="wrapper" class="wrapper bg-ash">

       <!-- Header Menu Area Start Here -->

        @include('admin.layouts.header')

        <!-- Header Menu Area End Here -->
        <!-- Page Area Start Here -->

        <div class="dashboard-page-one">

            <!-- Sidebar Area Start Here -->

           @include('admin.layouts.sidebar')
           
            <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>@yield('page_title')</h3>
                    
                </div>
                <!-- Breadcubs Area End Here -->
                @yield('content')
                <!-- Social Media End Here -->
                <!-- Footer Area Start Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">School</a> 2025. All rights reserved.</div>
                </footer>
                <!-- Footer Area End Here -->
            </div>
        </div>
        <!-- Page Area End Here -->
    </div>
    <!-- jquery-->
    <script src="{{ asset('asset/admin/js/jquery-3.3.1.min.js') }}"></script>
    <!-- Plugins js -->
    <script src="{{ asset('asset/admin/js/plugins.js') }}"></script>
    <!-- Popper js -->
    <script src="{{ asset('asset/admin/js/popper.min.js') }}"></script>
    <!-- Bootstrap js -->
    <script src="{{ asset('asset/admin/js/bootstrap.min.js') }}"></script>
    <!-- Counterup Js -->
    <script src="{{ asset('asset/admin/js/jquery.counterup.min.js') }}"></script>
    <!-- Moment Js -->
    <script src="{{ asset('asset/admin/js/moment.min.js') }}"></script>
    <!-- Waypoints Js -->
    <script src="{{ asset('asset/admin/js/jquery.waypoints.min.js') }}"></script>
    <!-- Scroll Up Js -->
    <script src="{{ asset('asset/admin/js/jquery.scrollUp.min.js') }}"></script>
    
    <!-- Custom Js -->
    <script src="{{ asset('asset/admin/js/main.js') }}"></script>
    <script type="text/javascript" src="{{ asset('asset/admin/js/tost/build/toastr.min.js')}}"></script>
    <script src="{{asset('asset/admin/js/jquery.dataTables.min.js')}}"></script>
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
   


    @if (session('success'))
    <script type="text/javascript">
        toastr.success('{{ session('success') }}', 'Success');
    </script>
    @endif

    @if (session('danger'))
    <script type="text/javascript">
        toastr.error('{{ session('error') }}', 'Error');
    </script>
    @endif

    @stack('js')
    
    @stack('script')
</body>
</html>