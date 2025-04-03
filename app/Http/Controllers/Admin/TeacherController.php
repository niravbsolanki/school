<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\TeacherRequest;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Datatables;

class TeacherController extends Controller
{
    public function index(Request $request){
        if ($request->ajax()) {
            $data = Teacher::query();
            return datatables()->eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                        return view('components.action-buttons', [
                            'edit' => route('teacher.edit', $row->id),
                            'delete' => route('teacher.destroy', $row->id),
                            'id' => $row->id
                        ])->render();
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('admin.teacher.index');
    }

    public function create(){
        return view('admin.teacher.create');
    }

    public function store(TeacherRequest $request){
       Teacher::create($request->persist());
       return redirect()->route('teacher.index')->with('success','Teacher Added Successfully.');
    }

    public function edit($id){
        $data['teacher'] = Teacher::find($id);
        return view('admin.teacher.edit',$data);
    }

    public function update(TeacherRequest $request,$id){
        $teacher = Teacher::find($id);
        $teacher->fill($request->persist())->save();
        return redirect()->route('teacher.index')->with('success','Teacher Updated Successfully.');
    }

    public function destroy($id){
        $teacher = Teacher::find($id);
        $teacher->delete();
        return response()->json(['status' => true,'message' => 'Teacher Deleted Successfully.']);
    }
}
