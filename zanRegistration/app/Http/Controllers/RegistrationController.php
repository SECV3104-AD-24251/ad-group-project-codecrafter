<?php 
use App\Models\Course;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
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
}