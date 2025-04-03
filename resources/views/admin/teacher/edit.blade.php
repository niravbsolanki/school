@extends('admin.layouts.app')
@section('title','Edit Teacher')
@section('page_title','Edit Teacher')
@section('content')
<div class="breadcrumbs-area pb-4">
    
	<div class="form-group mg-t-8">
        <a href="{{ route('teacher.index')}}" class="btn-fill-lg bg-blue-dark btn-hover-yellow float-right" style="color: #fff"><i class="fa fa-arrow-left"></i>Back</a> 
	</div>
</div>
<div class="row">
    <div class="col-12">
        <form action="{{ route('teacher.update',$teacher->id)}}" method="post" id="teacherForm" name="teacherForm" class="new-added-form" enctype="multipart/form-data">
         @method('PUT')  
         @csrf
          @include('admin.teacher.form')
        </form>
    </div>
</div>
@endsection
