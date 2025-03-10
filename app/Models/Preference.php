<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Preference extends Model
{
    use HasFactory;

    protected $fillable = ['student_id', 'criteria'];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
