<?php

namespace App\Http\Controllers;

use App\Models\Course;
use Illuminate\Http\Request;
use App\Models\HighPriorityCourse;


class CourseRegistrationController extends Controller
{
    /**
     * Show the list of subjects available for registration with semester filtering.
     *
     * @param Request $request
     */
    public function showSubjectList(Request $request)
    {
        // Fetch unique semesters and programs for dropdowns
        $semesters = Course::select('semester')->distinct()->pluck('semester');
        $programs = Course::select('program')->distinct()->pluck('program');

        // Get filters from the request
        $selectedSemester = $request->query('semester');
        $selectedPrograms = $request->query('programs');

        // Convert selectedPrograms to array
        if ($selectedPrograms) {
            $selectedPrograms = explode(',', $selectedPrograms);
        } else {
            $selectedPrograms = ['ALL'];
        }

        // Build query with filters
        $query = Course::query();

        if ($selectedSemester) {
            $query->where('semester', $selectedSemester);
        }

        if (!in_array('ALL', $selectedPrograms)) {
            $query->whereIn('program', $selectedPrograms);
        }

        $subjects = $query->get();

        // Pass data to the view
        return view('student.courseRegistration', compact('subjects', 'semesters', 'programs', 'selectedSemester', 'selectedPrograms'));
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
        return redirect()->route('processRegistration.show')
            ->with('success', "Successfully registered for {$subject->name}.");
    }

    /**
     * Fetch Courses by Semester (API endpoint).
     *
     * @param string $semester
     */
    public function getCoursesBySemester($semester)
    {
        $courses = Course::where('semester', $semester)->get();
        return response()->json($courses);
    }

    public function markAsHighPriority(Request $request)
    {
        $student = auth()->user(); // Assuming authentication is used
        $courseId = $request->input('course_id');

        // Check if the course exists
        $course = Course::findOrFail($courseId);

        // Check if the course matches the student's program and next semester
        if ($course->program == $student->program && $course->semester == ($student->current_semester + 1)) {
            // Store the high-priority course
            HighPriorityCourse::updateOrCreate([
                'student_id' => $student->id,
                'course_id' => $courseId,
            ]);

            return response()->json(['success' => 'Course marked as high priority.']);
        }

        return response()->json(['error' => 'This course does not meet the priority criteria.'], 400);
    }

    public function getHighPriorityCourses()
    {
        $student = auth()->user();

        $highPriorityCourses = HighPriorityCourse::where('student_id', $student->id)
            ->with('course')
            ->get();

        return view('student.highPriorityCourses', compact('highPriorityCourses'));
    }


}
