<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Course;

class CourseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $courses = [
            ['code' => 'CS101', 'name' => 'Introduction to Programming', 'type' => 'mandatory'],
            ['code' => 'CS102', 'name' => 'Data Structures', 'type' => 'mandatory'],
            ['code' => 'CS201', 'name' => 'Web Development', 'type' => 'elective'],
            ['code' => 'CS202', 'name' => 'Mobile App Development', 'type' => 'elective'],
        ];

        foreach ($courses as $course) {
            Course::create($course);
        }
    }
}
