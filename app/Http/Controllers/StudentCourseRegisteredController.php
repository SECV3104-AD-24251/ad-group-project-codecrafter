<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\SectionInfo;
use App\Models\Course;

class StudentCourseRegisteredController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        // Get all sections the user is enrolled in
        $registeredSections = SectionInfo::where('user_id', $user->id)->get();

        return view('student.studentCourseRegistered', compact('registeredSections'));

    }

    public function unenroll(Request $request)
{
    // Validate the incoming request
    $validated = $request->validate([
        'section_id' => 'required|exists:section_info,id',
        'course_id' => 'required|exists:courses,id',
    ]);

    $user = Auth::user();
    $section = SectionInfo::findOrFail($validated['section_id']);
    $course = Course::findOrFail($validated['course_id']);
    $creditHours = $course->credit_hours;

    if (!$section) {
        return redirect()->back()->with('error', 'You are not enrolled in this section.');
    }

    // Unenroll the student (remove user_id)
    if ($section->user_id === $user->id) {
        $section->user_id = null;
        $section->capacity += 1; // Restore capacity
        $section->save();

        $user->credits -= $creditHours;
        $user->save();

        return redirect()->back()->with('success', 'You have successfully unenrolled from the section.');
    }

    return redirect()->back()->with('error', 'Something went wrong.');
}
}
