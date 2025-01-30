<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registered - Smart Course Registration</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #007BFF;
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-button {
            background-color: #fff;
            color: #007BFF;
            border: none;
            padding: 8px 15px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Navigation */
        .nav {
            display: flex;
            justify-content: center;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .nav a {
            padding: 10px 20px;
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            font-size: 14px;
        }

        .nav a.active {
            background-color: #007BFF;
            color: white;
            border-radius: 10px 10px 0 0;
        }

        /* Progress Section */
        .progress-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .progress-details {
            font-size: 28px;
            color: #dc3545;
            font-weight: bold;
        }

        .progress-bar-container {
            width: 100%;
            margin-left: 20px;
        }

        .progress-bar {
            height: 10px;
            background-color: #e9ecef;
            border-radius: 5px;
        }

        .progress-bar span {
            display: block;
            height: 100%;
            background-color: #dc3545;
            border-radius: 5px;
        }

        /* Course Sections */
        .course-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .course-section {
            flex: 1;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .course-section h3 {
            margin-top: 0;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            text-align: left;
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #dc3545;
            color: white;
        }

        td {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Header -->
    <div class="header">
        <h1>Smart Course Registration</h1>
        <div class="dropdown">
            <button class="dropdown-button">Profile</button>
        </div>
    </div>

    <!-- Navigation -->
    <div class="nav">
        <a href="{{ route('student.dashboard') }}">Dashboard</a>
        <a href="{{ route('student.courses.registered') }}" class="active">Course Registered</a>
    </div>

    <!-- Progress Section -->
<div class="progress-container">
    <div class="progress-details">
        Courses Completed<br>
        <span>{{ $completedCourses }} / {{ $totalCourses }}</span>
    </div>
    <div class="progress-bar-container">
        <div class="progress-bar">
            <span style="width: {{ ($completedCourses / $totalCourses) * 100 }}%;"></span>
        </div>
    </div>
</div>

<!-- Course Sections -->
<div class="course-container">
    <!-- Remaining Mandatory Courses -->
    <div class="course-section">
        <h3>Remaining Mandatory Course</h3>
        <table>
            <thead>
                <tr>
                    <th>Course Code</th>
                    <th>Course Name</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($remainingMandatoryCourses as $course)
                    <tr>
                        <td>{{ $course->code }}</td>
                        <td>{{ $course->name }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="2">No remaining mandatory courses.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <!-- Recommended Elective Courses -->
    <div class="course-section">
        <h3>Recommended Elective Course</h3>
        <table>
            <thead>
                <tr>
                    <th>Course Code</th>
                    <th>Course Name</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($recommendedElectives as $course)
                    <tr>
                        <td>{{ $course->code }}</td>
                        <td>{{ $course->name }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="2">No recommended elective courses available.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

</div>

</body>
</html>
