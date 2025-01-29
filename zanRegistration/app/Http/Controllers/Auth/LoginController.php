<?php
namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Notifications\UserNotification;
use Illuminate\Auth\AuthenticatesUsers;


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
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            // Check the user's role and redirect to the corresponding dashboard
            if ($user->role == 'student') {
                return redirect()->route('student.dashboard'); // Redirect to the student dashboard
            }

            if ($user->role == 'academic_staff') {
                return redirect()->route('academic.dashboard'); // Redirect to the academic staff dashboard
            }
        }

        // If authentication fails, redirect back to the login page with errors
        return redirect()->route('login')->withErrors(['email' => 'Invalid credentials']);
    }

    /**
     * Handle a successful login and redirect based on the user role.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Illuminate\Auth\Events\Login $event
     * @return \Illuminate\Http\RedirectResponse
     */
    protected function authenticated(Request $request, $user)
    {
        // Send login success email notification
        $details = [
            'subject' => 'Successful Login',
            'body' => 'You have successfully logged into your account.',
            'actionText' => 'View Account',
            'actionUrl' => route('account.show', $user->id),
        ];

        $user->notify(new UserNotification($details));

        if ($user->role === 'academic_staff') {
            return redirect()->route('academic.dashboard');
        }

        if ($user->role === 'student') {
            return redirect()->route('student.dashboard');
        }

        return redirect('/'); // Fallback to home or error page
    }


}
