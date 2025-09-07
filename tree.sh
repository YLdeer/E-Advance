#!/bin/bash

# 确保脚本在项目根目录下运行
cd "$(dirname "$0")"

# 创建Flask后端的缺少目录
mkdir -p backend/processed

# 创建Vue前端项目
cd backend
npx @vue/cli create frontend --default
cd frontend

# 创建Vue组件
mkdir -p src/components
touch src/components/UploadForm.vue src/components/ImageList.vue

# 添加内容到UploadForm.vue
cat <<EOL > src/components/UploadForm.vue
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
      formData.append('file', this.\$refs.file.files[0]);
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
EOL

# 添加内容到ImageList.vue
cat <<EOL > src/components/ImageList.vue
<template>
  <div>
    <h2>Uploaded Images</h2>
    <!-- Add logic to display uploaded and processed images -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      images: []
    };
  },
  mounted() {
    // Fetch and display images
  }
}
</script>

<style>
/* Add your styles here */
</style>
EOL

# 修改App.vue
cat <<EOL > src/App.vue
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
EOL

echo "项目结构已更新。"
