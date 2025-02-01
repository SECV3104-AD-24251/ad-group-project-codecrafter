<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Smart Course Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', Arial, sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden; 
        }

        .container {
            display: flex;
            height: 100vh;
            width: 100vw; 
        }

        .left-section {
            flex: 1;
            background: linear-gradient(135deg, #260000, #5a0000);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
        }

        .left-section h1 {
            font-size: 3rem;
            font-weight: 600;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        .left-section p {
            max-width: 400px;
            font-size: 1.1rem;
            line-height: 1.8;
        }

        .right-section {
            flex: 1;
            background: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .right-section h2 {
            margin-bottom: 30px;
            font-size: 2rem;
            font-weight: 600;
            color: #5a0000;
        }

        .form-select {
            border-radius: 25px;
            padding: 10px 45px 10px 25px; 
            margin-bottom: 20px;
            border: 1px solid #ccc;
            font-size: 1.2rem; 
            width: 100%; 
            max-width: 400px; 
            text-align: center;
            appearance: none; 
            background: #fff url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>') no-repeat right 20px center;
            background-size: 20px 20px;
        }

        .form-select:focus {
            border-color: #5a0000; 
            outline: none;
            box-shadow: 0 4px 12px rgba(90, 0, 0, 0.3); 
        }


        .btn-primary {
            background-color: #5a0000;
            border: none;
            border-radius: 30px;
            padding: 12px 50px;
            font-size: 1rem;
            font-weight: 500;
            color: white;
            transition: background-color 0.3s, transform 0.2s;
            box-shadow: 0 5px 15px rgba(90, 0, 0, 0.2);
            width: 100%;
            max-width: 400px; 
        }

        .btn-primary:hover {
            background-color: #330000;
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(90, 0, 0, 0.3);
        }

        .btn-primary:focus {
            outline: none;
            box-shadow: 0 4px 12px rgba(90, 0, 0, 0.4);
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left Section -->
        <div class="left-section">
            <h1>SMART COURSE REGISTRATION</h1>
            <p>Your one-stop solution for smart course registration and beyond.</p>
        </div>

        <!-- Right Section -->
        <div class="right-section">
            <h2>Select Your Role</h2>
            <form action="{{ route('login') }}" method="GET">
                @csrf
                <select name="role" class="form-select" required>
                    <option value="" disabled selected>Select Your Role</option>
                    <option value="student">Student</option>
                    <option value="academic_staff">Academic Staff</option>
                </select>
                <button type="submit" class="btn-primary">Proceed</button>
            </form>
        </div>
    </div>
</body>
</html>
