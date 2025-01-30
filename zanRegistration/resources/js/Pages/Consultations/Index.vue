<script setup>
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Consultations" />

    <div class="py-12">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="bg-white shadow-sm sm:rounded-lg dark:bg-gray-800 p-6">
                <h1 class="text-2xl font-bold mb-4 text-gray-900 dark:text-gray-100">
                    Academic Advisor Consultation
                </h1>

                <p class="text-gray-700 dark:text-gray-300 mb-6">
                    Choose an academic advisor to schedule a consultation regarding course registration.
                </p>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- List Advisors -->
                    <div
                        v-for="advisor in $page.props.advisors"
                        :key="advisor.id"
                        class="p-4 bg-gray-100 rounded-lg shadow dark:bg-gray-700"
                    >
                        <h2 class="text-lg font-semibold text-gray-800 dark:text-gray-200">
                            {{ advisor.name }}
                        </h2>
                        <p class="text-sm text-gray-600 dark:text-gray-400">
                            {{ advisor.email }}
                        </p>

                        <button
                            @click="scheduleConsultation(advisor.id)"
                            class="mt-4 py-2 px-4 bg-blue-500 text-white rounded-lg hover:bg-blue-600"
                        >
                            Schedule Consultation
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    methods: {
        scheduleConsultation(advisorId) {
            this.$inertia.post('/consultations', { advisor_id: advisorId }, {
                onSuccess: () => {
                    alert('Consultation scheduled successfully!');
                },
                onError: (errors) => {
                    alert('Failed to schedule consultation.');
                },
            });
        },
    },
};
</script>