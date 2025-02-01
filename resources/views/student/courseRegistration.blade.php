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

            window.location.href = '{{ route("student.courses.register") }}?' + queryParams.toString();
        }
    </script>
</head>
<body>
    @php
    $selectedPrograms = $selectedPrograms ?? ['ALL'];
    @endphp

    <div class="container">
        <h1>Course Registration</h1>

        <!-- Semester Dropdown -->
        <div class="dropdown">
            <label for="semesterSelect">Select Semester:</label>
            <select id="semesterSelect">
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
            <label>
                <input type="checkbox" id="allPrograms" onchange="toggleAllPrograms(this)" 
                @if(in_array('ALL', $selectedPrograms ?? ['ALL'])) checked @endif> ALL
            </label>

            @php
                $allPrograms = ['SECBH', 'SECRH', 'SECJH', 'SECVH', 'SECPH', 'SCSEH'];
            @endphp

            @foreach ($allPrograms as $program)
                <label>
                    <input type="checkbox" class="program-checkbox" value="{{ $program }}"
                           onchange="toggleIndividualProgram()"
                           @if(in_array($program, $selectedPrograms)) checked @endif>
                    {{ $program }}
                </label>
            @endforeach
            <button onclick="applyFilters()">Filter</button>
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
                                {{ $subject->subject_code }} - {{ $subject->subject_name }} (Credit: {{ $subject->credit_hours }})
                            </a>
                            <label>
                                <input type="checkbox" class="high-priority-checkbox" data-course-id="{{ $subject->id }}">
                                Mark as High Priority
                            </label>
                        </div>
                    @endif
                @endforeach
            @endif
        </div>
    </div>
</body>
</html>
