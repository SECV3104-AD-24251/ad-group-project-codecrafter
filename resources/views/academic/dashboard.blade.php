<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academic Staff Dashboard</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: maroon;
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .header h1 {
            margin: 0;
            font-size: 22px;
            font-weight: 700;
        }

        .header .system-name {
            font-size: 16px;
            color: #e0e0e0;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-button {
            background-color: white;
            color: maroon;
            border: none;
            padding: 8px 12px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            z-index: 1000;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
        }

        .dropdown-menu a {
            color: maroon;
            padding: 10px 15px;
            display: block;
            text-decoration: none;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        .nav {
            display: flex;
            justify-content: center;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .nav a {
            padding: 12px 18px;
            text-decoration: none;
            color: maroon;
            font-weight: bold;
            border-right: 1px solid #ddd;
        }

        .nav a:last-child {
            border-right: none;
        }

        .nav a:hover, .nav a.active {
            background-color: maroon;
            color: white;
        }

        .sections-container {
            margin-bottom: 20px;
        }

        .section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            text-align: center;
        }

        .section h2 {
            color: maroon;
            margin-top: 0;
        }

        .section button {
            background-color: maroon;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .section button:hover {
            background-color: #9d1c4d;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: left;
        }

        table thead th {
            background-color: maroon;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        table button {
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-success {
            background-color: green;
            color: white;
        }

        .btn-danger {
            background-color: red;
            color: white;
        }

        .btn-success:hover {
            background-color: darkgreen;
        }

        .btn-danger:hover {
            background-color: darkred;
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
            }

            .nav {
                flex-wrap: wrap;
                text-align: center;
            }

            .nav a {
                border-bottom: 1px solid #ddd;
                border-right: none;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Header -->
    <div class="header">
        <div>
            <h1>CodeCrafter</h1>
            <div class="system-name">Smart Course Registration</div>
        </div>
        <div class="dropdown">
            <button class="dropdown-button">Profile</button>
            <div class="dropdown-menu">
                <a href="#">View Profile</a>
                <a href="#">Settings</a>
                <a href="#">Logout</a>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <div class="nav">
        <a href="{{ route('academic.dashboard') }}" class="{{ request()->routeIs('academic.dashboard') ? 'active' : '' }}">
            <i class="fas fa-home"></i> Dashboard
        </a>
        <a href="{{ route('academic.course.approvals') }}" class="{{ request()->routeIs('academic.course.approvals') ? 'active' : '' }}">
            <i class="fas fa-check"></i> Course Approvals
        </a>
    </div>

    <!-- Sections -->
    <div class="sections-container">
        <div class="section">
            <h2>Course Approvals</h2>
            <p>Review and approve pending course registrations for students.</p>
            <a href="{{ route('academic.course.approvals') }}">
                <button>Manage Approvals</button>
            </a>
        </div>

        <!-- Table -->
        <table>
            <thead>
                <tr>
                    <th>Student Name</th>
                    <th>Course</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($requests as $request)
                <tr>
                    <td>{{ $request->student->name }}</td>
                    <td>{{ $request->course->course_name }}</td>
                    <td>{{ ucfirst($request->status) }}</td>
                    <td>
                        <form action="{{ route('academic.waitlist.action') }}" method="POST">
                            @csrf
                            <input type="hidden" name="request_id" value="{{ $request->id }}">
                            <button name="status" value="approved" class="btn btn-success">Approve</button>
                            <button name="status" value="rejected" class="btn btn-danger">Reject</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

</body>

@if(session('notification'))
    <div id="notification-popup" style="
        position: fixed;
        top: 20px;
        right: 20px;
        background-color: #dff0d8;
        color: #3c763d;
        padding: 15px 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        display: none;
    ">
        {{ session('notification') }}
    </div>
@endif

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const notification = document.getElementById('notification-popup');
        if (notification) {
            // Show the notification
            notification.style.display = 'block';

            // Hide after 5 seconds
            setTimeout(() => {
                notification.style.display = 'none';
            }, 5000);
        }
    });
</script>

</html>
