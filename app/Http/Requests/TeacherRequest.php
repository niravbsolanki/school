<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Hash;

class TeacherRequest extends FormRequest
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
        $rules =  [
            'full_name' => 'required',
            'username' => 'required',
            'password' => 'required|min:6',
            'phone' => 'nullable|digits:10',
        ];

        if($this->method() == "PUT"){
            $rules['password'] = 'nullable|min:6';
        }

        return $rules;
    }

    public function persist(){
        $persist = [
            'full_name' => $this->full_name,
            'username' => $this->username,
            'password' => Hash::make($this->password),
            'show_pwd' => $this->password,
            'phone' => $this->phone,
        ];

        if($this->password == NULL || $this->password == ""){
            unset($persist['password']);
            unset($persist['show_pwd']);
        }
        return $persist;
    }
}
