<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Global Styling */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Header Styling */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(45deg, #800000, #9c1c4d);
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
        }

        .header h1 {
            margin: 0;
            font-size: 26px;
            font-weight: 700;
        }

        .header .system-name {
            font-size: 18px;
            font-weight: 400;
            color: #e0e0e0;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-button {
            background-color: white;
            color: maroon;
            border: none;
            padding: 8px 15px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }

        .dropdown-button:hover {
            background-color: #f1f1f1;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            overflow: hidden;
            z-index: 1000;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
        }

        .dropdown-menu a {
            color: maroon;
            padding: 10px 20px;
            display: block;
            text-decoration: none;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        /* Navigation Bar */
        .nav {
            display: flex;
            justify-content: space-around;
            background-color: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .nav a {
            text-decoration: none;
            color: maroon;
            font-size: 16px;
            font-weight: bold;
            display: flex;
            align-items: center;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .nav a:hover, .nav a.active {
            background-color: maroon;
            color: white;
        }

        .nav a i {
            margin-right: 10px;
        }

        /* Progress Bar Styling */
        .progress-container {
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .progress-bar {
            width: 100%;
            background-color: #e9ecef;
            border-radius: 5px;
            height: 30px;
            position: relative;
            overflow: hidden;
        }

        /* Section Styling */
        .sections-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            flex: 1;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .section:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .section h2 {
            margin-top: 0;
            font-size: 22px;
            color: maroon;
        }

        .section p {
            color: #6c757d;
            margin: 10px 0;
        }

        .section button {
            background-color: maroon;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .section button:hover {
            background-color: #9d1c4d;
        }

        /* Notification Styling */
        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #e3f2fd;
            color: #2196f3;
            padding: 15px 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            display: none;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Header -->
    <div class="header">
        <div>
            <h1>Student Dashboard</h1>
            <div class="system-name">Welcome, {{ Auth::user()->name }}</div>
        </div>
        <div class="dropdown">
            <button class="dropdown-button">Profile</button>
            <div class="dropdown-menu">
                <a href="{{ route('profile.edit') }}">View Profile</a>
                <a href="#">Settings</a>
                <a href="#">Logout</a>
            </div>
        </div>
    </div>

    <!-- Navigation Bar -->
    <div class="nav">
        <a href="{{ route('student.dashboard') }}" class="{{ request()->routeIs('student.dashboard') ? 'active' : '' }}">
            <i class="fas fa-home"></i> Dashboard
        </a>
        <a href="{{ route('student.waitlist') }}" class="{{ request()->routeIs('student.waitlist') ? 'active' : '' }}">
            <i class="fas fa-list"></i> Waitlist Management
        </a>
        <a href="{{ route('student.courses.registered') }}" class="{{ request()->routeIs('student.courses.registered') ? 'active' : '' }}">
            <i class="fas fa-book"></i> Course Registered
        </a>
    </div>

    <!-- Progress Bar Section -->
    <div class="progress-container">
        <h2>Degree Progress</h2>
        @if ($maxCredits > 0)
            <a href="{{ route('student.degree.progress') }}" style="text-decoration: none;">
                <div class="progress mb-3" style="height: 30px;">
                    <div class="progress-bar bg-success progress-bar-striped progress-bar-animated"
                        role="progressbar"
                        style="width: {{ $completionRate }}%;"
                        aria-valuenow="{{ $completionRate }}"
                        aria-valuemin="0"
                        aria-valuemax="100">
                        {{ $currentCredits }} / {{ $maxCredits }} Credits
                    </div>
                </div>
            </a>
        @else
            <p class="text-muted">No courses found in your degree plan.</p>
        @endif
    </div>

    <!-- Course Management and Consultation Sections -->
    <div class="sections-container">
        <div class="section">
            <h2>Course Management</h2>
            <p>Manage your course registration through Smart Course Registration.</p>
            <a href="{{ route('student.courses.register') }}">
                <button>Register Now!</button>
            </a>
        </div>
        <div class="section">
            <h2>Need Consultation?</h2>
            <p>Chat with your Academic Staff using Smart Course Registration.</p>
            <a href="{{ route('student.courses.consultation') }}">
                <button>Start Chat</button>
            </a>
        </div>
    </div>

    <!-- Registered Credit Hours Section -->
   <div class="progress-container">
       <h2>Registered Credit Hours</h2>
       <div style="text-align: center; padding: 10px 0; font-size: 18px; font-weight: bold; color: maroon;">
        <a href="{{ route('student.credit.hours') }}" style="color: maroon; text-decoration: none;">
            {{ $currentCredits }} Credit Hours Registered
        </a>
       </div>
    </div>

</div>

@foreach($notifications as $notification)
    <div class="notification" style="display: block; opacity: 1;">
        {{ $notification }}
    </div>
@endforeach

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const notifications = document.querySelectorAll('.notification');
        notifications.forEach(notification => {
            setTimeout(() => {
                notification.style.opacity = '0';
                setTimeout(() => {
                    notification.style.display = 'none';
                }, 300);
            }, 7000);
        });
    });
</script>

</body>
</html>
