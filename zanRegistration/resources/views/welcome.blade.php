<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Smart Course Registration</title>
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
            <h2 class="fw-bold mb-4">Welcome to the Smart Course Registration System!</h2>
            <p class="lead mb-4">We are excited to have you here. Please choose your role to proceed:</p>

            <!-- Dropdown and Proceed Button -->
            <div class="d-flex justify-content-center">
                <form action="{{ route('login.redirect') }}" method="GET">
                    @csrf
                    <div class="mb-4">
                        <select name="role" class="form-select text-center" style="width: 250px; margin: auto;" required>
                            <option value="" disabled selected>Select Your Role</option>
                            <option value="student">Student</option>
                            <option value="academic_staff">Academic Staff</option>
                        </select>
                    </div>
                    <button type="submit" class="role-btn">Proceed</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
