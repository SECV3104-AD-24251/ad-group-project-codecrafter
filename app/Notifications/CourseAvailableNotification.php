<?php

namespace App\Notifications;

use Illuminate\Notifications\Notification;
use NotificationChannels\Fcm\FcmMessage;

class CourseAvailableNotification extends Notification
{
    private $course;

    public function __construct($course)
    {
        $this->course = $course;
    }

    public function via($notifiable)
    {
        return ['fcm'];
    }

    public function toFcm($notifiable)
    {
        return (new FcmMessage())
            ->title('New Course Available!')
            ->body("The course {$this->course->name} is now available!")
            ->data(['course_id' => $this->course->id]);
    }
}
