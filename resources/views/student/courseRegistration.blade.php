<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <style>
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
        }

        .container {
            max-width: 900px;
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
            padding: 15px;
            background: #e1e5ec;
            text-decoration: none;
            color: #333;
            border-radius: 8px;
            transition: background-color 0.3s, color 0.3s;
        }

        .course-list a:hover {
            background: rgb(165, 22, 22);
            color: white;
        }

        .course-item {
            margin-bottom: 15px;
        }

        .course-item label {
            margin-top: 10px;
        }

        .filter-section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .filter-section label {
            margin-right: 15px;
        }

        .high-priority-checkbox {
            margin-top: 10px;
            margin-left: 10px;
        }

        /* Custom Button */
        .filter-section button {
            background-color: maroon;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .filter-section button:hover {
            background-color: rgb(165, 22, 22);
        }

        .back-button {
            position: fixed;
            top: 15px;
            left: 15px;
            background-color: maroon;
            color: white;
            padding: 10px 15px;
            border-radius: 50%;
            font-size: 20px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: rgb(165, 22, 22);
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

            window.location.href = '{{ route("student.courses.register") }}?' + queryParams.toString();
        }
    </script>
</head>
<body>
    @php
    $selectedPrograms = $selectedPrograms ?? ['ALL'];
    @endphp

    <button class="back-button" onclick="window.history.back();">
       <i class="bi bi-arrow-left-circle"></i>
    </button>
    <div class="container">
        <h1 class="text-center text-primary mb-4" style="color: maroon !important;">Course Registration</h1>

        <!-- Semester Dropdown -->
        <div class="dropdown mb-4">
            <label for="semesterSelect" class="form-label">Select Semester:</label>
            <select id="semesterSelect" class="form-select">
                <option value="">All Semesters</option>
                @foreach ($semesters as $semester)
                    <option value="{{ $semester }}" @if($selectedSemester == $semester) selected @endif>
                        {{ $semester }}
                    </option>
                @endforeach
            </select>
        </div>

        <!-- Program Filters -->
        <div class="filter-section">
            <div class="form-check">
                <input type="checkbox" id="allPrograms" onchange="toggleAllPrograms(this)" class="form-check-input"
                @if(in_array('ALL', $selectedPrograms ?? ['ALL'])) checked @endif>
                <label class="form-check-label" for="allPrograms">ALL</label>
            </div>

            @php
                $allPrograms = ['SECBH', 'SECRH', 'SECJH', 'SECVH', 'SECPH', 'SCSEH'];
            @endphp

            @foreach ($allPrograms as $program)
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="program-checkbox form-check-input" value="{{ $program }}"
                           onchange="toggleIndividualProgram()"
                           @if(in_array($program, $selectedPrograms)) checked @endif>
                    <label class="form-check-label">{{ $program }}</label>
                </div>
            @endforeach

            <button onclick="applyFilters()">Apply Filters</button>
        </div>

        <!-- Course List -->
        <div class="course-list">
            @if ($subjects->isEmpty())
                <p>No courses available for the selected filters.</p>
            @else
                @foreach ($subjects as $subject)
                    @php
                        $subjectPrograms = explode('/', $subject->program);
                        $shouldShow = count(array_intersect($subjectPrograms, $selectedPrograms)) > 0;
                    @endphp

                    @if ($shouldShow)
                        <div class="course-item">
                            <a href="{{ route('processRegistration.show', $subject->id) }}">
                                <strong>{{ $subject->course_code }}</strong> - {{ $subject->course_name }} 
                                (Credit: {{ $subject->credits }})
                            </a>
                            <div>
                                <input type="checkbox" class="high-priority-checkbox" data-course-id="{{ $subject->id }}">
                                <label for="high-priority-{{ $subject->id }}">Mark as High Priority</label>
                            </div>
                        </div>
                    @endif
                @endforeach
            @endif
        </div>
    </div>
</body>
</html>
