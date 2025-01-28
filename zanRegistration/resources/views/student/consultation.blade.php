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
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #007BFF;
        }

        .advisor-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .advisor-card h3 {
            margin: 0 0 5px;
        }

        .advisor-card p {
            margin: 5px 0;
            color: #555;
        }

        .advisor-card button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .advisor-card button:hover {
            background-color: #0056b3;
        }

        .no-advisors {
            text-align: center;
            margin-top: 20px;
            color: #888;
        }
    </style>
</head>

<body>
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