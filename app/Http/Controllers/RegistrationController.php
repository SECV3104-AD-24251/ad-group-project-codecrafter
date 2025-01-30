<?php 
use App\Models\Course;
use App\Models\Student;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Notifications\CourseRegistrationAlert;

class RegistrationController extends Controller{
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