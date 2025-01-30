<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HighPriorityCourse extends Model
{
    use HasFactory;

    // Define the table name if it's not "high_priority_courses" (Eloquent assumes plural names)
    protected $table = 'high_priority_courses';

    // Define the fillable properties
    protected $fillable = [
        'student_id',
        'course_id',
        'is_high_priority',
    ];

    // Define the relationship with the Course model
    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    // Define the relationship with the Student model (if needed)
    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
