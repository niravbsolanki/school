<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AnnouncementRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title'=>'required',
            'description' => 'required'
        ];
    }

    public function persist(){

        $typeGet = $this->type ?? ['TEACHER'];
        $type = (isset($typeGet) && count($typeGet) >= 2) ? 'BOTH' : $typeGet[0];
        return [
            'title' => $this->title,
            'content' => $this->description,
            'teacher_id' => ($type != "ADMIN") ? auth('teacher')->id() : null,
            'admin_id'=>  ($type == "ADMIN") ? auth('admin')->id() : null,
            'type'=> $type
        ];

    }
}
