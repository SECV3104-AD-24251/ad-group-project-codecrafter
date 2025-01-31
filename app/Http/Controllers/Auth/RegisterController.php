<?php

namespace App\Http\Controllers\Auth;

use App\Models\Course;
use App\Models\Student;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Notifications\CourseRegistrationAlert;

class RegisterController extends Controller{
    public function showRegistrationForm()
    {
        // Show the registration form
        return view('auth.register');
    }

    public function register(Request $request)
{
    // Validate the request data
    $request->validate([
        'name' => 'required|string|max:255', // Validate the name field
        'email' => 'required|email|unique:users,email',
        'password' => 'required|string|min:8|confirmed',
        'role' => 'required|in:student,academic_staff',
    ]);

    // Create the new user in the database
    $user = User::create([
        'name' => $request->name, // Store the name
        'email' => $request->email,
        'password' => bcrypt($request->password), // Hash the password
        'role' => $request->role, // Store the role
    ]);

    // Log the user in
    Auth::login($user);

    // Redirect to the home page or dashboard
    return redirect('/home'); // Or wherever you want to redirect the user
}

public function processRegistration(Request $request, $studentId)
{
    $student = User::findOrFail($studentId);
    $courseId = $request->input('course_id');

    $course = Course::findOrFail($courseId);

    // Check if course matches degree requirements
    if ($course->degree_id !== $student->degree_id) {
        // Send notification to the student
        $student->notify(new CourseRegistrationAlert($course->name));

        return back()->with('error', 'This course is not part of your degree requirements.');
    }

    // Register the student for the course
    $student->registeredSubjects()->attach($courseId);

    return back()->with('success', 'Course registered successfully!');
}

public function checkForConflicts($studentId, $newCourse)
{
    $registeredCourses = Student::find($studentId)->registeredCourses;

    foreach ($registeredCourses as $course) {
        // Time conflict detection
        if (
            $course->day === $newCourse->day &&
            $course->start_time < $newCourse->end_time &&
            $newCourse->start_time < $course->end_time
        ) {
            return [
                'status' => 'conflict',
                'message' => 'Schedule conflict with ' . $course->name,
            ];
        }

        // Credit hour limit detection
        $totalCredits = $registeredCourses->sum('credit_hours') + $newCourse->credit_hours;
        if ($totalCredits > config('registration.max_credit_hours', 18)) {
            return [
                'status' => 'conflict',
                'message' => 'Exceeds credit hour limit.',
            ];
        }
    }

    return ['status' => 'success'];
}

public function checkConflict(Request $request)
    {
        $studentId = Auth::id(); // Assuming the student is logged in
        $newCourse = Course::find($request->course_id);

        if (!$newCourse) {
            return response()->json([
                'status' => 'error',
                'message' => 'Course not found.',
            ]);
        }

        $student = Student::find($studentId);
        $registeredCourses = $student->registeredCourses;

        foreach ($registeredCourses as $course) {
            // Time conflict detection
            if (
                $course->day === $newCourse->day &&
                $course->start_time < $newCourse->end_time &&
                $newCourse->start_time < $course->end_time
            ) {
                return response()->json([
                    'status' => 'conflict',
                    'message' => 'Schedule conflict with ' . $course->subject_name,
                ]);
            }

            // Credit hour limit detection
            $totalCredits = $registeredCourses->sum('credit_hours') + $newCourse->credit_hours;
            if ($totalCredits > config('registration.max_credit_hours', 18)) {
                return response()->json([
                    'status' => 'conflict',
                    'message' => 'Exceeds credit hour limit.',
                ]);
            }
        }

        return response()->json([
            'status' => 'success',
            'message' => 'No conflicts. You can register for this course.',
        ]);
    }

}
