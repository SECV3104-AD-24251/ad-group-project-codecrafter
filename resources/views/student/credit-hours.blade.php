<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credit Hours</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9fafb;
            text-align: center;
            padding: 20px;
            color: #333;
        }
        .card {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: inline-block;
            margin-top: 50px;
        }
        .card h1 {
            color: maroon;
            font-size: 24px;
        }
        .card p {
            font-size: 18px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Maximum Credit Hours</h1>
        <p>You can register up to <strong>{{ $maxCreditsPerSemester }}</strong> credit hours per semester.</p>
        <p>Currently Registered: <strong>{{ $currentCredits }}</strong> credit hours.</p>
        <a href="{{ route('student.dashboard') }}" style="color: maroon; text-decoration: none;">Back to Dashboard</a>
    </div>
</body>
</html>
