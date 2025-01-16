<?php
namespace App\Http\Controllers;
use App\Models\Course;
use App\Models\Waitlist;
use App\Models\SectionInfo;
use Illuminate\Http\Request;
use App\Models\WaitlistRequest;
use Illuminate\Support\Facades\Auth;

class WaitlistController extends Controller
{
    // Display the waitlist page
    public function index()
    {
        $studentId = Auth::id();
        // Fetch the student's waitlist data
        $waitlists = Waitlist::with('courseSection.course')
            ->where('student_id', $studentId)
            ->orderBy('position', 'asc')
            ->get();
        // Fetch available course sections
        $availableSections = SectionInfo::with('course')->get();
        return view('student.waitlist', compact('waitlists', 'availableSections'));
    }
    // Join a waitlist for a course section
    public function join(Request $request)
    {
        $studentId = Auth::id();
        $courseSectionId = $request->input('course_section_id');
        // Check if already on the waitlist
        if (Waitlist::where('student_id', $studentId)->where('course_section_id', $courseSectionId)->exists()) {
            return redirect()->back()->with('error', 'You are already on the waitlist for this section.');
        }
        // Determine the next position
        $position = Waitlist::where('course_section_id', $courseSectionId)->count() + 1;
        // Add the student to the waitlist
        Waitlist::create([
            'student_id' => $studentId,
            'course_section_id' => $courseSectionId,
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
        $request->validate([
            'course_id' => 'required|exists:courses,id',
        ]);

        WaitlistRequest::create([
            'student_id' => Auth::id(),
            'course_id' => $request->course_id,
            'status' => 'pending',
        ]);

        return back()->with('success', 'Waitlist request submitted successfully.');
    }

    public function viewRequests()
    {
    // Fetch all pending waitlist requests with related student and course data
    $requests = WaitlistRequest::where('status', 'pending')
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

        $waitlist = WaitlistRequest::find($request->request_id);
        $waitlist->update(['status' => $request->status]);

        return back()->with('success', 'Waitlist request updated successfully.');
    }

    public function showWaitlistForm()
    {
    // Fetch all courses (you can filter based on specific criteria if needed)
    $courses = Course::all();

    return view('student.waitlist_form', compact('courses'));
    }


}