<template>
    <div class="degree-progress">
      <h2>Courses Completed</h2>
      <div class="progress">
        <h3>{{ completedCourses }} / {{ totalCourses }}</h3>
        <progress :value="completedCourses" :max="totalCourses"></progress>
      </div>
  
      <div class="course-lists">
        <div>
          <h4>Remaining Mandatory Courses</h4>
          <ul>
            <li v-for="course in mandatoryCourses" :key="course.code">
              {{ course.code }} - {{ course.name }}
            </li>
          </ul>
        </div>
  
        <div>
          <h4>Recommended Elective Courses</h4>
          <ul>
            <li v-for="course in recommendedElectives" :key="course.code">
              {{ course.code }} - {{ course.name }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        completedCourses: 0,
        totalCourses: 0,
        mandatoryCourses: [],
        recommendedElectives: [],
      };
    },
    created() {
      this.fetchProgress();
    },
    methods: {
      async fetchProgress() {
        try {
          const response = await axios.get('/api/progress');
          this.completedCourses = response.data.completedCourses;
          this.totalCourses = response.data.totalCourses;
          this.mandatoryCourses = response.data.mandatoryCourses;
          this.recommendedElectives = response.data.recommendedElectives;
        } catch (error) {
          console.error('Error fetching progress data:', error);
        }
      },
    },
  };
  </script>
  
  <style scoped>
  h2 {
    font-size: 24px;
    margin-bottom: 10px;
  }
  
  .progress {
    margin-bottom: 20px;
  }
  
  .course-lists {
    display: flex;
    justify-content: space-around;
  }
  
  h4 {
    font-size: 18px;
  }
  
  ul {
    list-style: none;
    padding: 0;
  }
  
  li {
    margin: 5px 0;
  }
  </style>
