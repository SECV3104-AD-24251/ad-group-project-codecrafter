<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class StudentController extends Controller
{
   
    public function showCreditHours()
    {
        $user = Auth::user();

        $maxCreditsPerSemester = 18;
        $currentCredits = DB::table('section_info')
            ->where('user_id', $user->id)
            ->sum('credits');

        return view('student.credit-hours', compact('maxCreditsPerSemester', 'currentCredits'));
    }

    public function profile()
    {
        $user = Auth::user();
        return view('student.profile', compact('user'));
    }
}
