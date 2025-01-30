v@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Set Your Notification Preferences</h1>

    @if (session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('preferences.store') }}" method="POST">
        @csrf

        <div class="form-group">
            <label for="time_slots">Preferred Time Slots:</label>
            <select name="time_slots[]" id="time_slots" class="form-control" multiple>
                <option value="morning">Morning</option>
                <option value="afternoon">Afternoon</option>
                <option value="evening">Evening</option>
            </select>
        </div>

        <div class="form-group">
            <label for="instructors">Preferred Instructors:</label>
            <input type="text" name="instructors[]" id="instructors" class="form-control" placeholder="Enter instructor names, separated by commas">
        </div>

        <div class="form-group">
            <label for="course_types">Preferred Course Types:</label>
            <select name="course_types[]" id="course_types" class="form-control" multiple>
                <option value="lecture">Lecture</option>
                <option value="lab">Lab</option>
                <option value="seminar">Seminar</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Save Preferences</button>
    </form>
</div>
@endsection
