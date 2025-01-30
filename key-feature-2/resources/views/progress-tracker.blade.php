@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Smart Course Registration</h1>

    <div class="card mb-4">
        <div class="card-body">
            <h4>Courses Completed</h4>
            <h2>{{ $completedCourses }} / {{ $totalCourses }}</h2>
            <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: {{ ($completedCourses / $totalCourses) * 100 }}%;">
                    {{ round(($completedCourses / $totalCourses) * 100) }}%
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h3>Remaining Mandatory Courses</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($mandatoryCourses as $course)
                        <tr>
                            <td>{{ $course->code }}</td>
                            <td>{{ $course->name }}</td>
                        </tr>
                    @empty
                        <tr><td colspan="2">All mandatory courses completed!</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="col-md-6">
            <h3>Recommended Elective Courses</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($recommendedElectives as $course)
                        <tr>
                            <td>{{ $course->code }}</td>
                            <td>{{ $course->name }}</td>
                        </tr>
                    @empty
                        <tr><td colspan="2">No electives available at the moment.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
