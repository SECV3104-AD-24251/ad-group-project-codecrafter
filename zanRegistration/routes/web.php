<?php

use App\Http\Controllers\NotificationController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\AcademicController;
use App\Http\Controllers\WaitlistController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\StaffDashboardController;
use App\Http\Controllers\StudentDashboardController;
use App\Http\Controllers\CourseRegistrationController;
use App\Http\Controllers\ProcessRegistrationController;
use App\Http\Controllers\Student\DegreeProgressController;
use App\Http\Controllers\StudentCourseRegisteredController;
use App\Http\Controllers\ConsultationController;
use App\Http\Controllers\ChatsController;


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
Route::get('/student/dashboard', [StudentDashboardController::class, 'dashboard'])->name('student.dashboard')->middleware('auth');;
Route::get('/student/courses/registered', [StudentCourseRegisteredController::class, 'index'])->name('student.courses.registered');
Route::get('/student/chat', [ChatController::class, 'index'])->name('student.chat');
Route::post('/student/chat/send', [ChatController::class, 'sendMessage']);

// Academic Staff Routes
Route::get('/academic-dashboard', [StaffDashboardController::class, 'dashboard'])->name('academic.dashboard');

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

Route::middleware(['auth'])->group(function () {
    Route::get('/student/degree-progress', [DegreeProgressController::class, 'showProgress'])
        ->name('student.degree.progress');
    });

//Timetable conflict
Route::post('/check-conflict', [RegistrationController::class, 'checkConflict']);

Route::get('/waitlist', [WaitlistController::class, 'index'])->name('student.waitlist')->middleware('auth');
Route::post('/waitlist/join', [WaitlistController::class, 'join'])->name('student.waitlist.join')->middleware('auth');
Route::delete('/waitlist/leave/{id}', [WaitlistController::class, 'leave'])->name('student.waitlist.leave')->middleware('auth');

//Course approvals
Route::get('/academic/course-approvals', [AcademicController::class, 'courseApprovals'])->name('academic.course.approvals');

// Chat
Route::middleware('auth')->group(function () {
    Route::get('/chat', [ChatController::class, 'showChat'])->name('index');
    Route::get('/chat/messages/{user}', [ChatController::class, 'fetchMessages'])->name('chat.messages');
    Route::post('/chat/messages', [ChatController::class, 'sendMessage'])->name('chat.send');
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

//Consultation Routes
Route::middleware(['auth'])->group(function () {
    Route::get('/student/courses/consultation', [ConsultationController::class, 'index'])->name('student.courses.consultation');
    Route::post('/student/courses/consultation/store', [ConsultationController::class, 'store'])->name('student.courses.consultation.store');
});

Route::get('/messages/{consultationId}', [ChatsController::class, 'getMessages']);
Route::post('/messages', [ChatsController::class, 'sendMessage']);
