<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Waitlist Form</title>
</head>
<body>
    <h1>Student Waitlist Form</h1>

    <form action="{{ route('student.waitlist.submit') }}" method="POST">
        @csrf
        <label for="course_id">Course:</label>
        <select name="course_id" id="course_id" required>
            @foreach($courses as $course)
                <option value="{{ $course->id }}">{{ $course->name }}</option>
            @endforeach
        </select>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
