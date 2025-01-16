<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class Waitlist extends Model
{
    use HasFactory;
    protected $fillable = [
        'student_id',
        'course_section_id',
        'position',
        'status',
    ];
    // Relationships
    public function courseSection()
    {
        return $this->belongsTo(SectionInfo::class, 'course_section_id');
    }
    public function student()
    {
        return $this->belongsTo(User::class, 'student_id');
    }
}