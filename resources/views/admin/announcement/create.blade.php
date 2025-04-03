@extends('admin.layouts.app')
@section('title','Create Announcement')
@section('page_title','Create Announcement')
@section('content')

<div class="row">
    <div class="col-12">
        <form action="{{ route('admin.announce.store')}}" method="post" id="announceForm" name="announceForm" class="new-added-form" enctype="multipart/form-data">
            @csrf
            <div class="card height-auto">
                <div class="card-body">
                    
                    <div class="row">
                        <div class="col-lg-12 form-group">
                            <label>Title <span class="text-danger">*</span></label>
                            <input type="text" name="title" id="title" placeholder="Title" value="{{$teacher->title ?? ''}}" class="form-control">
                            <div class="text text-danger">{{$errors->first('title')}}</div>
                        </div>
                        <div class="col-lg-12 form-group">
                            <label>Description <span class="text-danger">*</span></label>
                            <textarea  class="form-control" name="description" cols="50" rows="10" style="height: 100px"></textarea>
                            <div class="text text-danger">{{$errors->first('description')}}</div>
                        </div>
                        <input type="hidden" name="type[]" value="ADMIN">
                      
                    </div>
                    <div class="row">
                        <div class="col-12 form-group mg-t-8 text-right">
                            <button type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Save</button>
                        </div>
                    </div>
                  
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
