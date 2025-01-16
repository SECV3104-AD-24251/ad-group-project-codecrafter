<?php 
namespace App\Http\Controllers;

use App\Models\User;
use YourNotification;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    
    public function markAsRead($id)
{
    $notification = Auth::user()->notifications()->find($id);

    if ($notification) {
        $notification->markAsRead();
    }

    return redirect()->back()->with('success', 'Notification marked as read.');
}

    
}