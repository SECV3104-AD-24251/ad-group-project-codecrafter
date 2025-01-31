<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <title>Chat with Academic Staff</title>
    <style>
        /* Basic reset and styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex; /* Use flexbox to display sections side by side */
            width: 90%;
            max-width: 1200px;
            margin: 50px auto;
            margin-left: 35px;
        }
        .chat-container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            flex: 1; /* Take remaining space */
        }
        .contact-container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            width: 30%; /* Make this take up 30% of the space */
            height: 400px; /* Set a fixed height for scrolling */
            overflow-y: auto; /* Make the container scrollable */
            margin-right: 20px; /* Space between chat and contacts */
        }
        .contact-item {
            margin-bottom: 10px;
            padding: 10px;
            background: #f9f9f9;
            border-radius: 5px;
            cursor: pointer; /* Add a pointer cursor for interactivity */
        }
        .contact-item:hover {
            background-color: #e2e2e2; /* Add hover effect */
        }
        .contact-item p {
            margin: 5px 0;
        }
        .chat-messages {
            border: 1px solid #ddd;
            padding: 10px;
            height: 300px;
            overflow-y: auto;
            margin-bottom: 10px;
        }
        .message-input {
            display: flex;
            gap: 10px;
        }
        .message-input input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .message-input button {
            padding: 10px 20px;
            background-color: maroon;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        /* Back button style */
        .back-button {
            display: inline-block;
            margin-bottom: 20px;
        }
        .back-button button {
            padding: 10px 20px;
            background-color: maroon;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <!-- Include Pusher and Echo -->
    <script src="https://cdn.jsdelivr.net/npm/pusher-js"></script>
    <script src="{{ mix('js/app.js') }}"></script>  <!-- Ensure this file is compiled via Laravel Mix -->
</head>
<body>

<div class="container">
    <!-- Back Button -->
    <div class="back-button">
        <a href="{{ route('student.dashboard') }}">
            <button>Back to Dashboard</button>
        </a>
    </div>

    <!-- Contact Section -->
    <div class="contact-container">
        <h2>Academic Staff Contacts</h2>
        @foreach ($academicStaff as $staff)
            <div class="contact-item" onclick="selectStaff('{{ $staff->id }}', '{{ $staff->name }}')">
                <p><strong>Name:</strong> {{ $staff->name }}</p>
                <p><strong>Email:</strong> {{ $staff->email }}</p>
            </div>
        @endforeach
    </div>

    <!-- Chat Section -->
    <div class="chat-container" id="chat-container" data-user-id="{{ $currentUserId }}">
        <h2>Chat Section</h2>
        <div class="chat-messages" id="chat-messages">
            <p><strong>Advisor:</strong> Hello, how can I assist you?</p>
        </div>
        <form class="message-input" onsubmit="sendMessage(event)">
            <input type="hidden" id="receiver-id" name="receiver_id">
            <input type="text" id="message" placeholder="Type your message..." required>
            <button type="submit">Send</button>
        </form>
    </div>
</div>

<script src="{{ asset('js/app.js') }}">
    let selectedStaffId = null;

    // Function to select the academic staff
    function selectStaff(staffId, staffName) {
    // Update chat header to show the selected staff's name
    document.querySelector('.chat-container h2').innerHTML = 'Chat with ' + staffName;

    // Save the selected staff ID in a hidden field
    document.getElementById('receiver-id').value = staffId;

    // Clear existing messages (optional)
    const chatMessages = document.getElementById('chat-messages');
    chatMessages.innerHTML = `<p><strong>${staffName}:</strong> Hello, how can I assist you?</p>`;
}

    // Pass user ID to the JavaScript code (if you passed it through data attribute)
    const userId = document.getElementById('chat-container').getAttribute('data-user-id');

window.Echo.private('chat.' + userId)
    .listen('MessageSent', (event) => {
        const chatMessages = document.getElementById('chat-messages');
        const newMessage = document.createElement('p');
        newMessage.innerHTML = `<strong>${event.sender}:</strong> ${event.message}`;
        chatMessages.appendChild(newMessage);
        chatMessages.scrollTop = chatMessages.scrollHeight;
    });

    // Send message function
    function sendMessage(event) {
    event.preventDefault(); // Prevent form submission
    const messageInput = document.getElementById('message');
    const chatMessages = document.getElementById('chat-messages');
    const receiverId = document.getElementById('receiver-id').value;

    const message = messageInput.value.trim();

    if (message !== '' && receiverId !== '') {
        // Send the message to the server via axios
        axios.post('/student/chat/send', {
            receiver_id: receiverId,
            message: message
        })
        .then(response => {
            // Append the message to the chat window
            const newMessage = document.createElement('p');
            newMessage.innerHTML = `<strong>You:</strong> ${message}`;
            chatMessages.appendChild(newMessage);
            chatMessages.scrollTop = chatMessages.scrollHeight;

            // Clear the input field
            messageInput.value = '';
        })
        .catch(error => {
            console.error('Error sending message:', error);
        });
    }
}
</script>

</body>
</html>
