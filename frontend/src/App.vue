<template>
  <div id="app">
    <UploadForm />
    <ImageList />
  </div>
</template>

<script>
import UploadForm from './components/UploadForm.vue';
import ImageList from './components/ImageList.vue';

export default {
  components: {
    UploadForm,
    ImageList
  }
}
</script>

<style>
/* Add your styles here */
</style>
