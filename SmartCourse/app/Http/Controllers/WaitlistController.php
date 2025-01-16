<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Waitlist;
use App\Models\SectionInfo;
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
}
