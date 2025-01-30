<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\UserProgress;
use App\Models\Course;

class ProgressController extends Controller
{
    public function getProgress()
    {
        // Fetch the authenticated user ID
        $userId = Auth::id();

        // Fetch the number of completed courses for the user
        $completedCourses = UserProgress::where('user_id', $userId)->count();

        // Fetch the total number of mandatory courses
        $totalCourses = Course::where('type', 'mandatory')->count();

        // Fetch remaining mandatory courses for the user
        $mandatoryCourses = Course::where('type', 'mandatory')
            ->whereNotIn('id', function ($query) use ($userId) {
                $query->select('course_id')
                      ->from('user_progress')
                      ->where('user_id', $userId);
            })
            ->get(['code', 'name']);

        // Fetch recommended elective courses that the user hasn't completed yet
        $recommendedElectives = Course::where('type', 'elective')
            ->whereNotIn('id', function ($query) use ($userId) {
                $query->select('course_id')
                      ->from('user_progress')
                      ->where('user_id', $userId);
            })
            ->limit(5)
            ->get(['code', 'name']);

        // Return the data as JSON for frontend consumption
        return response()->json([
            'completedCourses' => $completedCourses,
            'totalCourses' => $totalCourses,
            'mandatoryCourses' => $mandatoryCourses,
            'recommendedElectives' => $recommendedElectives,
        ]);
    }
}
