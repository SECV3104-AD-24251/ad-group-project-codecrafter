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

    // Fetch credits from users table instead of section_info
    $currentCredits = DB::table('users')
        ->where('id', $user->id)
        ->value('credits');

    $courses = Course::all();

    // Retrieve the waitlist for the logged-in student
    $waitlists = Waitlist::with('courseSection.course')
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

       // Retrieve the waitlist for the logged-in student
       $waitlists = Waitlist::with('courseSection.course')
           ->where('student_id', Auth::id())
           ->get();

       // Generate notifications
       $notifications = $this->generateNotifications($waitlists);

       // Pass data to the view
       return view('student.waitlist', compact('courses', 'waitlists', 'notifications'));
   }

   private function generateNotifications($waitlists, $currentCredits = null)
    {
        $notifications = [];

        // Add notifications for waitlisted courses
        foreach ($waitlists as $waitlist) {
            if ($waitlist->courseSection && $waitlist->courseSection->course) {
                $notifications[] = "You are waitlisted for {$waitlist->courseSection->course->course_name} - Section {$waitlist->course->section}.";
            } else {
                $notifications[] = "You are waitlisted for a course, but details are unavailable.";
            }
        }


        // Add a notification if currentCredits is provided and exceeds the limit
        if ($currentCredits !== null && $currentCredits > 18) {
            $notifications[] = "You are exceeding the recommended credit limit of 18.";
        }

        return $notifications;
    }


}


