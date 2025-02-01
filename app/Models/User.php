<?php

namespace App\Models;

use App\Models\Waitlist;
use App\Models\CourseCompletion;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{

    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'matrics_number',
        'role',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function registeredCourses()
    {
    return $this->belongsToMany(Course::class, 'course_user', 'user_id', 'course_id');
    }

    public function isStudent(): bool
    {
        return $this->role === 'student';
    }

    public function waitlists()
    {
        return $this->hasMany(Waitlist::class, 'student_id');
    }

    public function sentMessages()
{
    return $this->hasMany(Message::class, 'sender_id');
}

public function receivedMessages()
{
    return $this->hasMany(Message::class, 'receiver_id');
}

public function completedCourses()
{
    return $this->belongsToMany(Course::class, 'completed_courses', 'student_id', 'course_id');
}


}
