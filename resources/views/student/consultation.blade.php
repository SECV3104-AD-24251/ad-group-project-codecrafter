<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            position: relative;
        }

        .container {
            width: 90%;
            max-width: 800px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: maroon;
        }

        .advisor-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        .advisor-card h3 {
            margin: 0 0 5px;
            color: maroon;
        }

        .advisor-card p {
            margin: 5px 0;
            color: #555;
        }

        .advisor-card button {
            background-color: maroon;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.3s;
        }

        .advisor-card button:hover {
            background-color: darkred;
        }

        .no-advisors {
            text-align: center;
            margin-top: 20px;
            color: #888;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            padding: 10px 15px;
            background-color: maroon;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .back-button:hover {
            background-color: darkred;
        }
    </style>
</head>

<body>
    <a href="{{ route('student.dashboard') }}" class="back-button">Back to Dashboard</a>
    <div class="container">
        <h1>Schedule a Consultation</h1>

        @if ($advisors->isEmpty())
            <p class="no-advisors">No advisors available at the moment.</p>
        @else
            @foreach ($advisors as $advisor)
                <div class="advisor-card">
                    <h3>{{ $advisor->name }}</h3>
                    <p>Email: {{ $advisor->email }}</p>
                    <form method="POST" action="{{ route('student.courses.consultation.store') }}">
                        @csrf
                        <input type="hidden" name="advisor_id" value="{{ $advisor->id }}">
                        <button type="submit">Schedule Consultation</button>
                    </form>
                </div>
            @endforeach
        @endif
    </div>
</body>

</html>
