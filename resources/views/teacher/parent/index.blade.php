@extends('teacher.layouts.app')
@section('title','Parent List')
@section('page_title','Parent List')
@section('content')
    <div class="row">
        <div class="col-12">
            
            <div class="card height-auto">
                <div class="card-body">
                    <div class="heading-layout1 p-2">
                        <div class="item-title">
                            <h3>Parent List</h3>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">

                            <table class="table table-sm data-table text-nowrap dataTable no-footer w-100" id="parentDatatable" data-url="{{ route('teacher.parent.index') }}">

                                <tr>
                                    <thead class="gray-light">
                                        <th width="15">ID</th>
                                        <th>FullName</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Phone No</th>
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
<script src="{{ asset('asset/admin/js/datatable/teacher/parent-datatable.js') }}" type="text/javascript"></script>
@endpush