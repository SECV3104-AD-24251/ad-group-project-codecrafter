<?php
namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    // Show the login form
    public function showLoginForm()
    {
        return view('auth.login');
    }

    // Handle the login request
    public function login(Request $request)
    {
        // Validate user input
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            // Redirect based on role
            if ($user->role == 'student') {
                return redirect()->route('student.dashboard'); 
            } elseif ($user->role == 'academic_staff') {
                return redirect()->route('academic.dashboard'); 
            }

            return redirect('/'); // Default fallback
        }

        // If authentication fails, redirect back with error message
        return redirect()->route('login')->withErrors(['email' => 'Invalid credentials'])->withInput();
    }

    // Logout function
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/login'); // Redirect to login page after logout
    }
}
