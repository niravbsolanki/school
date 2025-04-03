@extends('admin.layouts.app')
@section('title','Dashboard')
@section('page_title','Dashboard') 
@section('content')
     <!-- Dashboard summery Start Here -->
                <div class="row gutters-20">
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <div class="item-icon bg-light-blue">
                                        <i class="flaticon-multiple-users-silhouette text-blue"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="item-content">
                                        <div class="item-title">Teachers</div>
                                        <div class="item-number"><span class="counter" data-num="{{$totalTeachers ?? 0}}">{{$totalTeachers ?? 0}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <div class="item-icon bg-light-green ">
                                        <i class="flaticon-classmates text-green"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="item-content">
                                        <div class="item-title">Students</div>
                                        <div class="item-number"><span class="counter" data-num="{{$totalStudent ?? 0}}">{{$totalStudent ?? 0}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <div class="item-icon bg-light-yellow">
                                        <i class="flaticon-couple text-orange"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="item-content">
                                        <div class="item-title">Parents</div>
                                        <div class="item-number"><span class="counter" data-num="{{$totalParent ?? 0}}">{{$totalParent ?? 0}}</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
     <!-- Dashboard summery End Here -->
     <div class="row">
        <div class="col-12">
            
            <div class="card height-auto">
                <div class="card-body">
                    <div class="heading-layout1 p-2">
                        <div class="item-title">
                            <h3>Teachers Announcement</h3>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">

                            <table class="table table-sm data-table text-nowrap dataTable no-footer w-100" id="teacherAnnounceDatatable" data-url="{{ route('admin.teancher-announce.index') }}">

                                <tr>
                                    <thead class="gray-light">
                                        <th width="15">ID</th>
                                        <th>Teacher Name</th>
                                        <th>Title</th>
                                        <th>Content</th>
                                        <th data-orderable="false" class="text-center">Action</th>
                                    </thead>
                                </tr>

                                <tbody>
                                </tbody>

                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>            
@endsection

@push('js')

<script src="{{ asset('asset/admin/js/datatable/teacher-announce-datatable.js') }}" type="text/javascript"></script>


@endpush



@push('css')
    
@endpush