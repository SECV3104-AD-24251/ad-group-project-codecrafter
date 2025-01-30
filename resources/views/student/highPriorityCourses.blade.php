<div class="high-priority-courses">
    <h2>Your High Priority Courses</h2>
    @if ($highPriorityCourses->isEmpty())
        <p>No high-priority courses selected yet.</p>
    @else
        @foreach ($highPriorityCourses as $priority)
            <div>
                {{ $priority->course->subject_code }} - {{ $priority->course->subject_name }}
            </div>
        @endforeach
    @endif
</div>
