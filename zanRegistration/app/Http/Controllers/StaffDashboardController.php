<?php 
namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;
use App\Models\WaitlistRequest;

class StaffDashboardController extends Controller
{

    public function academicDashboard()
{
    // Retrieve all pending waitlist requests
    $requests = WaitlistRequest::with('student', 'course')->get();

    // Pass the data to the view
    return view('academic.dashboard', compact('requests'));
}




}
