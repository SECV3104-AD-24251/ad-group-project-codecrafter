<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Course;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Notifications\InsufficientCreditHoursNotification;

class CourseRegistrationController extends Controller
{
    /**
     * Show the list of subjects available for registration with semester filtering.
     *
     * @param Request $request
     */
    public function showSubjectList(Request $request)
    {
        $user = Auth::user();  // Get the currently authenticated user

        // Fetch the current credits the user has (ensure this table and column exist)
       $currentCredits = DB::table('section_info')
       ->where('user_id', $user->id)
       ->sum('credits');  // Sum the credits for the current user

        // Fetch unique semesters for the dropdown
        $semesters = Course::select('semester')->distinct()->pluck('semester');

        // Filter subjects based on selected semester (if any)
        $selectedSemester = $request->query('semester');

        if ($selectedSemester) {
            $subjects = Course::when($selectedSemester, function ($query, $semester) {
                return $query->where('semester', $semester);
            })->get();
        } else {
            $subjects = Course::all();
        }

        // Pass data to the view
       // Pass current credits and other data to the view
    return view('student.courseRegistration', [
        'currentCredits' => $currentCredits,
        'semesters' => $semesters,
        'subjects' => $subjects,
        'selectedSemester' => $selectedSemester,
    ]);
    }
    
}