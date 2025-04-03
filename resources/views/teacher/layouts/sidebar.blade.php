 <div class="sidebar-main sidebar-menu-one sidebar-expand-md sidebar-color">
     <div class="mobile-sidebar-header d-md-none">
         <div class="header-logo">
             <a href="index.html"><img src="{{ asset('asset/admin/img/logo1.png') }}" alt="logo"></a>
         </div>
     </div>
     <div class="sidebar-menu-content">
         <ul class="nav nav-sidebar-menu sidebar-toggle-view">

             <li class="nav-item">
                 <a href="{{route('teacher.dashboard')}}" class="nav-link"><i class="flaticon-dashboard"></i><span>Dashboard</span></a>
             </li>
             <li class="nav-item">
                <a href="{{route('teacher.announce')}}" class="nav-link"><i class="flaticon-dashboard"></i><span>Announcement</span></a>
            </li>
            <li class="nav-item">
                <a href="{{route('teacher.student.index')}}" class="nav-link"><i class="flaticon-classmates"></i><span>Students</span></a>
            </li>
            <li class="nav-item">
                <a href="{{route('teacher.parent.index')}}" class="nav-link"><i class="flaticon-couple"></i><span>Parents</span></a>
            </li>
        
         </ul>
     </div>
 </div>