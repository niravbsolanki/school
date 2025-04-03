@extends('teacher.layouts.app')
@section('title','Student List')
@section('page_title','Student List')
@section('content')
    <div class="row">
        <div class="col-12">
            
            <div class="card height-auto">
                <div class="card-body">
                    <div class="heading-layout1 p-2">
                        <div class="item-title">
                            <h3>Student List</h3>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">

                            <table class="table table-sm data-table text-nowrap dataTable no-footer w-100" id="studentDatatable" data-url="{{ route('teacher.student.index') }}">

                                <tr>
                                    <thead class="gray-light">
                                        <th width="15">ID</th>
                                        <th>FullName</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>ENROLL. NO</th>
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
<script src="{{ asset('asset/admin/js/datatable/teacher/student-datatable.js') }}" type="text/javascript"></script>
@endpush