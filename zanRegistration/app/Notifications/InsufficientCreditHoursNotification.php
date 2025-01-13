<?php

namespace App\Notifications;

use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class InsufficientCreditHoursNotification extends Notification
{
    protected $requiredCreditHours;
    protected $currentCreditHours;

    /**
     * Create a new notification instance.
     *
     * @param int $requiredCreditHours
     * @param int $currentCreditHours
     */
    public function __construct($requiredCreditHours, $currentCreditHours)
    {
        $this->requiredCreditHours = $requiredCreditHours;
        $this->currentCreditHours = $currentCreditHours;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        // Define how the notification will be sent
        return ['database', 'mail']; // Can include 'mail', 'sms', etc., if needed
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
            ->subject('Insufficient Credit Hours Notification')
            ->greeting('Hello, ' . $notifiable->name . '!')
            ->line('Your registered credit hours are insufficient for this semester.')
            ->line("You currently have {$this->currentCreditHours} credit hours.")
            ->line("The required credit hours for this semester are {$this->requiredCreditHours}.")
            ->action('Review Courses', url('/student/courses/register'))
            ->line('Please ensure your courses meet the credit hour requirements for the semester.');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'message' => "Your registered credit hours are insufficient. 
                          You currently have {$this->currentCreditHours} credit hours, 
                          but {$this->requiredCreditHours} are required.",
            'required_credit_hours' => $this->requiredCreditHours,
            'current_credit_hours' => $this->currentCreditHours,
        ];
    }
}
