<!-- resources/views/chat/index.blade.php -->
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <!-- Staff List -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Academic Staff</div>
                <div class="card-body">
                    <div class="list-group">
                        @foreach($users as $user)
                            <a href="#" class="list-group-item staff-member" data-id="{{ $user->id }}">
                                {{ $user->name }}
                            </a>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

        <!-- Chat Box -->
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Chat</div>
                <div class="card-body">
                    <div id="chat-messages" style="height: 400px; overflow-y: auto;">
                        <!-- Messages will be loaded here -->
                    </div>
                    <div class="input-group mt-3">
                        <input type="text" id="message-input" class="form-control">
                        <button class="btn btn-primary" id="send-message">Send</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@push('scripts')
<script>
let selectedUserId = null;

// Select staff member
$('.staff-member').click(function(e) {
    e.preventDefault();
    selectedUserId = $(this).data('id');
    loadMessages(selectedUserId);
});

// Load messages
function loadMessages(userId) {
    $.get(/messages/${userId}, function(messages) {
        let html = '';
        messages.forEach(message => {
            const isOwn = message.sender_id == {{ auth()->id() }};
            html += 
                <div class="message ${isOwn ? 'text-right' : ''}">
                    <div class="message-content ${isOwn ? 'bg-primary text-white' : 'bg-light'}">
                        ${message.message}
                    </div>
                </div>
            ;
        });
        $('#chat-messages').html(html);
    });
}

// Send message
$('#send-message').click(function() {
    if (!selectedUserId) return;
    
    const message = $('#message-input').val();
    if (!message) return;

    $.post('/messages', {
        receiver_id: selectedUserId,
        message: message,
        _token: '{{ csrf_token() }}'
    }, function(response) {
        $('#message-input').val('');
        loadMessages(selectedUserId);
    });
});
</script>
@endpush