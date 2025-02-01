<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class CourseRegistrationAlert extends Notification
{
    use Queueable;

    public $courseName;

    public function __construct($courseName)
    {
        $this->courseName = $courseName;
    }

    // Define the notification delivery channels
    public function via($notifiable)
    {
        return ['mail', 'database']; // You can add other channels like 'slack', 'sms', etc.
    }

    // Content for the email channel
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->subject('Course Registration Alert')
                    ->line("You have registered for '$this->courseName', which is outside your degree requirements.")
                    ->action('View Your Courses', url('/student/courses'))
                    ->line('Please ensure you register for courses within your degree requirements.');
    }

    // Content for the database channel
    public function toArray($notifiable)
    {
        return [
            'message' => "You have registered for '$this->courseName' outside your degree requirements.",
        ];
    }
}
