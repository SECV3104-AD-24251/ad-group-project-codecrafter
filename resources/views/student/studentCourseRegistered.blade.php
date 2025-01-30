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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: maroon;
            color: white;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        a {
            text-decoration: none;
            color: maroon;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .message {
            text-align: center;
            padding: 10px;
            color: green;
            font-size: 16px;
        }

        .back-button {
            display: inline-block;
            background-color: maroon;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
            text-align: center;
        }

        .back-button:hover {
            background-color: maroon;
        }

        /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 500px;
        text-align: center;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .close-button {
        float: right;
        font-size: 20px;
        font-weight: bold;
        color: #aaa;
        cursor: pointer;
    }

    .close-button:hover,
    .close-button:focus {
        color: #000;
        text-decoration: none;
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
        @if (session('success'))
            <p class="message">{{ session('success') }}</p>
        @elseif (session('error'))
            <p class="message" style="color: red;">{{ session('error') }}</p>
        @endif

        @if ($registeredSections->isEmpty())
    <div id="popupModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
            <h3>Registration Required</h3>
            <p>You have not registered for any courses yet. Please register for courses.</p>
            <a href="{{ route('student.courses.register') }}" class="back-button">Go to Course Registration</a>
        </div>
    </div>

    <script>
        // Show the modal when the page loads
        window.onload = function () {
            document.getElementById('popupModal').style.display = 'block';
        };

        // Close the modal
        function closeModal() {
            document.getElementById('popupModal').style.display = 'none';
        }
    </script>
@endif
    
            <table>
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>Lecturer</th>
                        <th>Capacity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($registeredSections as $section)
                        <tr>
                            <td>{{ $section->course->course_code }}</td>
                            <td>{{ $section->course->course_name }}</td>
                            <td>{{ $section->section }}</td>
                            <td>{{ $section->lect_assigned }}</td>
                            <td>{{ $section->capacity }}</td>
                            <td>
                                <!-- Unenroll Form -->
                                <form method="POST" action="{{ route('processRegistration.enroll') }}">
                                    @csrf
                                    <input type="hidden" name="section_id" value="{{ $section->id }}">
                                    <input type="hidden" name="course_id" value="{{ $section->course_id }}">
                                    <button type="submit">Unenroll Me</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        

        <br>
        <!-- Back Button -->
        <a href="{{ route('student.courses.register') }}" class="back-button" style="margin-top: 10px;">Go Back to Course Registration</a>
    </div>
</body>

</html>
