<?php

namespace App\Models;

use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Student extends Model
{
    protected $fillable = [
        'name', 
        'email', 
        'password',
        'address',
        'student_id',
        'profile_picture',
        'status',
    ];

    // Relationship to get the completed courses
    public function completedCourses()
   {
    return $this->belongsToMany(Course::class, 'completed_courses')
                ->select('courses.id'); // Only select existing columns
    }  

    // Relationship to get the associated degree plan
    public function degreePlan(): HasOne
   {  
    return $this->hasOne(DegreePlan::class, 'student_id', 'id');
   }

    public function registeredCourses()
    {
    return $this->belongsToMany(Course::class, 'course_student', 'student_id', 'course_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }


}
