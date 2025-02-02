<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Message;

class ChatController extends Controller
{
    public function getMessages($consultationId)
    {
        return Message::where('consultation_id', $consultationId)->get();
    }

    public function sendMessage(Request $request)
    {
        $message = Message::create([
            'consultation_id' => $request->consultation_id,
            'sender_id' => auth()->id(),
            'text' => $request->message,
        ]);

        return response()->json($message);
    }
}
