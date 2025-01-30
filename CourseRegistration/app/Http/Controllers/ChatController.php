<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Events\MessageSent;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User; // Ensure you have the User model

class ChatController extends Controller
{
    public function index(Request $request)
{
    $currentUserId = Auth::id(); // Fetch the currently logged-in user's ID
    $academicStaff = User::where('role', 'academic_staff')->get(); // Fetch academic staff list
    return view('student.chat', compact('currentUserId', 'academicStaff'));
}

public function showAcademicMessages($student_id)
{
    $messages = Message::where('receiver_id', $student_id)
        ->orWhere('sender_id', $student_id)
        ->orderBy('created_at', 'asc')
        ->get();

    return view('academic.dashboard', compact('messages', 'student_id'));
}

public function sendMessage(Request $request)
{
    $validated = $request->validate([
        'receiver_id' => 'required|exists:users,id',
        'message' => 'required|string|max:1000',
    ]);

    $message = Message::create([
        'sender_id' => Auth::id(),
        'receiver_id' => $validated['receiver_id'],
        'content' => $validated['message'],
        'sender_role' => 'student',
    ]);

    // Debugging
    if (!$message) {
        return response()->json(['success' => false, 'error' => 'Failed to save message'], 500);
    }

    broadcast(new MessageSent($message))->toOthers();

    return response()->json(['success' => true, 'message' => $message]);
}

    public function replyToStudent(Request $request)
    {
        $validated = $request->validate([
            'student_id' => 'required|exists:users,id',
            'message' => 'required|string|max:1000',
        ]);
    
        // Create the reply message
        Message::create([
            'sender_id' => Auth::id(),
            'receiver_id' => $validated['student_id'],
            'content' => $validated['message'],
            'sender_role' => 'staff', // Assuming 'staff' as the sender role
        ]);
    
        return redirect()->route('academic.dashboard', ['student_id' => $validated['student_id']])
            ->with('success', 'Message sent successfully.');
    }
}
