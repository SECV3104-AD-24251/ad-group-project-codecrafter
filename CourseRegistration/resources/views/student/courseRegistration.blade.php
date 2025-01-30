<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
        }

        .dropdown {
            margin-bottom: 20px;
        }

        .dropdown select {
            padding: 8px;
            font-size: 14px;
        }

        .course-list a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            background: #e1e5ec;
            text-decoration: none;
            color: #333;
            border-radius: 5px;
        }

        .course-list a:hover {
            background: #007BFF;
            color: white;
        }
    </style>
    <script>
        function filterSemester() {
            var selectedSemester = document.getElementById('semesterSelect').value;
            window.location.href = '{{ route("student.courses.register") }}?semester=' + selectedSemester;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Course Registration</h1>

        <!-- Semester Dropdown -->
        <div class="dropdown">
            <label for="semesterSelect">Select Semester:</label>
            <select id="semesterSelect" onchange="filterSemester()">
                <option value="">All Semesters</option>
                @foreach ($semesters as $semester)
                    <option value="{{ $semester }}" @if($selectedSemester == $semester) selected @endif>
                        {{ $semester }}
                    </option>
                @endforeach
            </select>
        </div>

        <!-- Course List -->
        <div class="course-list">
            @if ($subjects->isEmpty())
                <p>No courses available for the selected semester.</p>
            @else
                @foreach ($subjects as $subject)
                    <a href="{{ route('processRegistration.show', $subject->id) }}">
                        {{ $subject->subject_code }} - {{ $subject->subject_name }} (Credit: {{ $subject->credit_hours }})
                    </a>
                @endforeach
            @endif
        </div>
    </div>
</body>
</html>
