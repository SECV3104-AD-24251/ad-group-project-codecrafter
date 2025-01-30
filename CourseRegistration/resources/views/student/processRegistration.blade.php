<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 50px auto;
            text-align: center;
        }

        .message {
            background-color: #d4edda;
            color: #155724;
            padding: 20px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Sections for Course ID: {{ $course_id }}</h2>

        <table>
            <tr>
                <th>Section No.</th>
                <th>Lecturer Name</th>
                <th>Available Seats</th>
                <th>Action</th>
            </tr>

            @foreach ($sections as $section)
                <tr>
                    <td>{{ $section->section }}</td>
                    <td>{{ $section->lect_assigned }}</td>
                    <td>{{ $section->capacity }}</td>
                    <td>
                        <form method="POST" action="{{ route('processRegistration.enroll') }}">
                            @csrf
                            <input type="hidden" name="section_id" value="{{ $section->id }}">
                            <input type="hidden" name="course_id" value="{{ $course_id }}">
                            <button type="submit">
                                @if ($section->user_id === Auth::id()) Unenroll Me @else Enroll Me @endif
                            </button>
                        </form>

                    </td>
                </tr>
            @endforeach
        </table>
        <a href="{{ route('student.courses.registered') }}">Go to Registered Courses</a>
    </div>
</body>
<td>{{ $section->id }}</td>


</html>
