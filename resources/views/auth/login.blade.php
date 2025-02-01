<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Smart Course Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Poppins', Arial, sans-serif;
        }

        .header {
            background-color: #5a0000; 
            color: white;
            padding: 45px;
            text-align: center;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background-color: white;
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .card h2 {
            color: #5a0000;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 500;
            font-size: 1rem;
            margin-bottom: 5px;
            text-align: left;
            display: block;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px 15px;
            font-size: 1rem;
            border: 1px solid #ddd;
            transition: box-shadow 0.3s, border-color 0.3s;
        }

        .form-control:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(139, 58, 74, 0.2);
            border-color: #5a0000;
        }

        .role-btn {
            background-color: #5a0000; /* Deep burgundy */
            color: white;
            border: none;
            border-radius: 25px;
            padding: 12px 50px;
            font-size: 1rem;
            font-weight: 600;
            transition: background-color 0.3s, transform 0.2s;
            width: 100%;
            max-width: 200px;
            margin-top: 20px;
        }

        .role-btn:hover {
            background-color: #702f3b;
            transform: scale(1.05);
        }

        .error-list {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: left;
        }

        .error-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .error-list li {
            margin-bottom: 5px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .card {
                padding: 20px;
            }

            .role-btn {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <div class="header">
        Smart Course Registration
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="card">
            <h2>Login to Your Account</h2>

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
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="role-btn">Login</button>
            </form>
        </div>
    </div>
</body>
</html>
