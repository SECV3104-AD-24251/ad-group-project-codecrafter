<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Course Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 30px;
            color: #88183093;
        }

        .course-details {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .course-details span {
            display: block;
            margin-bottom: 10px;
        }

        .course-details .credit {
            font-weight: bold;
            color: #88183093;
        }

        .btn-register {
            background-color: #88183093;
            color: white;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 14px;
            text-align: center;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-register:hover {
            background-color: #88183093;
        }

        .back-btn {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <div class="container">
        <!-- Back Button -->
        <div class="back-btn">
            <a href="{{ route('student.courses') }}" class="btn btn-secondary">Back to Course List</a>
        </div>

        <div class="header">
            <h1>Confirm Your Course Registration</h1>
        </div>

        <!-- Course Details -->
        <div class="course-details">
            <span><strong>Course Code:</strong> {{ $course->code }}</span>
            <span><strong>Course Name:</strong> {{ $course->name }}</span>
            <span><strong>Credits:</strong> {{ $course->credit }}</span>
            <span><strong>Semester:</strong> {{ $course->semester }}</span>
        </div>

        <!-- Confirmation Form -->
        <form method="POST" action="{{ route('student.courses.register', $course->id) }}">
            @csrf
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="confirmation" id="confirmation" required>
                <label class="form-check-label" for="confirmation">I confirm that I want to register for this course.</label>
            </div>
            <button type="submit" class="btn-register mt-3">Confirm Registration</button>
        </form>
    </div>
</body>

</html>
