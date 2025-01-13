<?php 
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Notifications\Notifiable;

class Student extends Model
{

    use Notifiable;
    protected $table = 'students';
    
    // Define the many-to-many relationship with courses
    public function courses()
{
    return $this->belongsToMany(Course::class, 'course_user', 'student_id', 'course_id');
}

public function completedCourses(): BelongsToMany
    {
        return $this->belongsToMany(Course::class, 'completed_courses');
    }

    public function degreePlan()
    {
        return $this->belongsTo(DegreePlan::class);
    }

    public function registeredCourses()
    {
        return $this->belongsToMany(Course::class, 'course_user');
    }

}
