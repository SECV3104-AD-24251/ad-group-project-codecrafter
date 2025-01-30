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
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px; /* Increased width for better layout */
            margin: 30px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between; /* Align content horizontally */
        }

        .main-content {
            flex: 3;
            padding-right: 20px;
        }

        .sidebar {
            flex: 1;
            padding: 10px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .dropdown {
            margin-bottom: 20px;
            text-align: center;
        }

        .dropdown select {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .course-list a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            background: #e1e5ec;
            text-decoration: none;
            color: #333;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .course-list a:hover {
            background: maroon;
            color: white;
        }

        .back-button {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 15px;
            background-color: maroon;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: maroon;
        }

        .no-courses {
            text-align: center;
            color: #555;
            font-style: italic;
        }

        .credits {
            font-size: 18px;
            color: #333;
            font-weight: bold;
        }

        .credits span {
            color: maroon;
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
        <!-- Main Content -->
        <div class="main-content">
            <!-- Back Button -->
            <a href="{{ route('student.dashboard') }}" class="back-button">← Back to Dashboard</a>

            <!-- Page Heading -->
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
                    <p class="no-courses">No courses available for the selected semester.</p>
                @else
                    @foreach ($subjects as $subject)
                        <a href="{{ route('processRegistration.show', $subject->id) }}">
                            {{ $subject->course_code }} - {{ $subject->course_name }} (Credit: {{ $subject->credits }})
                        </a>
                    @endforeach
                @endif
            </div>
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <h2>Credit Hours</h2>
            <p class="credits">
                Current Credits: <span>{{ $currentCredits }}</span>
            </p>
        </div>
    </div>
</body>
</html>
