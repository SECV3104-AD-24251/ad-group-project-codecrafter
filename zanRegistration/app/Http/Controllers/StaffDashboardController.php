<?php 
namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Message;
use App\Models\Waitlist;
use Illuminate\Http\Request;
use App\Models\WaitlistRequest;

class StaffDashboardController extends Controller
{

    public function dashboard()
{
    // Retrieve all pending waitlist requests
    $requests = Waitlist::with('student', 'course')->get();

    // Pass the data to the view
    return view('academic.dashboard', compact('requests'));
}

public function updateStatus(Request $request)
{
    // Retrieve the course and update its status
    $courseId = $request->input('course_id');
    $status = $request->input('status');

    $course = Course::find($courseId); // Assuming you have a `Course` model
    $course->status = $status;
    $course->save();

    // Set the flash message
    $message = $status === 'approved' 
        ? 'The course has been successfully approved!' 
        : 'The course has been rejected.';
    session()->flash('notification', $message);

    return redirect()->route('academic.dashboard');
}





}
