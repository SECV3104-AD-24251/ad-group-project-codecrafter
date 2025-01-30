<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waitlist Management</title>
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
            color:white;
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

        /* Navigation Bar */
        .nav {
            display: flex;
            justify-content: space-around;
            background-color: white;
            padding: 10px;
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
            transition: background-color 0.3s;
        }

        .nav a:hover {
            background-color: maroon;
            color: white;
        }

        .nav a.active {
            background-color: maroon;
            color: white;
        }

        .nav a i {
            margin-right: 10px;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: maroon;
        }
        .alert {
            padding: 10px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: maroon;
            color: white;
        }
        .badge {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            color: white;
        }
        .badge-primary {
            background-color: maroon;
        }
        .badge-success {
            background-color: #28a745;
        }
        button {
            background-color: maroon;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #c82333;
        }
        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .btn-primary {
            background-color: maroon;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: maroon;
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

    <div class="container">
      <div class="container">
    <!-- Display success and error messages -->
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif
    <!-- Waitlist Table -->
    <table>
        <thead>
            <tr>
                <th>Course Name</th>
                <th>Section</th>
                <th>Position</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($waitlists as $waitlist)
                <tr>
                    <td>{{ $waitlist->courseSection->course->course_name }}</td>
                    <td>{{ $waitlist->course->section }}</td>
                    <td>{{ $waitlist->position }}</td>
                    <td>
                        <span class="badge badge-{{ $waitlist->status == 'active' ? 'primary' : 'success' }}">
                            {{ ucfirst($waitlist->status) }}
                        </span>
                    </td>
                    <td>
                        <form action="{{ route('student.waitlist.leave', $waitlist->id) }}" method="POST">
                            @csrf
                            @method('DELETE')
                            <button>Leave</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="5">No waitlist entries found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
    <!-- Join Waitlist Form -->
    <div class="card">
        <div class="card-header">
            <h2>Join a Waitlist</h2>
        </div>
        <div class="card-body">
            <form action="{{ route('waitlist.submit') }}" method="POST">
                @csrf
                <label for="course">Select Course:</label>
                <select name="course_id" id="course" required>
                    <option value="" disabled selected>Select a course</option>
                    @foreach($courses as $course)
                        <option value="{{ $course->id }}">{{ $course->course_name}} ({{$course->section}})</option>
                    @endforeach
                </select>
                <button type="submit">Submit Waitlist Request</button>
            </form>
        </div>
    </div>
</div>
</body>