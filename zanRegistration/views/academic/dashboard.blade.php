<!-- academic/dashboard.blade.php -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academic Staff Dashboard - Smart Course Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 0 auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #007BFF;
            color: white;
            padding: 20px;
            border-radius: 10px 10px 0 0;
        }

        .header h1 {
            margin: 0;
        }

        .nav {
            background-color: #fff;
            padding: 10px;
            display: flex;
            gap: 20px;
            border-bottom: 2px solid #007BFF;
        }

        .nav a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .nav a.active, .nav a:hover {
            background-color: #007BFF;
            color: white;
        }

        .section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .messages {
            max-height: 300px;
            overflow-y: auto;
            margin-bottom: 20px;
        }

        .message {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }

        .message.student {
            border-left: 5px solid #007BFF;
        }

        .message.staff {
            border-left: 5px solid #28a745;
        }

        textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            resize: none;
        }

        button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Header -->
    <div class="header">
        <h1>Smart Course Registration</h1>
        <div class="dropdown">
            <button class="dropdown-button">Profile</button>
            <div class="dropdown-menu">
                <a href="#">View Profile</a>
                <a href="#">Settings</a>
                <a href="#">Logout</a>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <div class="nav">
        <a href="#" class="active">Dashboard</a>
        <a href="#">Course Approvals</a>
        <a href="#">Advisory Overview</a>
        <a href="#">Analytics</a>
    </div>

    <!-- Messages Section -->
    <div class="section">
        <h2>Messages</h2>
        div class="messages">
        @forelse ($messages as $message)
            <div class="message {{ $message->sender_role === 'student' ? 'student' : 'staff' }}">
                <strong>{{ $message->sender_role === 'student' ? 'Student' : 'Staff' }}:</strong>
                <p>{{ $message->content }}</p>
                <small>{{ $message->created_at->format('Y-m-d H:i') }}</small>
            </div>
        @empty
            <p>No messages to display.</p>
        @endforelse
    </div>

        <!-- Reply Form -->
        <form action="{{ route('academic.chat.reply') }}" method="POST">
            @csrf
            <textarea name="message" placeholder="Write your reply..."></textarea>
            <input type="hidden" name="student_id" value="{{ $studentId }}">
            <button type="submit">Send Reply</button>
        </form>
    </div>

    <div class="students">
        <h2>Student List</h2>
        <ul>
            @foreach ($students as $student)
                <li>
                    {{ $student->name }}
                    <a href="{{ route('academic.chat', ['student_id' => $student->id]) }}">Chat</a>
                </li>
            @endforeach
        </ul>
    </div>
</div>
</body>
</html>
