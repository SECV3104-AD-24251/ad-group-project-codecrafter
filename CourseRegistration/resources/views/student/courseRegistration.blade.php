<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 30px auto;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
            color: #007BFF;
        }

        .course-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .course-item {
            background-color: #e1e5ec;
            padding: 15px 20px;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .course-item:hover {
            background-color: #007BFF;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="header">Course Registration</h1>
        <div class="course-list">
            @foreach ($subjects as $subject)
                <a href="{{ route('processRegistration.show', $subject->id) }}" class="course-item">
                    <span>{{ $subject->subject_code }} - {{ $subject->subject_name }}</span>
                    <span>Credit: {{ $subject->credit_hours }}</span>
                </a>
            @endforeach
        </div>
    </div>
</body>
</html>
