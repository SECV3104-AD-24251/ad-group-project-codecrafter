<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Degree Progress - Smart Course Registration</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: maroon;
            text-align: center;
            margin-bottom: 30px;
        }
        .progress-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            animation: fadeIn 0.5s ease-in-out;
        }
        .progress-bar {
            width: 100%;
            background-color: #e9ecef;
            border-radius: 8px;
            height: 30px;
            position: relative;
            overflow: hidden;
        }
        .progress-bar span {
            display: block;
            height: 100%;
            background: linear-gradient(90deg, #28a745, #20c997);
            border-radius: 8px;
            text-align: center;
            line-height: 30px;
            color: white;
            font-weight: bold;
            transition: width 0.4s ease;
        }
        .section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            animation: fadeIn 0.5s ease-in-out;
        }
        .section h2 {
            color: maroon;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .elective-list,
        .mandatory-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .elective-list li,
        .mandatory-list li {
            background-color: #f8f9fa;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        }
        .elective-list li:hover,
        .mandatory-list li:hover {
            background-color: #e9ecef;
        }
        button {
            display: block;
            background-color: maroon;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            margin: 20px auto 0;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #5a0d0d;
        }
        .error-message {
            color: red;
            background-color: #ffe6e6;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(255, 0, 0, 0.2);
            text-align: center;
            margin-bottom: 20px;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Degree Progress</h1>

    <!-- Handle error messages -->
    @if(session('errors'))
        <div class="error-message">
            <strong>Error:</strong> {{ session('errors')->first() }}
        </div>
    @endif

    <!-- Progress Bar -->
    <div class="progress-container">
        <h2>Course Progress</h2>
        @if (isset($totalCourses) && $totalCourses > 0)
            <div class="progress-bar">
                <span style="width: {{ $completionRate }}%;">
                    {{ $completedCourses->count() }} / {{ $totalCourses }} Courses Completed
                </span>
            </div>
        @else
            <p>No courses found in your degree plan.</p>
        @endif
    </div>

    <!-- Remaining Mandatory Courses -->
    <div class="section">
        <h2>Remaining Mandatory Courses</h2>
        @if (isset($degreePlan) && $degreePlan->getPendingMandatoryCourses($completedCourses)->count() > 0)
            <ul class="mandatory-list">
                @foreach ($degreePlan->getPendingMandatoryCourses($completedCourses) as $course)
                    <li>{{ $course->name }}</li>
                @endforeach
            </ul>
        @else
            <p>All mandatory courses have been completed or no degree plan is available.</p>
        @endif
    </div>

    <!-- Suggested Electives -->
    <div class="section">
        <h2>Suggested Electives</h2>
        @if (isset($suggestedElectives) && $suggestedElectives->count() > 0)
            <ul class="elective-list">
                @foreach ($suggestedElectives as $elective)
                    <li>{{ $elective->name }}</li>
                @endforeach
            </ul>
        @else
            <p>No elective suggestions available at this time.</p>
        @endif
    </div>

    <button onclick="window.history.back();">Back to Dashboard</button>
</div>

</body>
</html>
