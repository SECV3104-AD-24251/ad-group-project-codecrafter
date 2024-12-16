<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Registration</title>
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
            margin: 50px auto;
            text-align: center;
        }

        .message {
            background-color: #d4edda;
            color: #155724;
            padding: 20px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">
            Registration successful! You can now view your registered courses.
        </div>
        <a href="{{ route('student.courses.registered') }}">Go to Registered Courses</a>
    </div>
</body>
</html>
