<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waitlist Management - Smart Course Registration</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            color: #007BFF;
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
            background-color: #007BFF;
            color: white;
        }

        .badge {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            color: white;
        }

        .badge-primary {
            background-color: #007BFF;
        }

        .badge-success {
            background-color: #28a745;
        }

        button {
            background-color: #dc3545;
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
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Waitlist Management</h1>

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
                    <td>{{ $waitlist->courseSection->course->subject_name }}</td>
                    <td>{{ $waitlist->courseSection->section }}</td>
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
            <form action="{{ route('student.waitlist.join') }}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="course_section_id">Select Course Section:</label>
                    <select name="course_section_id" id="course_section_id" class="form-control">
                        @forelse ($availableSections as $section)
                            <option value="{{ $section->id }}">
                                {{ $section->course->subject_name }} (Section {{ $section->section }})
                            </option>
                        @empty
                            <option disabled>No available sections</option>
                        @endforelse
                    </select>
                </div>
                <button class="btn-primary">Join Waitlist</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
