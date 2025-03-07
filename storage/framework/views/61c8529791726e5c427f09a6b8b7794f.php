<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Registration</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 5px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border-color: #c3e6cb;
        }

        .alert-error {
            background-color: #f8d7da;
            color: maroon;
            border-color: #f5c6cb;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table thead {
            background-color: maroon;
            color: white;
        }

        table th,
        table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        button {
            background-color: maroon;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: maroon;
        }

        button.unenroll {
            background-color: #dc3545;
        }

        button.unenroll:hover {
            background-color: #a71d2a;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: maroon;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

         /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fff;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 500px;
        text-align: center;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .close-button {
        float: right;
        font-size: 20px;
        font-weight: bold;
        color: #aaa;
        cursor: pointer;
    }

    .close-button:hover,
    .close-button:focus {
        color: #000;
        text-decoration: none;
    }
    </style>

    </style>
</head>

<body>
    <div class="container">
        <!-- Laravel Session Messages -->
        <?php if(session('error')): ?>
    <div id="errorModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeErrorModal()">&times;</span>
            <p><?php echo e(session('error')); ?></p>
        </div>
    </div>

    <script>
        // Show the error modal
        window.onload = function () {
            document.getElementById('errorModal').style.display = 'block';
        };

        // Close the error modal
        function closeErrorModal() {
            document.getElementById('errorModal').style.display = 'none';
        }
    </script>
        <?php endif; ?>

        <h2>Sections for Course ID: <?php echo e($course_id); ?></h2>

        <!-- Table for Sections -->
        <table>
            <thead>
                <tr>
                    <th>Section No.</th>
                    <th>Lecturer Name</th>
                    <th>Available Seats</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php $__empty_1 = true; $__currentLoopData = $sections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr>
                        <td><?php echo e($section->section); ?></td>
                        <td><?php echo e($section->lect_assigned); ?></td>
                        <td><?php echo e($section->capacity); ?></td>
                        <td>
                            <form method="POST" action="<?php echo e(route('processRegistration.enroll')); ?>">
                                <?php echo csrf_field(); ?>
                                <input type="hidden" name="section_id" value="<?php echo e($section->id); ?>">
                                <input type="hidden" name="course_id" value="<?php echo e($course_id); ?>">
                                <button type="submit" class="<?php echo e($section->user_id === Auth::id() ? 'unenroll' : ''); ?>">
                                    <?php if($section->user_id === Auth::id()): ?>
                                        Unenroll Me
                                    <?php else: ?>
                                        Enroll Me
                                    <?php endif; ?>
                                </button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="4">No sections available for this course.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>

        <script>
            function checkConflict(courseId) {
                axios.post('/check-conflict', { course_id: courseId })
                    .then(response => {
                        if (response.data.status === 'conflict') {
                            alert(response.data.message); // Show conflict message
                        } else {
                            alert(response.data.message); // Success message
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('An error occurred while checking for conflicts.');
                    });
            }
        </script>


        <!-- Link to Registered Courses -->
        <a href="<?php echo e(route('student.courses.registered')); ?>">Go to Registered Courses</a>
    </div>
</body>

</html>
<?php /**PATH C:\xampp\Laravel\StudentReg - ZF\resources\views/student/processRegistration.blade.php ENDPATH**/ ?>