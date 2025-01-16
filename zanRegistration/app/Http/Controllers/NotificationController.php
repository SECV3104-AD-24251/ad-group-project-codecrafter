<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function markAsRead($notificationId)
    {
        // Find the notification for the authenticated user
        $notification = Auth::user()->notifications()->find($notificationId);

        if ($notification) {
            // Mark the notification as read
            $notification->markAsRead();
        }

        // Redirect back after marking as read
        return redirect()->route('student.notifications');
    }

    public function showNotifications()
    {
    // Fetch all notifications for the logged-in user (student)
    $notifications = Auth::user()->notifications;

    // Pass them to the view
    return view('student.notifications', compact('notifications'));
    }  

}
