@extends('admin.layouts.app')
@section('title','Teacher List')
@section('page_title','Teacher List')
@section('content')
<div class="breadcrumbs-area pb-4">
	<div class="form-group mg-t-8">
		<a href="{{route('teacher.create')}}" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark float-right w-10" style="color: #fff"><i class="fa fa-plus"></i> Add Teacher</a>
	</div>
</div>
    <div class="row">
        <div class="col-12">
            
            <div class="card height-auto">
                <div class="card-body">
                    <div class="heading-layout1 p-2">
                        <div class="item-title">
                            <h3>Teacher List</h3>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">

                            <table class="table table-sm data-table text-nowrap dataTable no-footer w-100" id="teacherDatatable" data-url="{{ route('teacher.index') }}">

                                <tr>
                                    <thead class="gray-light">
                                        <th width="15">ID</th>
                                        <th>Name</th>
                                        <th>Username</th>
                                        <th>Password</th>
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
<script src="{{ asset('asset/admin/js/datatable/teacher-datatable.js') }}" type="text/javascript"></script>
@endpush