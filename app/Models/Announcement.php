<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Announcement extends Model
{
    protected $guarded = [];

    public function teachers()  {
        return $this->belongsTo(Teacher::class,'teacher_id','id');
    }
}
