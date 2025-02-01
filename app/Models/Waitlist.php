<?php
namespace App\Models;
use App\Models\Course;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Waitlist extends Model
{
    use HasFactory;
    protected $fillable = [
        'student_id',
        'course_id',
        'position',
        'status',
    ];

    // Relationships
    public function course()
    {
       return $this->belongsTo(Course::class, 'course_id');
    }

    public function student()
    {
       return $this->belongsTo(User::class, 'student_id');
    }

    public function courseSection()
    {
       return $this->belongsTo(Course::class, 'section');
    }



}