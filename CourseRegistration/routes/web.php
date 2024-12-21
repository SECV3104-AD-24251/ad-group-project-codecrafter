<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\StudentDashboardController;
use App\Http\Controllers\StudentCourseRegisteredController;
use App\Http\Controllers\CourseRegistrationController;
use App\Http\Controllers\ProcessRegistrationController;

Route::get('/', function () {
    return view('welcome');
});

// Redirect route based on role selection
Route::get('/login/redirect', function (Illuminate\Http\Request $request) {
    $role = $request->input('role');

    if ($role == 'student') {
        return redirect()->route('login');
    } elseif ($role == 'academic_staff') {
        return redirect()->route('login');
    } else {
        return redirect('/');
    }
})->name('login.redirect');

Route::get('/register', [RegisterController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [RegisterController::class, 'register']);

Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);

// Student dashboard
Route::get('/student/dashboard', [StudentDashboardController::class, 'index'])->name('student.dashboard');

// To view registered courses
Route::get('/student/courses/registered', [StudentCourseRegisteredController::class, 'index'])
    ->name('student.courses.registered');

// Course Registration Routes
Route::get('/student/courses/register', [CourseRegistrationController::class, 'showSubjectList'])
    ->name('student.courses.register');

// Route to show sections
Route::get('/course/{course_id}/sections', [ProcessRegistrationController::class, 'showSections'])
    ->name('processRegistration.show');

// Route to enroll or unenroll from a section
Route::post('/course/section/enroll', [ProcessRegistrationController::class, 'enroll'])
    ->name('processRegistration.enroll');

Route::get('/student/courses/registered', [StudentCourseRegisteredController::class, 'index'])
    ->name('student.courses.registered');

