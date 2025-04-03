<?php

namespace App\Http\Controllers\Teacher;

use App\Http\Controllers\Controller;
use App\Models\Announcement;
use App\Models\MyParent;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index() {
        $data['totalStudent'] = Student::where('teacher_id',auth('teacher')->id())->count();
        $data['totalParent'] = MyParent::where('teacher_id',auth('teacher')->id())->count();
        return view('teacher.dashboard',$data);
    }
    
    public function indexTeancherAnnouncement(Request $request){
        if ($request->ajax()) {
            $data = Announcement::query()->whereNotNull('admin_id');
            return datatables()->eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                        return '-';
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('teacher.dashboard');
    }
}
