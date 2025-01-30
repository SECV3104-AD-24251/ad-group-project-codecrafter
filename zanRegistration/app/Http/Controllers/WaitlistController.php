<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Waitlist;
use App\Models\SectionInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Notifications\WaitlistStatusNotification;

class WaitlistController extends Controller
{
    // Display the waitlist page
    public function index()
    {
        $studentId = Auth::id();
        // Fetch the student's waitlist data
        $waitlists = Waitlist::with('course') // Adjusted relationship to course
            ->where('student_id', $studentId)
            ->orderBy('position', 'asc')
            ->get();
        // Fetch available courses
        $availableSections = SectionInfo::with('course')->get(); // Adjusted based on your logic
        return view('student.waitlist', compact('waitlists', 'availableSections'));
    }

    // Join a waitlist for a course
    public function join(Request $request)
    {
        $studentId = Auth::id();
        $courseId = $request->input('course_id');

        // Check if already on the waitlist
        if (Waitlist::where('student_id', $studentId)->where('course_id', $courseId)->exists()) {
            return redirect()->back()->with('error', 'You are already on the waitlist for this course.');
        }

        // Determine the next position
        $position = Waitlist::where('course_id', $courseId)->count() + 1;

        // Add the student to the waitlist
        Waitlist::create([
            'student_id' => $studentId,
            'course_id' => $courseId,
            'position' => $position,
            'status' => 'active',
        ]);

        return redirect()->back()->with('success', 'You have joined the waitlist.');
    }

    // Leave the waitlist
    public function leave($id)
    {
        $waitlist = Waitlist::findOrFail($id);

        // Ensure the student is authorized
        if ($waitlist->student_id !== Auth::id()) {
            return redirect()->back()->with('error', 'Unauthorized action.');
        }

        $waitlist->delete();

        return redirect()->back()->with('success', 'You have left the waitlist.');
    }

    public function submit(Request $request)
    {
        // Validate input
        $request->validate([
            'course_id' => 'required|exists:courses,id', // Validation updated
        ]);

        // Check if already on the waitlist for the course
        $existingWaitlist = Waitlist::where('student_id', Auth::id())
            ->where('course_id', $request->course_id)
            ->first();

        if ($existingWaitlist) {
            return redirect()->back()->with('error', 'You are already on the waitlist for this course.');
        }

        // Create waitlist entry
        Waitlist::create([
            'student_id' => Auth::id(),
            'course_id' => $request->course_id,
            'position' => Waitlist::where('course_id', $request->course_id)->count() + 1,
            'status' => 'active',
        ]);

        return redirect()->back()->with('success', 'Waitlist request submitted successfully.');
    }

    public function viewRequests()
    {
        // Fetch all pending waitlist requests with related student and course data
        $requests = Waitlist::where('status', 'pending')
            ->with('student', 'course')
            ->get();

        return view('academic.waitlist', compact('requests'));
    }

    // Academic staff approves or rejects a request
    public function updateRequest(Request $request)
    {
        $request->validate([
            'request_id' => 'required|exists:waitlist_requests,id',
            'status' => 'required|in:approved,rejected',
        ]);

        $waitlist = Waitlist::find($request->request_id);
        $waitlist->update(['status' => $request->status]);

        return back()->with('success', 'Waitlist request updated successfully.');
    }

    public function showWaitlistForm()
    {
        // Fetch all courses
        $courses = Course::all();

        return view('student.waitlist_form', compact('courses'));
    }

    public function handleWaitlistAction(Request $request)
{
    $validated = $request->validate([
        'request_id' => 'required|exists:waitlists,id',
        'status' => 'required|in:approved,rejected',
    ]);

    // Find the waitlist request
    $waitlist = Waitlist::find($validated['request_id']);
    $waitlist->status = $validated['status'];
    $waitlist->save();

    // Notify the student
    $student = $waitlist->student; // Assuming the waitlist is related to the student
    $notificationData = [
        'course_name' => $waitlist->course->name,
        'status' => $validated['status'],
    ];

    // Send notification and/or email
    $student->notify(new WaitlistStatusNotification($notificationData));

    return redirect()->back()->with('success', 'Waitlist status updated and student notified.');
}

}
