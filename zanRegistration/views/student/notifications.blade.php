<h3>Your Notifications</h3>

{{-- Display unread notifications --}}
<h4>Unread Notifications</h4>
<ul>
    @foreach (auth()->user()->unreadNotifications as $notification)
        <li>
            {{ $notification->data['message'] }} - {{ $notification->created_at->diffForHumans() }}
        </li>
    @endforeach
</ul>

{{-- Display all notifications --}}
<h4>All Notifications</h4>
<ul>
    @foreach (auth()->user()->notifications as $notification)
        <li>
            {{ $notification->data['message'] }} - {{ $notification->created_at->diffForHumans() }}
        </li>
    @endforeach
</ul>
