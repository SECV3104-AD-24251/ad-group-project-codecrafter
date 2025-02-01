<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Degree Progress - Smart Course Registration</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 900px;
            margin-top: 40px;
        }
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .progress-bar {
            animation: progressAnimation 1s ease-in-out;
        }
        @keyframes progressAnimation {
            from { width: 0; }
            to { width: {{ $completionRate }}%; }
        }
        .list-group-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: background-color 0.3s;
        }
        .list-group-item:hover {
            background-color: #e9ecef;
        }
        .error-message {
            color: red;
            background-color: #ffe6e6;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 20px;
        }
        button {
            display: block;
            background-color: #6f42c1;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            margin-top: 30px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #5a0d9e;
        }

        /* Back Button fixed to top-left */
        .back-button {
            position: fixed;
            top: 15px;
            left: 15px;
            background-color: maroon;
            color: white;
            padding: 10px 15px;
            border-radius: 50%;
            font-size: 20px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: rgb(165, 22, 22);
        }
    </style>
</head>
<body>

<!-- Back Button -->
<button class="back-button" onclick="window.history.back();">
    <i class="bi bi-arrow-left-circle"></i>
</button>

<div class="container">
    <h1 class="text-center text-danger mb-4">
        <i class="bi bi-bar-chart-line-fill"></i> Degree Progress
    </h1>

    @if(session('errors'))
        <div class="alert alert-danger text-center">
            <i class="bi bi-exclamation-circle-fill"></i> <strong>Error:</strong> {{ session('errors')->first() }}
        </div>
    @endif

    <!-- Progress Bar -->
    <div class="card p-4 mb-4">
        <h4 class="mb-3 text-success"><i class="bi bi-graph-up"></i> Course Progress</h4>
        @if ($totalCourses > 0)
            <div class="progress mb-3" style="height: 30px;">
                <div class="progress-bar bg-success progress-bar-striped progress-bar-animated"
                     style="width: {{ $completionRate }}%;">
                    {{ count($registeredCourseIds) }} / {{ $totalCourses }} Courses Completed
                </div>
            </div>
        @else
            <p class="text-muted">No courses found in your degree plan.</p>
        @endif
    </div>

    <!-- Current Semester Courses -->
    <div class="card p-4 mb-4">
        <h4 class="mb-3 text-primary"><i class="bi bi-book"></i> Current Semester Courses</h4>
        @if ($mandatoryCourses->isEmpty() && $electiveCourses->isEmpty())
            <p class="text-muted">All courses have been registered.</p>
        @else
            <ul class="list-group">
                @foreach ($mandatoryCourses as $course)
                    <li class="list-group-item">
                        <span><i class="bi bi-check-circle-fill text-success"></i> {{ $course->course_name }} (Mandatory)</span>
                    </li>
                @endforeach
                @foreach ($electiveCourses as $course)
                    <li class="list-group-item">
                        <span><i class="bi bi-check-circle-fill text-warning"></i> {{ $course->course_name }} (Elective)</span>
                    </li>
                @endforeach
            </ul>
        @endif
    </div>

    <!-- Remaining Mandatory Courses -->
    <div class="card p-4 mb-4">
        <h4 class="mb-3 text-danger"><i class="bi bi-exclamation-triangle-fill"></i> Remaining Mandatory Courses</h4>
        @if (count($registeredCourseIds) < $totalCourses)
            <ul class="list-group">
                @foreach ($mandatoryCourses as $course)
                    @if (!in_array($course->id, $registeredCourseIds))
                        <li class="list-group-item">
                            <span><i class="bi bi-x-circle-fill text-danger"></i> {{ $course->course_name }} ({{ $course->course_code }})</span>
                        </li>
                    @endif
                @endforeach
            </ul>
        @endif
    </div>

    <!-- Suggested Electives -->
    <div class="card p-4 mb-4">
        <h2>Suggested Electives</h2>
        @if ($suggestedElectives->count() > 0)
            <ul class="list-group">
                @foreach ($suggestedElectives as $elective)
                    <li class="list-group-item">
                        <span><i class="bi bi-lightbulb"></i> {{ $elective->course_name }} ({{ $elective->course_code }})</span>
                    </li>
                @endforeach
            </ul>
        @else
            <p>No elective suggestions available at this time.</p>
        @endif
    </div>

</div>

</body>
</html>
