@extends('parent.layouts.app')
@section('title','Parent Dashboard')
@section('page_title','Parent Dashboard') 
@section('content')
                <div class="row gutters-20">
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
                 
                </div>
        
@endsection
