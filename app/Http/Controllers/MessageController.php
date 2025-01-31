<?php
namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MessageController extends Controller
{
    // AdminMessageController.php
   public function index()
   {
    $conversations = Message::select('sender_id', 'receiver_id')
        ->distinct()
        ->with(['sender', 'receiver'])
        ->latest()
        ->get()
        ->map(function($message) {
            return [
                'student' => $message->sender->role === 'student' ? $message->sender : $message->receiver,
                'last_message' => Message::where(function($query) use ($message) {
                    $query->where('sender_id', $message->sender_id)
                          ->where('receiver_id', $message->receiver_id);
                })->latest()->first()
            ];
        });

    return view('admin.messages.index', compact('conversations'));
    }

    public function show($userId)
    {
        $messages = Message::where(function($query) use ($userId) {
            $query->where('sender_id', Auth::id())
                  ->where('receiver_id', $userId);
        })->orWhere(function($query) use ($userId) {
            $query->where('sender_id', $userId)
                  ->where('receiver_id', Auth::id());
        })->with(['sender'])->get();

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
