<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\SectionInfo;
use App\Models\Course;

class ProcessRegistrationController extends Controller
{
    public function showSections($course_id)
    {
        // Fetch sections for the selected course
        $sections = SectionInfo::where('course_id', $course_id)->get();
        $userEnrolledSection = SectionInfo::where('course_id', $course_id)
            ->where('user_id', Auth::id())
            ->first();

        return view('student.processRegistration', compact('sections', 'course_id', 'userEnrolledSection'));
    }

    /**
     * Enroll or Unenroll user into/from a section.
     */
    public function enroll(Request $request)
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

        //  Handle Unenrollment
        if ($section->user_id === $user->id) {
            $section->user_id = null;
            $section->capacity += 1; // Restore capacity
            $section->save();

            $user->credits -= $creditHours;
            $user->save();

            return response()->json([
                'status' => 'success',
                'message' => 'You have successfully unenrolled from the section.'
            ], 200);
        }

        //  Prevent duplicate enrollment in the same course
        $alreadyEnrolled = SectionInfo::where('course_id', $validated['course_id'])
            ->where('user_id', $user->id)
            ->exists();

        if ($alreadyEnrolled) {
            return response()->json([
                'status' => 'error',
                'message' => 'You are already enrolled in a section for this course.'
            ], 400);
        }

        //  Enforce 18-credit limit
        if (($user->credits + $creditHours) > 18) {
            return response()->json([
                'status' => 'error',
                'message' => 'You cannot enroll in this course as it exceeds the 18-credit limit per semester.'
            ], 400);
        }

        //  Ensure seats are available
        if ($section->capacity <= 0) {
            return response()->json([
                'status' => 'error',
                'message' => 'This section is already full.'
            ], 400);
        }

        //  Enroll the user
        $section->user_id = $user->id;
        $section->capacity -= 1;
        $section->save();

        //  Update user's credit hours
        $user->credits += $creditHours;
        $user->save();

        return response()->json([
            'status' => 'success',
            'message' => 'You have successfully enrolled in the section.'
        ], 200);
    }
}
