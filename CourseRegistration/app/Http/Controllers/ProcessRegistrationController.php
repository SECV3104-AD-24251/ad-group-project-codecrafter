<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\SectionInfo;

class ProcessRegistrationController extends Controller
{
    /**
     * Show available sections for the course.
     */
    public function showSections($course_id)
    {
        // Fetch sections for the selected course
        $sections = SectionInfo::where('course_id', $course_id)->get();

        return view('student.processRegistration', compact('sections', 'course_id'));
    }

    /**
     * Enroll user into a section.
     */
    public function enroll(Request $request)
    {
        $user = Auth::user();

        // Validate the request
        $request->validate([
            'section_id' => 'required|exists:section_info,id',
            'course_id' => 'required|exists:courses,id',
        ]);

        $section = SectionInfo::findOrFail($request->section_id);

        // Ensure user is not already enrolled in a section for this course
        $alreadyEnrolled = SectionInfo::where('course_id', $request->course_id)
            ->where('user_id', $user->id)
            ->exists();

        if ($alreadyEnrolled) {
            return redirect()->back()->with('error', 'You have already enrolled in a section for this course.');
        }

        // Update section to assign the user
        $section->user_id = $user->id;
        $section->save();

        return redirect()->route('student.courses.registered')
            ->with('success', 'You have successfully enrolled in the section.');
    }
}
