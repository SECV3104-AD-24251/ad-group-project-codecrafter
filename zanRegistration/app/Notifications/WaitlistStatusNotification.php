<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Messages\DatabaseMessage;
use Illuminate\Notifications\Notification;

class WaitlistStatusNotification extends Notification
{
    use Queueable;

    public $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    // For in-app notifications
    public function toDatabase($notifiable)
    {
        return [
            'course_name' => $this->data['course_name'],
            'status' => ucfirst($this->data['status']),
            'message' => "Your waitlist request for '{$this->data['course_name']}' has been {$this->data['status']}.",
        ];
    }

    // For email notifications
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Waitlist Status Update')
            ->line("Your waitlist request for '{$this->data['course_name']}' has been {$this->data['status']}.")
            ->line('Thank you for using the Smart Course Registration System!');
    }

    public function via($notifiable)
    {
        // Send both email and in-app notifications
        return ['mail', 'database'];
    }
}
