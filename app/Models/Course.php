<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        'subject_code',
        'subject_name',
        'credit_hours',
        'no_section',
        'semester',
        'day',
        'start_time',
        'end_time',

    ];

    public function sections()
    {
        return $this->hasMany(SectionInfo::class, 'course_id');
    }

    public function students()
   {
    return $this->belongsToMany(Student::class, 'students', 'course_id', 'student_id');
   }
}