<script setup>
import { ref, onMounted } from 'vue';
import { Head } from '@inertiajs/vue3';
import axios from 'axios';

const messages = ref([]);
const newMessage = ref('');
const consultationId = ref(null);

onMounted(() => {
    consultationId.value = window.location.pathname.split('/').pop();
    loadMessages();
});

const loadMessages = async () => {
    const response = await axios.get(`/api/messages/${consultationId.value}`);
    messages.value = response.data;
};

const sendMessage = async () => {
    if (newMessage.value.trim() === '') return;

    await axios.post('/api/messages', {
        consultation_id: consultationId.value,
        message: newMessage.value,
    });

    newMessage.value = '';
    loadMessages();
};
</script>

<template>
    <Head title="Chat with Advisor" />
    <div class="chat-container">
        <div class="messages">
            <div v-for="msg in messages" :key="msg.id" class="message">
                <strong>{{ msg.sender }}:</strong> {{ msg.text }}
            </div>
        </div>
        <input v-model="newMessage" @keyup.enter="sendMessage" placeholder="Type a message..." />
        <button @click="sendMessage">Send</button>
    </div>
</template>

<style>
.chat-container {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background: white;
    border-radius: 8px;
}
.messages {
    height: 300px;
    overflow-y: auto;
    margin-bottom: 10px;
}
.message {
    padding: 5px;
    border-bottom: 1px solid #ddd;
}
</style>
