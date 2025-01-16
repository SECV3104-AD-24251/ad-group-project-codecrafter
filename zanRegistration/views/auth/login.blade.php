<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Smart Course Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            background-color: #8b3a4a; /* Matching header color */
            color: white;
            padding: 15px 0;
            text-align: center;
        }
        .card {
            margin-top: 50px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .role-btn {
            background-color: #8b3a4a; /* Matching button color */
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 0;
            font-size: 1.1rem;
            font-weight: bold;
            width: 150px;
        }
        .role-btn:hover {
            background-color: #702f3b;
            color: white;
        }
        .error-list {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .error-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .error-list li {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <div class="header">
        <h1>Smart Course Registration</h1>
    </div>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="card text-center p-5">
            <h2 class="fw-bold mb-4">Login to Smart Course Registration</h2>

            <!-- Display errors if any -->
            @if ($errors->any())
                <div class="error-list">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <!-- Login Form -->
            <form action="{{ route('login') }}" method="POST">
                @csrf
                <div class="mb-4">
                    <label for="email" class="form-label">Email Address:</label>
                    <input type="email" name="email" id="email" class="form-control" required>
                </div>
                <div class="mb-4">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                </div>
                <button type="submit" class="role-btn">Login</button>
            </form>

        </div>
    </div>

</body>
</html>
