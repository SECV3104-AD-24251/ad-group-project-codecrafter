<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class CourseController extends Controller
{
    // Show the course registration form
    public function showRegistrationForm()
    {
        return Inertia::render('Course/Registration');
    }

    // Handle course registration
    public function registerCourse(Request $request)
    {
        // Logic for registering courses (e.g., saving to the database)
        $request->validate([
            'course_id' => 'required|exists:courses,id', // Example validation
        ]);

        // Save registration (example logic)
        // Auth::user()->courses()->attach($request->course_id);

        return redirect()->route('course.registered')->with('success', 'Course registered successfully!');
    }

    // Show the list of registered courses
    public function showRegisteredCourses()
    {
        // Fetch registered courses for the logged-in user (example)
        // $courses = Auth::user()->courses;

        return Inertia::render('Course/RegisteredCourses', [
            // 'courses' => $courses,
        ]);
    }
}
