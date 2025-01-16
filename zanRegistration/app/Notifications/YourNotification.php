<?php

use Illuminate\Notifications\Notification;

class YourNotification extends Notification
{
    public function __construct()
    {
        // Initialization
    }

    public function via($notifiable)
    {
        return ['database'];  // Or other channels, e.g., mail, sms, etc.
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => 'Notification message'
        ];
    }
}
