<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class StudentDashboardController extends Controller
{
    
    public function dashboard()
   {
      
      $user = Auth::user();

      $currentCredits = DB::table('section_info')
          ->where('user_id', $user->id)
          ->sum('credits');

      return view('student.dashboard', [
         'currentCredits' => $currentCredits,
         'totalCredits' => $currentCredits 
      ]);
      
    }

}
