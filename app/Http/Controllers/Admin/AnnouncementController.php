<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AnnouncementRequest;
use App\Models\Announcement;
use Illuminate\Http\Request;

class AnnouncementController extends Controller
{
    public function index() {
        
        return view('admin.announcement.create');
    }

    public function store(AnnouncementRequest $request){
        Announcement::create($request->persist());
        return back()->with('success','Announcement Created Successfully.');
    }

    public function indexTeacherAnnouncement(Request $request){
        if ($request->ajax()) {
            $data = Announcement::query()->with(['teachers'])->whereNotNull('teacher_id');
            return datatables()->eloquent($data)
                    ->addIndexColumn()
                    ->editColumn('teachers.full_name',function($row){
                        return $row->teachers->full_name ?? '-';
                    })
                    ->addColumn('action', function($row){
                        $btn = '-';
                        return $btn;
                    })
                    ->rawColumns(['teachers.full_name','action'])
                    ->make(true);
        }
        return view('admin.dashboard');
    }
}
