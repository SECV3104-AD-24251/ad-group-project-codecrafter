<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Subject;
use Illuminate\Http\Request;

class CourseRegistrationController extends Controller
{
    /**
     * Show the list of subjects available for registration.
     */
    public function showSubjectList()
    {
        // Fetch subjects from the database
        $subjects = Course::all();

        // Pass subjects to the view
        return view('student.courseRegistration', compact('subjects'));
    }

    /**
     * Process the subject registration.
     *
     * @param Request $request
     * @param int $subject_id
     */
    public function processRegistration($subject_id)
    {
        // Fetch the subject
        $subject = Course::findOrFail($subject_id);

        // Implement logic to register the subject (placeholder example)
        // Example: Save subject to the user's registered courses
        $user = auth()->user();
        $user->registeredSubjects()->attach($subject_id);

        // Redirect to the registered courses page
        return redirect()->route('student.courses.registered')
            ->with('success', "Successfully registered for {$subject->name}.");
    }
}
