<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Student extends Model
{
    // Fillable properties
    protected $fillable = ['name', 'email', 'password'];

    // Relationship to get the completed courses
    public function completedCourses(): BelongsToMany
    {
        return $this->belongsToMany(Course::class, 'completed_courses');
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

}
