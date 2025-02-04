<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Registration</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> <!-- Axios -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery -->
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table thead {
            background-color: maroon;
            color: white;
        }
        table th, table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
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
        button.unenroll { background-color: #dc3545; }
        a {
            display: inline-block;
            margin-top: 20px;
            color: maroon;
            text-decoration: none;
            font-weight: bold;
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
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 500px;
            text-align: center;
        }
        .close-button {
            float: right;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        @if (session('unenroll_success'))
            <div id="unenrollModal" class="modal" style="display: block;">
                <div class="modal-content">
                    <span class="close-button" onclick="closeUnenrollModal()">&times;</span>
                    <p>{{ session('unenroll_success') }}</p>
                </div>
            </div>

            <script>
                function closeUnenrollModal() {
                    document.getElementById('unenrollModal').style.display = 'none';
                }
            </script>
        @endif

        <h2>Sections for Course ID: {{ $course_id }}</h2>
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
                @forelse ($sections as $section)
                    <tr>
                        <td>{{ $section->section }}</td>
                        <td>{{ $section->lect_assigned }}</td>
                        <td>{{ $section->capacity }}</td>
                        <td>
                            <button class="enroll-btn {{ $section->user_id === Auth::id() ? 'unenroll' : '' }}"
                                    data-section-id="{{ $section->id }}"
                                    data-course-id="{{ $course_id }}">
                                {{ $section->user_id === Auth::id() ? 'Unenroll Me' : 'Enroll Me' }}
                            </button>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="4">No sections available for this course.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
        <a href="{{ route('student.courses.registered') }}">Go to Registered Courses</a>
    </div>

    <!-- Modal for Feedback Messages -->
    <div id="messageModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
            <p id="modalMessage"></p>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('.enroll-btn').click(function () {
                let button = $(this);
                let sectionId = button.data('section-id');
                let courseId = button.data('course-id');
                let isUnenroll = button.text().trim() === "Unenroll Me"; // Detect if user is trying to unenroll

                axios.post("{{ route('processRegistration.enroll') }}", {
                    _token: "{{ csrf_token() }}",
                    section_id: sectionId,
                    course_id: courseId
                })
                .then(response => {
                    if (response.data && response.data.message) {
                        showMessage(response.data.message);
                    } else {
                        showMessage("Action completed successfully."); // Fallback message
                    }

                    // If user unenrolled, reload with a delay so the session message shows
                    if (isUnenroll) {
                        setTimeout(() => window.location.href = "{{ route('processRegistration.show', ['course_id' => $course_id]) }}", 1500);
                    } else {
                        setTimeout(() => location.reload(), 1500);
                    }
                })
                .catch(error => {
                    let errorMessage = error.response?.data?.message || "An error occurred.";
                    showMessage(errorMessage);
                });
            });
        });

        function showMessage(message) {
            document.getElementById('modalMessage').innerText = message;
            document.getElementById('messageModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('messageModal').style.display = 'none';
        }
    </script>
</body>
</html>
