<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Global Styling */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Header Styling */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: maroon;
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
            font-weight: 700;
        }

        .header .system-name {
            font-size: 18px;
            font-weight: 400;
            color: #e0e0e0;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-button {
            background-color: white;
            color: maroon;
            border: none;
            padding: 8px 15px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            overflow: hidden;
            z-index: 1000;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
        }

        .dropdown-menu a {
            color: maroon;
            padding: 10px 20px;
            display: block;
            text-decoration: none;
            font-size: 14px;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        /* Navigation Bar */
        .nav {
            display: flex;
            justify-content: space-around;
            background-color: white;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .nav a {
            text-decoration: none;
            color: maroon;
            font-size: 16px;
            font-weight: bold;
            display: flex;
            align-items: center;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .nav a:hover {
            background-color: maroon;
            color: white;
        }

        .nav a.active {
            background-color: maroon;
            color: white;
        }

        .nav a i {
            margin-right: 10px;
        }

        /* Progress Bar Styling */
        .progress-container {
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .progress-bar {
            width: 100%;
            background-color: #e9ecef;
            border-radius: 5px;
            height: 30px;
            position: relative;
            overflow: hidden;
        }

        .progress-bar span {
            display: block;
            height: 100%;
            background-color: #43a047;
            width: <?php echo e((17 / 127) * 100); ?>%;
            border-radius: 5px;
            text-align: center;
            line-height: 30px;
            color: white;
            font-weight: bold;
            transition: width 0.5s ease;
        }

        /* Section Styling */
        .sections-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            flex: 1;
            text-align: center;
        }

        .section h2 {
            margin-top: 0;
            font-size: 20px;
            color: maroon;
        }

        .section p {
            color: #6c757d;
            margin: 10px 0;
        }

        .section button {
            background-color: maroon;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .section button:hover {
            background-color: #9d1c4d;
        }

        /* Notification Styling */
        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #e3f2fd;
            color: #2196f3;
            padding: 15px 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            display: none;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Header -->
    <div class="header">
        <div>
            <h1>Welcome, <?php echo e(Auth::user()->name); ?></h1>
            <div class="system-name">Smart Course Registration</div>
        </div>
        <div class="dropdown">
            <button class="dropdown-button">Profile</button>
            <div class="dropdown-menu">
                <a href="<?php echo e(route('profile.edit')); ?>">View Profile</a>
                <a href="#">Settings</a>
                <a href="<?php echo e(route('logout')); ?>">Logout</a>
            </div>
        </div>
    </div>

    <!-- Navigation Bar -->
    <div class="nav">
        <a href="<?php echo e(route('student.dashboard')); ?>" class="<?php echo e(request()->routeIs('student.dashboard') ? 'active' : ''); ?>">
            <i class="fas fa-home"></i> Dashboard
        </a>
        <a href="<?php echo e(route('student.waitlist')); ?>" class="<?php echo e(request()->routeIs('student.waitlist') ? 'active' : ''); ?>">
            <i class="fas fa-list"></i> Waitlist Management
        </a>
        <a href="<?php echo e(route('student.courses.registered')); ?>" class="<?php echo e(request()->routeIs('student.courses.registered') ? 'active' : ''); ?>">
            <i class="fas fa-book"></i> Course Registered
        </a>
    </div>

    <!-- Progress Bar Section -->
    <div class="progress-container">
        <h2>Degree Progress</h2>
        <div class="progress-bar">
            <a href="<?php echo e(route('student.degree.progress')); ?>" style="text-decoration: none;">
                <span style="display: inline-block; background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; width: <?php echo e((17 / 127) * 100); ?>%;">
                    <?php echo e(17); ?> / 127 Credits
                </span>
            </a>
        </div>
    </div>

    <!-- Course Management and Consultation Sections -->
    <div class="sections-container">
        <div class="section">
            <h2>Course Management</h2>
            <p>Manage your course registration through Smart Course Registration.</p>
            <a href="<?php echo e(route('student.courses.register')); ?>">
                <button>Register Now!</button>
            </a>
        </div>
        <div class="section">
            <h2>Need Consultation?</h2>
            <p>Chat with your Academic Staff using Smart Course Registration.</p>
            <a href="<?php echo e(route('student.chat')); ?>">
                <button>Start Chat</button>
            </a>
        </div>
    </div>

    <!-- Registered Credit Hours Section -->
   <div class="progress-container">
       <h2>Registered Credit Hours</h2>
       <div style="text-align: center; padding: 10px 0; font-size: 18px; font-weight: bold; color: maroon;">
        <a href="<?php echo e(route('student.credit.hours')); ?>" style="color: maroon; text-decoration: none;">
            <?php echo e($currentCredits); ?> Credit Hours Registered
        </a>
       </div>
    </div>

</div>

<?php $__currentLoopData = $notifications; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $notification): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <div class="notification">
        <?php echo e($notification); ?>

    </div>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const notifications = document.querySelectorAll('.notification');
        notifications.forEach(notification => {
            notification.style.display = 'block';
            setTimeout(() => {
                notification.style.display = 'none';
            }, 5000);
        });
    });
</script>

</body>
</html>
<?php /**PATH C:\xampp\Laravel\StudentReg - ZF\resources\views/student/dashboard.blade.php ENDPATH**/ ?>