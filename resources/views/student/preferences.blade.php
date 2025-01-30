<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Notification Preferences</title>
</head>
<body>
    <div class="container">
        <h1>Set Notification Preferences</h1>

        <form method="POST" action="{{ route('preferences.store') }}">
            @csrf

            <label for="time_slots">Preferred Time Slots:</label><br>
            <input type="text" id="time_slots" name="criteria[time_slots]"
                   placeholder="e.g., Morning, Afternoon"
                   value="{{ optional($preferences)->criteria['time_slots'] ?? '' }}"><br><br>

            <label for="instructors">Preferred Instructors:</label><br>
            <input type="text" id="instructors" name="criteria[instructors]"
                   placeholder="e.g., Dr. Smith"
                   value="{{ optional($preferences)->criteria['instructors'] ?? '' }}"><br><br>

            <label for="course_types">Preferred Course Types:</label><br>
            <input type="text" id="course_types" name="criteria[course_types]"
                   placeholder="e.g., Lecture, Lab"
                   value="{{ optional($preferences)->criteria['course_types'] ?? '' }}"><br><br>

            <button type="submit">Save Preferences</button>
        </form>

        @if(session('success'))
            <p style="color: green;">{{ session('success') }}</p>
        @endif
    </div>
</body>
</html>
