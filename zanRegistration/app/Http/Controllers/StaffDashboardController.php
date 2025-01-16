<?php 
namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;

class StaffDashboardController extends Controller
{

    public function dashboard()
    {

        // Return the dashboard view and pass the students
        return view('academic.dashboard');
    }



}
