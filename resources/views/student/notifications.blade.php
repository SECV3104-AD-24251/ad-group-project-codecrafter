<!-- resources/views/student/notifications.blade.php -->

<h2>Your Notifications</h2>

@foreach($notifications as $notification)
    <div class="notification">
        <p>{{ $notification->data['message'] }}</p>
        <small>{{ $notification->created_at->diffForHumans() }}</small>

        <!-- Link to mark notification as read -->
        <a href="{{ route('notification.read', $notification->id) }}">Mark as read</a>
    </div>
@endforeach
