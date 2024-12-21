<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Courses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            background-color: #007BFF;
            color: white;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        a {
            text-decoration: none;
            color: #007BFF;
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
    </style>
</head>

<body>
    <div class="container">
        <h2>Your Registered Courses</h2>

        @if (session('success'))
            <p class="message">{{ session('success') }}</p>
        @elseif (session('error'))
            <p class="message" style="color: red;">{{ session('error') }}</p>
        @endif

        @if ($registeredSections->isEmpty())
            <p>You have not registered for any courses yet.</p>
        @else
            <table>
                <thead>
                    <tr>
        
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
                    
                            <td>{{ $section->courses->subject_name }}</td>
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
        @endif

        <br>
        <a href="{{ route('student.courses.register') }}">Go Back to Course Registration</a>
    </div>
</body>

</html>
