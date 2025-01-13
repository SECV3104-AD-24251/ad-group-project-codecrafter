<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
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

    public function registeredSubjects()
    {
        return $this->belongsToMany(Course::class, 'user_subjects');
    }

    public function sections()
    {
        return $this->hasMany(SectionInfo::class, 'user_id');
    }

    public function completedCourses()
    {
        return $this->hasMany(CourseCompletion::class);
    }

    public function calculateCreditHours()
{
    // Assuming you have a `registeredCourses` relationship
    return $this->registeredCourses()->sum('credits');
}

public function registeredCourses()
{
    return $this->belongsToMany(Course::class, 'course_user', 'user_id', 'course_id');
}

}