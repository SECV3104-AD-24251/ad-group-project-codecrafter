<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;
use App\Models\Student;
use Illuminate\Support\Facades\Auth;

class DegreeProgressController extends Controller
{
    // Show Degree Progress Page
    public function showProgress()
    {
        $student = Auth::user();
        if (!$student) {
            dd('User not authenticated!');
        }

        $completedCourses = $student->completedCourses()->get();
        $degreePlan = $student->degreePlan;
        if (!$degreePlan) {
            dd('Degree Plan not found!');
        }

        $totalCourses = $degreePlan->totalCourses();
        $completedCount = $completedCourses->count();

        // Calculate percentage completion
        $completionRate = ($totalCourses > 0) ? ($completedCount / $totalCourses) * 100 : 0;

        // Fetch suggestions for electives
        $suggestedElectives = $this->getSuggestedElectives($student);

        // Return the degree progress view
        return view('student.degree_progress', compact(
            'completedCourses',
            'totalCourses',
            'completionRate',
            'suggestedElectives',
            'degreePlan'
        ));
    }

