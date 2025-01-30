import Echo from 'laravel-echo';
import Pusher from 'pusher-js';

// Initialize Echo and Pusher
window.Pusher = Pusher;

window.Echo = new Echo({
    broadcaster: "pusher",
    key: process.env.MIX_PUSHER_APP_KEY,
    cluster: process.env.MIX_PUSHER_APP_CLUSTER,
    forceTLS: true,
});
