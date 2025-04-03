<?php

namespace App\Http\Controllers\Teacher;

use App\Http\Controllers\Controller;
use App\Models\MyParent;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StudentController extends Controller
{
    public function index(Request $request){
        if ($request->ajax()) {
            $data = Student::query()->where('teacher_id',auth('teacher')->id());
            return datatables()->eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                        $loginRoute = route('teacher.login.student',$row->id);
                        $btn = '<a href="'.$loginRoute.'" class="edit btn btn-primary btn-lg" target="_blank">Login</a>';
                        return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('teacher.student.index');
    }

    public function indexParent(Request $request){
        if ($request->ajax()) {
            $data = MyParent::query()->where('teacher_id',auth('teacher')->id());
            return datatables()->eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                        $loginRoute = route('teacher.login.parent',$row->id);
                        $btn = '<a href="'.$loginRoute.'" class="edit btn btn-primary btn-lg" target="_blank">Login</a>';
                        return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('teacher.parent.index');
    }

    public function teacherStudentLogin($id){
        $student = Student::find($id);
        Auth::guard('student')->login($student);
        return redirect()->route('student.dashboard');
    }

    public function teacherParentLogin($id){
        $parent = MyParent::find($id);
        Auth::guard('myparent')->login($parent);
        return redirect()->route('parent.dashboard');
    }
}
