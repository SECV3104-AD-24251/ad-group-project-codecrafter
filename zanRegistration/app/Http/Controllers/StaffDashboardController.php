<?php 
namespace App\Http\Controllers;

use App\Models\Student; // Ensure this is the correct model for students
use Illuminate\Http\Request;

class StaffDashboardController extends Controller
{

    public function dashboard()
    {
        // Fetch all students or filter by criteria
        $students = Student::all();

        // Return the dashboard view and pass the students
        return view('academic.dashboard', compact('students'));
    }

}
