<template>
    <div>
      <h1>Registered Courses</h1>
      <div v-if="registeredCourses.length === 0">
        <p>No courses registered yet.</p>
      </div>
      <ul v-else>
        <li v-for="course in registeredCourses" :key="course.id">
          {{ course.name }}
        </li>
      </ul>
    </div>
  </template>

  <script>
  export default {
    props: {
      registeredCourses: Array,
    },
  };
  </script>
