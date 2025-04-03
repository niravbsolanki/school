 <div class="sidebar-main sidebar-menu-one sidebar-expand-md sidebar-color">
     <div class="mobile-sidebar-header d-md-none">
         <div class="header-logo">
             <a href="index.html"><img src="{{ asset('asset/admin/img/logo1.png') }}" alt="logo"></a>
         </div>
     </div>
     <div class="sidebar-menu-content">
         <ul class="nav nav-sidebar-menu sidebar-toggle-view">

             <li class="nav-item">
                 <a href="{{route('admin.dashboard')}}" class="nav-link"><i class="flaticon-dashboard"></i><span>Dashboard</span></a>
             </li>
             <li class="nav-item">
                <a href="{{route('admin.announce')}}" class="nav-link"><i class="flaticon-calendar"></i><span>Announcement</span></a>
            </li>
             <li class="nav-item sidebar-nav-item">
                <a href="#" class="nav-link"><i class="flaticon-multiple-users-silhouette"></i><span>Teachers</span></a>
                <ul class="nav sub-group-menu">
                    <li class="nav-item">
                        <a href="{{route('teacher.index')}}" class="nav-link"><i class="fas fa-angle-right"></i>All
                            Teachers</a>
                    </li>
                   
                    <li class="nav-item">
                        <a href="{{route('teacher.create')}}" class="nav-link"><i class="fas fa-angle-right"></i>Add
                            Teacher</a>
                    </li>
                   
                </ul>
            </li>
             
             <li class="nav-item sidebar-nav-item">
                 <a href="#" class="nav-link"><i class="flaticon-classmates"></i><span>Students</span></a>
                 <ul class="nav sub-group-menu">
                     <li class="nav-item">
                         <a href="{{route('admin.student.index')}}" class="nav-link"><i class="fas fa-angle-right"></i>All
                             Students</a>
                     </li>
                    
                 </ul>
             </li>
             
             <li class="nav-item sidebar-nav-item">
                 <a href="#" class="nav-link"><i class="flaticon-couple"></i><span>Parents</span></a>
                 <ul class="nav sub-group-menu">
                     <li class="nav-item">
                         <a href="{{route('admin.parent.index')}}" class="nav-link"><i class="fas fa-angle-right"></i>All
                             Parents</a>
                     </li>
                     
                 </ul>
             </li>
         </ul>
     </div>
 </div>