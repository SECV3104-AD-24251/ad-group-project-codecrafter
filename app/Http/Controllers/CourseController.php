<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CourseController extends Controller
{
    // Display the course list with optional semester filtering
    public function index(Request $request)
{
    $semester = $request->input('semester');
    $query = Course::query();

    if ($semester) {
        $query->where('semester', $semester);
    }

    $subjects = $query->get();

    return view('student.courseRegistration', compact('subjects')); 
}

    // Optional: A method to handle course processing logic
    public function process($id)
    {
        // Fetch the course based on the ID
        $course = Course::findOrFail($id);

        // Here you can add processing logic for registration
        return redirect()->back()->with('success', "Course {$course->course_name} registered successfully!");
    }

    public function select($id)
{
    $course = Course::find($id);

    if (!$course) {
        return redirect()->route('student.courses')->with('error', 'Course not found');
    }

    // Pass course data to the view
    return view('student.courses.select')->with('course', $course);
}

    // Handle course registration
    public function register(Request $request, $id)
{
    // Validate input
    $request->validate([
        'confirmation' => 'required|accepted', // Ensure the student confirmed the registration
    ]);

    // Check if the course exists
    $course = Course::find($id);
    if (!$course) {
        return redirect()->route('student.courses')->with('error', 'Course not found');
    }

    // Assuming the user is authenticated and is a student
    $student = Auth::user(); // Get the authenticated student

    // Register the student for the course
    $student->courses()->attach($course->id); 

    // Redirect back with success message
    return redirect()->route('student.dashboard')->with('success', 'Course registered successfully!');
}

}
