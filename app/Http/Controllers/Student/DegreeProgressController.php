<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\SectionInfo;
use Illuminate\Http\Request;
use App\Models\Course;
use App\Models\Student;
use Illuminate\Support\Facades\Auth;

class DegreeProgressController extends Controller
{
    // Show Degree Progress Page
    public function showProgress()
    {
        $user = Auth::user(); // Get the authenticated user

        // Fetch all courses matching the user's program and semester
        $allCourses = Course::where('program', $user->program)
            ->where('semester', $user->current_sem)
            ->get();

        // Get registered course IDs from section_info table
        $registeredCourseIds = SectionInfo::where('user_id', $user->id)->pluck('course_id')->toArray();

        // Filter out registered courses
        $remainingCourses = $allCourses->reject(function ($course) use ($registeredCourseIds) {
            return in_array($course->id, $registeredCourseIds);
        });

        // Separate mandatory and elective courses
        $mandatoryCourses = $remainingCourses->where('type', 'mandatory');
        $electiveCourses = $remainingCourses->where('type', 'elective');

        // Fetch suggested electives
        $suggestedElectives = $this->getSuggestedElectives($user);

        return view('student.degree_progress', [
            'mandatoryCourses' => $mandatoryCourses,
            'electiveCourses' => $electiveCourses,
            'totalCourses' => $allCourses->count(),
            'completedCourses' => count($registeredCourseIds),
            'completionRate' => $allCourses->count() > 0 ? (count($registeredCourseIds) / $allCourses->count()) * 100 : 0,
            'registeredCourseIds' => $registeredCourseIds,
            'suggestedElectives' => $suggestedElectives, // Add suggested electives
        ]);
    }

    // Function to get suggested electives
    private function getSuggestedElectives($student)
    {
        // Ensure that you're selecting the `id` column from the `courses` table explicitly
        $completedCourseIds = $student->completedCourses()->pluck('course_id')->toArray();

        return Course::where('type', 'elective')
            ->whereNotIn('id', $completedCourseIds)
            ->get();
    }

}
