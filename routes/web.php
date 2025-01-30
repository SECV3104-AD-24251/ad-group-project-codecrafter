<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\StudentDashboardController;
use App\Http\Controllers\ConsultationController;
use App\Http\Controllers\StudentCourseRegisteredController;
use App\Http\Controllers\CourseRegistrationController;
use App\Http\Controllers\ProcessRegistrationController;
use App\Http\Controllers\PreferenceController;

// Default route
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

// Authentication Routes
Route::get('/register', [RegisterController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [RegisterController::class, 'register']);

Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);

// Student Dashboard
Route::get('/student/dashboard', [StudentDashboardController::class, 'index'])->name('student.dashboard');

// To view registered courses
Route::get('/student/courses/registered', [StudentCourseRegisteredController::class, 'index'])
    ->name('student.courses.registered');

// Consultation Routes
Route::get('/student/courses/consultation', [ConsultationController::class, 'index'])
    ->name('student.courses.consultation');

Route::post('/student/courses/consultation', [ConsultationController::class, 'store'])
    ->name('student.courses.consultation.store');


// Show subject list and handle semester filter
Route::get('/student/courses/register', [CourseRegistrationController::class, 'showSubjectList'])
    ->name('student.courses.register');

// Route to show sections
Route::get('/course/{course_id}/sections', [ProcessRegistrationController::class, 'showSections'])
    ->name('processRegistration.show');

// Route to enroll or unenroll from a section
Route::post('/course/section/enroll', [ProcessRegistrationController::class, 'enroll'])
    ->name('processRegistration.enroll');

Route::post('/mark-priority', [CourseRegistrationController::class, 'markAsHighPriority'])
    ->name('mark.priority');

Route::get('/high-priority-courses', [CourseRegistrationController::class, 'getHighPriorityCourses'])
    ->name('highPriority.courses');

Route::middleware(['auth'])->group(function () {
    Route::get('/preferences', [PreferenceController::class, 'index'])->name('preferences.index');
    Route::post('/preferences', [PreferenceController::class, 'store'])->name('preferences.store');
});
