<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function redirectToLogin(Request $request)
    {
        $request->validate([
            'role' => 'required'
        ]);

        $role = $request->input('role');

        if ($role === 'student') {
            return redirect()->route('login.student');
        } elseif ($role === 'academic_staff') {
            return redirect()->route('login.staff');
        }

        return redirect()->back()->with('error', 'Invalid role selected.');
    }

    public function studentLogin()
    {
        // Show the login form for students
        return view('auth.student-login');
    }

    public function staffLogin()
    {
        // Show the login form for academic staff
        return view('auth.staff-login');
    }
}
