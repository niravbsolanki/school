<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MyParent;
use App\Models\Student;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    public function index(Request $request){
        if ($request->ajax()) {
            $data = Student::query();
            return datatables()->eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                       
                        $btn = '-';
                        return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('admin.student.index');
    }

    public function indexParent(Request $request){
        if ($request->ajax()) {
            $data = MyParent::query();
            return datatables()->eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                            $btn = '-';
                            return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('admin.parent.index');
    }
}
