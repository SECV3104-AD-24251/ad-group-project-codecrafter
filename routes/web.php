<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StudentDashboardController;
use App\Http\Controllers\ConsultationController;
use App\Http\Controllers\StudentCourseRegisteredController;
use App\Http\Controllers\CourseRegistrationController;
use App\Http\Controllers\ProcessRegistrationController;
use App\Http\Controllers\PreferenceController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\AcademicController;
use App\Http\Controllers\WaitlistController;
use App\Http\Controllers\StaffDashboardController;
use App\Http\Controllers\Student\DegreeProgressController;

// Welcome Page
Route::get('/', function () {
    return view('welcome');
});

// logout
Route::post('/logout', function () {
    Auth::logout();
    return redirect('/');
})->name('logout');


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
Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);

// Profile
Route::middleware(['auth'])->group(function () {
    Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::post('/profile/update', [ProfileController::class, 'update'])->name('profile.update');
});




// Student Dashboard
Route::get('/student/dashboard', [StudentDashboardController::class, 'dashboard'])->name('student.dashboard');

// Academic Staff Routes
Route::get('/academic-dashboard', [StaffDashboardController::class, 'dashboard'])->name('academic.dashboard');

Route::get('/student/chat', [ChatController::class, 'index'])->name('student.chat');
Route::post('/student/chat/send', [ChatController::class, 'sendMessage']);

// To view registered courses
Route::get('/student/courses/registered', [StudentCourseRegisteredController::class, 'index'])
    ->name('student.courses.registered');

// Consultation Routes
Route::get('/student/courses/consultation', [ConsultationController::class, 'index'])
    ->name('student.courses.consultation');

Route::post('/student/courses/consultation', [ConsultationController::class, 'store'])
    ->name('student.courses.consultation.store');

// Course Registration
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

// Degree progress tracker
Route::middleware(['auth'])->group(function () {
    Route::get('/student/degree-progress', [DegreeProgressController::class, 'showProgress'])
        ->name('student.degree.progress');
});

Route::get('/student/credit-hours', [StudentController::class, 'showCreditHours'])->name('student.credit.hours');

Route::middleware(['auth'])->group(function () {
    Route::get('/preferences', [PreferenceController::class, 'index'])->name('preferences.index');
    Route::post('/preferences', [PreferenceController::class, 'store'])->name('preferences.store');
});

//Timetable conflict
Route::post('/check-conflict', [RegistrationController::class, 'checkConflict']);

Route::get('/waitlist', [WaitlistController::class, 'index'])->name('student.waitlist')->middleware('auth');
Route::post('/waitlist/join', [WaitlistController::class, 'join'])->name('student.waitlist.join')->middleware('auth');
Route::delete('/waitlist/leave/{id}', [WaitlistController::class, 'leave'])->name('student.waitlist.leave')->middleware('auth');

//Course approvals
Route::get('/academic/course-approvals', [AcademicController::class, 'courseApprovals'])->name('academic.course.approvals');

// Chat
Route::middleware(['auth'])->group(function () {
    Route::get('/chat', [MessageController::class, 'index']);
    Route::get('/messages/{user}', [MessageController::class, 'show']);
    Route::post('/messages', [MessageController::class, 'store']);
});

//Waitlist
//Student side
Route::get('/student/waitlist-form', [StudentController::class, 'showWaitlistForm'])->name('student.waitlist.form');
Route::post('/waitlist/submit', [WaitlistController::class, 'submit'])->name('waitlist.submit');

Route::get('/waitlist', [StudentDashboardController::class, 'waitlist'])->name('student.waitlist');
Route::delete('/waitlist/leave/{id}', [WaitlistController::class, 'leave'])->name('student.waitlist.leave');

//Staff side
Route::get('/academic/waitlist', [WaitlistController::class, 'viewRequests'])->name('academic.waitlist');
//Accept or rejct
Route::post('/waitlist/action', [WaitlistController::class, 'handleWaitlistAction'])->name('academic.waitlist.action');

//Notification
Route::get('/notifications', [NotificationController::class, 'showNotifications'])->name('student.notifications');
Route::get('/notifications/read/{notificationId}', [NotificationController::class, 'markAsRead'])->name('notification.read');
