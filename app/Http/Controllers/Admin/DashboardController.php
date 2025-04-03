<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MyParent;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index() {
        $data['totalTeachers'] = Teacher::count();
        $data['totalStudent'] = Student::count();
        $data['totalParent'] = MyParent::count();
        return view('admin.dashboard',$data);
    }
}
