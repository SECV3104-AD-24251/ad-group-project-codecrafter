<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Waitlist;
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

          $courses = Course::all();
      return view('student.dashboard', [
         'currentCredits' => $currentCredits,
         'totalCredits' => $currentCredits 
      ]);

    }

    public function waitlist()
{
    // Retrieve all courses
    $courses = Course::all();

    // Retrieve the waitlist for the logged-in student
    $waitlists = Waitlist::with('courseSection.course') // Ensure relationships are loaded
        ->where('student_id', Auth::id()) // Replace with the appropriate column for student ID
        ->get();

    // Pass data to the view
    return view('student.waitlist', compact('courses', 'waitlists'));
}


}
