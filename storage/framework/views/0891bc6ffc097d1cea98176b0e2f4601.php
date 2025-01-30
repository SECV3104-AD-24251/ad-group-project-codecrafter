<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
        }

        .dropdown, .filter-section {
            margin-bottom: 20px;
        }

        .dropdown select, .filter-section button {
            padding: 8px;
            font-size: 14px;
        }

        .program-list label {
            margin-right: 10px;
        }

        .course-list a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            background: #e1e5ec;
            text-decoration: none;
            color: #333;
            border-radius: 5px;
        }

        .course-list a:hover {
            background: #007BFF;
            color: white;
        }
    </style>
    <script>
        function toggleAllPrograms(checkbox) {
            const programCheckboxes = document.querySelectorAll('.program-checkbox');
            programCheckboxes.forEach(cb => cb.checked = checkbox.checked);
        }

        function toggleIndividualProgram() {
            const allCheckbox = document.getElementById('allPrograms');
            const programCheckboxes = document.querySelectorAll('.program-checkbox');
            const allChecked = Array.from(programCheckboxes).every(cb => cb.checked);
            allCheckbox.checked = allChecked;
        }

        function applyFilters() {
            const selectedPrograms = Array.from(document.querySelectorAll('.program-checkbox:checked'))
                .map(cb => cb.value)
                .join(',');

            const selectedSemester = document.getElementById('semesterSelect').value;

            const queryParams = new URLSearchParams();
            if (selectedPrograms) queryParams.append('programs', selectedPrograms);
            if (selectedSemester) queryParams.append('semester', selectedSemester);

            window.location.href = '<?php echo e(route("student.courses.register")); ?>?' + queryParams.toString();
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Course Registration</h1>

        <!-- Semester Dropdown -->
        <div class="dropdown">
            <label for="semesterSelect">Select Semester:</label>
            <select id="semesterSelect">
                <option value="">All Semesters</option>
                <?php $__currentLoopData = $semesters; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $semester): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($semester); ?>" <?php if($selectedSemester == $semester): ?> selected <?php endif; ?>>
                        <?php echo e($semester); ?>

                    </option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </div>

        <!-- Program Filters -->
        <div class="filter-section">
            <label>
                <input type="checkbox" id="allPrograms" onchange="toggleAllPrograms(this)" <?php if(in_array('ALL', $selectedPrograms)): ?> checked <?php endif; ?>>
                ALL
            </label>
            <?php $__currentLoopData = $programs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $program): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <label>
                    <input type="checkbox" class="program-checkbox" value="<?php echo e($program); ?>"
                           onchange="toggleIndividualProgram()"
                           <?php if(in_array($program, $selectedPrograms)): ?> checked <?php endif; ?>>
                    <?php echo e($program); ?>

                </label>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <button onclick="applyFilters()">Filter</button>
        </div>

        <!-- Course List -->
        <div class="course-list">
            <?php if($subjects->isEmpty()): ?>
                <p>No courses available for the selected filters.</p>
            <?php else: ?>
                <?php $__currentLoopData = $subjects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subject): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="course-item">
                        <a href="<?php echo e(route('processRegistration.show', $subject->id)); ?>">
                            <?php echo e($subject->subject_code); ?> - <?php echo e($subject->subject_name); ?> (Credit: <?php echo e($subject->credit_hours); ?>)
                        </a>
                        <label>
                            <input type="checkbox" class="high-priority-checkbox" data-course-id="<?php echo e($subject->id); ?>">
                            Mark as High Priority
                        </label>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
<?php /**PATH C:\xampp\Laravel\StudentReg\resources\views/student/courseRegistration.blade.php ENDPATH**/ ?>