<?php
namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MessageController extends Controller
{
    public function index($staffId)
    {
        $userId = Auth::id();
        $messages = Message::where(function ($query) use ($userId, $staffId) {
            $query->where('sender_id', $userId)
                  ->where('receiver_id', $staffId);
        })->orWhere(function ($query) use ($userId, $staffId) {
            $query->where('sender_id', $staffId)
                  ->where('receiver_id', $userId);
        })->orderBy('created_at', 'asc')->get();

        return response()->json($messages);
    }

    public function store(Request $request)
    {
        $request->validate([
            'receiver_id' => 'required|exists:users,id',
            'message' => 'required|string|max:500',
        ]);

        $message = Message::create([
            'sender_id' => Auth::id(),
            'receiver_id' => $request->receiver_id,
            'message' => $request->message,
        ]);

        // Broadcast the message event for real-time updates
        broadcast(new \App\Events\MessageSent($message))->toOthers();

        return response()->json(['success' => true, 'message' => $message]);
    }
}
