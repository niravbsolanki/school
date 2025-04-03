<?php

namespace App\Http\Controllers\Teacher;

use App\Http\Controllers\Controller;
use App\Http\Requests\AnnouncementRequest;
use App\Jobs\SendMailJob;
use App\Models\Announcement;
use App\Models\MyParent;
use App\Models\Student;
use Illuminate\Http\Request;

class AnnouncementController extends Controller
{
    public function index() {
        
        return view('teacher.announcement.create');
    }

    public function store(AnnouncementRequest $request){
        $type = $request->persist()['type'];
        $announcement = Announcement::create($request->persist());
        $teacherId = auth('teacher')->id();

        if(in_array($type,['STUDENT','PARENT','BOTH'])){
            $recipients = match ($type) {
                "STUDENT" => Student::where('teacher_id', $teacherId)->get(),
                "PARENT" => MyParent::where('teacher_id', $teacherId)->get(),
                "BOTH" => Student::where('teacher_id', $teacherId)->get()
                            ->concat(MyParent::where('teacher_id', $teacherId)->get()),
            };
            //SEND MAIL
            foreach ($recipients as $recipient) {
                SendMailJob::dispatch($recipient,$announcement);
            }
        }
        

        return back()->with('success','Announcement Created Successfully.');
    }

}
