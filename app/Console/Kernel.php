protected function schedule(Schedule $schedule)
{
    $schedule->call(function () {
        // Fetch all new courses marked as 'is_new'
        $newCourses = Course::where('is_new', true)->get();

        foreach ($newCourses as $course) {
            // Fetch all students' preferences
            $preferences = Preference::all();

            foreach ($preferences as $preference) {
                // Decode criteria JSON from the preferences table
                $criteria = json_decode($preference->criteria, true);

                // Logic to match course with preferences
                if ($this->matchesPreference($course, $criteria)) {
                    // Notify the student
                    $preference->student->notify(new CourseAvailableNotification($course));
                }
            }

            // Mark the course as no longer new after processing
            $course->update(['is_new' => false]);
        }
    })->everyMinute(); // Schedule runs every minute
}

/**
 * Check if a course matches a student's preference criteria.
 *
 * @param Course $course
 * @param array $criteria
 * @return bool
 */
protected function matchesPreference(Course $course, array $criteria)
{
    // Example matching logic
    if (
        (isset($criteria['time_slots']) && in_array($course->time_slot, $criteria['time_slots'])) ||
        (isset($criteria['instructors']) && in_array($course->instructor_id, $criteria['instructors'])) ||
        (isset($criteria['course_types']) && in_array($course->type, $criteria['course_types']))
    ) {
        return true;
    }

    return false;
}
