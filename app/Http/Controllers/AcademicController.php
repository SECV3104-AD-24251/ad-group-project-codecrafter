<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AcademicController extends Controller
{
    public function courseApprovals()
    {
        // Add logic to retrieve data for the course approvals page
        return view('academic.course-approvals');
    }
}
