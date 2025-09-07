<template>
  <div>
    <h1>Upload a File for Analysis</h1>
    <form @submit.prevent="handleSubmit">
      <input type="file" ref="file" accept="image/*" required />
      <button type="submit">Upload</button>
    </form>
  </div>
</template>

<script>
export default {
  methods: {
    handleSubmit() {
      const formData = new FormData();
      formData.append('file', this.$refs.file.files[0]);
      fetch('http://localhost:5000/upload', {
        method: 'POST',
        body: formData,
      })
      .then(response => response.json())
      .then(data => alert(data.message))
      .catch(error => console.error('Error:', error));
    }
  }
}
</script>

<style>
/* Add your styles here */
</style>
