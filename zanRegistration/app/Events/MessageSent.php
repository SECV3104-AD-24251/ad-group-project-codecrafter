<?php 
namespace App\Events;

use App\Models\User;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class MessageSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $user;
    public $message;

    public function __construct($message)
    {
        $this->message = $message;
    }

    // Broadcast on a private channel
    public function broadcastOn()
    {
        return new PrivateChannel('chat.' . $this->user->id);
    }

    // Include additional data in the broadcast
    public function broadcastWith()
    {
        return [
            'message' => $this->message,
            'user' => $this->user->name,
            'user_id' => $this->user->id,
        ];
    }
}
