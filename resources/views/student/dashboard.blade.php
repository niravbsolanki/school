@extends('student.layouts.app')
@section('title','Student Dashboard')
@section('page_title','Student Dashboard') 
@section('content')
                <div class="row gutters-20">
                   
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
           
@endsection
