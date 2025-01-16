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
        /* Global Styling */
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

        /* Header Styling */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: maroon;
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
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
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        /* Navigation Styling */
        .nav {
            display: flex;
            justify-content: center;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .nav a {
            padding: 15px 20px;
            text-decoration: none;
            color: maroon;
            font-weight: bold;
            font-size: 16px;
            border-right: 1px solid #ddd;
            display: flex;
            align-items: center;
        }

        .nav a:last-child {
            border-right: none;
        }

        .nav a i {
            margin-right: 10px;
        }

        .nav a.active {
            color: maroon;
            border-radius: 10px 10px 0 0;
        }

        .nav a:hover {
            background-color: maroon;
            color: white;
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
        }

        .section h2 {
            margin-top: 0;
            font-size: 20px;
            color: maroon;
        }

        .section p {
            color: #6c757d;
            margin: 10px 0;
        }

        .section button {
            background-color: maroon;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .section button:hover {
            background-color: #9d1c4d;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Header -->
    <div class="header">
        <div>
            <h1>Welcome, {{ Auth::user()->name }}</h1>
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

    <!-- Navigation Bar -->
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
        <div class="section">
            <h2>Advisory Overview</h2>
            <p>View and manage advisory consultations with students.</p>
                <button>Go to Advisory</button>
        </div>
        <div class="section">
            <h2>Analytics</h2>
            <p>Access detailed insights and analytics on course registrations.</p>
                <button>View Analytics</button>
        </div>
    </div>
</div>

</body>
</html>
