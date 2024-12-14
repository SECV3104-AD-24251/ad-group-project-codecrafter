<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
                Smart Course Registration
            </h2>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div class="bg-white shadow-sm sm:rounded-lg dark:bg-gray-800 p-6">
                    <!-- Welcome message -->
                    <h1 class="text-2xl font-bold mb-4 text-gray-900 dark:text-gray-100">
                        Welcome, {{ $page.props.auth.user.name }}!
                    </h1>

                    <!-- Progress Section -->
                    <div class="mb-6">
                        <p class="text-gray-700 dark:text-gray-300">Progress...</p>
                        <div class="w-full bg-gray-200 rounded-full h-4 dark:bg-gray-700">
                            <div
                                class="bg-pink-500 h-4 rounded-full"
                                style="width: 0%;"
                            ></div>
                        </div>
                        <p class="text-gray-700 dark:text-gray-300 mt-1">0%</p>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex justify-between gap-4">
                        <button
                            @click="navigateTo('/registration')"
                            class="w-1/2 py-4 bg-gradient-to-r from-rose-500 to-orange-400 text-white font-semibold rounded-lg shadow-md hover:shadow-lg"
                        >
                            Register Now!
                        </button>

                        <button
                            @click="navigateTo('/registered-courses')"
                            class="w-1/2 py-4 bg-gradient-to-r from-pink-400 to-red-500 text-white font-semibold rounded-lg shadow-md hover:shadow-lg"
                        >
                            Need Consultation?
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>

<script>
export default {
    methods: {
        navigateTo(route) {
            this.$inertia.get(route);
        },
    },
};
</script>

<style>
/* Custom styles for the dashboard */
button {
    transition: transform 0.2s;
}
button:hover {
    transform: scale(1.05);
}
</style>
