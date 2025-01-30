<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\ProgressController;

Route::view("/", "welcome");

// Redirect to Student Login
Route::get('/student/login', function () {
    return view('auth.student-login'); // Replace with your student login view
})->name('student.login');

// Redirect to Academic Staff Login
Route::get('/staff/login', function () {
    return view('auth.staff-login'); // Replace with your admin login view
})->name('staff.login');

Route::post('/student/login', [StudentController::class, 'login'])->name('student.login');

//Registration of new user
Route::get('/register', [RegisterController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [RegisterController::class, 'register']);

//Staff dashboard
Route::middleware(['auth'])->group(function () {
    Route::get('/staff/dashboard', [StaffController::class, 'index'])->name('staff.dashboard');
});

//Student dashboard
Route::middleware(['auth'])->group(function () {
    Route::get('/student/dashboard', [StudentController::class, 'index'])->name('student.dashboard');
});

// Progress Tracking Route (Updated)
Route::middleware(['auth'])->group(function () {
    Route::get('/progress', [ProgressController::class, 'index'])->name('progress');
});

Route::get('/login', [StudentController::class, 'login'])->name('login');

//Route::get('/progress', [ProgressController::class, 'showProgress'])->name('progress');
