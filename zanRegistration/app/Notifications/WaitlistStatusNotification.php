<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\DatabaseMessage;
use Illuminate\Notifications\Messages\MailMessage;
use App\Models\Course;

class WaitlistStatusNotification extends Notification
{
    use Queueable;

    public $courseName;
    public $status;

    /**
     * Create a new notification instance.
     *
     * @param array $data
     * @return void
     */
    public function __construct($data)
    {
        $this->courseName = $data['course_name'];
        $this->status = $data['status'];
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database', 'mail'];  // Here you can add more channels like 'broadcast' or 'sms'
    }

    /**
     * Get the array representation of the notification for database delivery.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        return [
            'course_name' => $this->courseName,
            'status' => $this->status,
            'message' => "Your waitlist status for the course '{$this->courseName}' has been updated to '{$this->status}'.",
        ];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line("Your waitlist status for the course '{$this->courseName}' has been updated.")
                    ->line("Status: {$this->status}")
                    ->action('View Course Details', url('/courses'))  // Modify URL as needed
                    ->line('Thank you for using our application!');
    }
}
