<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
            color: #333;
            text-align: center;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        h1 {
            color: maroon;
        }

        label {
            font-weight: bold;
        }

        input, button, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background-color: maroon;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #9d1c4d;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Edit Profile</h1>
    <form action="{{ route('profile.update') }}" method="POST">
        @csrf
        <label>Name:</label>
        <input type="text" name="name" value="{{ auth()->user()->name }}" required>

        <label>Email:</label>
        <input type="email" name="email" value="{{ auth()->user()->email }}" required>

        <label>Program:</label>
        <input type="text" name="program" value="{{ auth()->user()->program }}" required>

        <label>Current Semester:</label>
        <select name="current_sem" required>
            @php
                $semesters = [
                    'Year 1 [Semester 1]', 'Year 1 [Semester 2]',
                    'Year 2 [Semester 1]', 'Year 2 [Semester 2]',
                    'Year 3 [Semester 1]', 'Year 3 [Semester 2]'
                ];
            @endphp
            @foreach ($semesters as $semester)
                <option value="{{ $semester }}" {{ auth()->user()->current_sem == $semester ? 'selected' : '' }}>
                    {{ $semester }}
                </option>
            @endforeach
        </select>


        <button type="submit">Update Profile</button>
    </form>

    <a href="{{ route('student.dashboard') }}">
        <button style="background-color: gray;">Back to Dashboard</button>
    </a>
</div>

</body>
</html>
