<?php 
namespace App\Http\Controllers;

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




}
