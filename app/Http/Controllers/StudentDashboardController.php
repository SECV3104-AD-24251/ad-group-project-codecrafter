<?php

namespace App\Http\Controllers;

use App\Models\User;
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

         
      // Retrieve the waitlist for the logged-in student
      $waitlists = Waitlist::with('courseSection.course', 'course')
      ->where('student_id', $user->id)
      ->get();

  // Generate notifications
  $notifications = $this->generateNotifications($waitlists, $currentCredits);

  // Pass data to the view
  return view('student.dashboard', [
      'currentCredits' => $currentCredits,
      'totalCredits' => $currentCredits,
      'courses' => $courses,
      'waitlists' => $waitlists,
      'notifications' => $notifications,
  ]);

      

   }

   public function waitlist()
{
    // Retrieve all courses
    $courses = Course::all();

    // Retrieve the waitlist and load the course directly
    $waitlists = Waitlist::with('courseSection.course', 'course')
        ->where('student_id', Auth::id())
        ->get();

    // Generate notifications
    $notifications = $this->generateNotifications($waitlists);

    return view('student.waitlist', compact('courses', 'waitlists', 'notifications'));
}


   private function generateNotifications($waitlists, $currentCredits = null)
    {
        $notifications = [];

        // Add notifications for waitlisted courses
        foreach ($waitlists as $waitlist) {
            // Check if courseSection and course exist
            if ($waitlist->courseSection && $waitlist->courseSection->course) {
                $notifications[] = "You are waitlisted for {$waitlist->courseSection->course->course_name} - Section {$waitlist->courseSection->section}.";
            } else {
                $notifications[] = "You are waitlisted, but course information is missing.";
            }
        }

        // Add a notification if currentCredits is provided and exceeds the limit
        if ($currentCredits !== null && $currentCredits > 18) {
            $notifications[] = "You are exceeding the recommended credit limit of 18.";
        }

        return $notifications;
    }

    
}



