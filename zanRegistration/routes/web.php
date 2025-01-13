<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\StaffDashboardController;
use App\Http\Controllers\StudentDashboardController;
use App\Http\Controllers\CourseRegistrationController;
use App\Http\Controllers\ProcessRegistrationController;
use App\Http\Controllers\Student\DegreeProgressController;
use App\Http\Controllers\StudentCourseRegisteredController;

// Welcome Page
Route::get('/', function () {
    return view('welcome');
});

// Redirect based on role
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

// Login Routes
Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);

// Student Routes
Route::get('/student/dashboard', [StudentDashboardController::class, 'dashboard'])->name('student.dashboard');
Route::get('/student/courses/registered', [StudentCourseRegisteredController::class, 'index'])->name('student.courses.registered');
Route::get('/student/chat', [ChatController::class, 'index'])->name('student.chat');
Route::post('/student/chat/send', [ChatController::class, 'sendMessage']);

// Academic Staff Routes
Route::get('/academic-dashboard', [StaffDashboardController::class, 'dashboard'])->name('academic.dashboard');
Route::prefix('academic/chat')->group(function () {
    Route::get('/academic/dashboard/{student_id}', [ChatController::class, 'showAcademicMessages'])->name('academic.dashboard');
    Route::post('/academic/chat/reply', [ChatController::class, 'replyToStudent']);
});

// Course Registration
Route::get('/student/courses/register', [CourseRegistrationController::class, 'showSubjectList'])->name('student.courses.register');
Route::get('/course/{course_id}/sections', [ProcessRegistrationController::class, 'showSections'])->name('processRegistration.show');
Route::post('/course/section/enroll', [ProcessRegistrationController::class, 'enroll'])->name('processRegistration.enroll');
Route::post('/course/success', [ProcessRegistrationController::class, 'enroll'])->name('processRegistration.success');

Route::middleware(['auth'])->group(function () {
    Route::get('/student/degree-progress', [DegreeProgressController::class, 'showProgress'])
        ->name('student.degree.progress');
});

Route::get('/student/credit-hours', [StudentController::class, 'showCreditHours'])->name('student.credit.hours');
