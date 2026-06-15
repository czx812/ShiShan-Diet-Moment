<template>
  <div class="community-page">
    <h2>膳食科普</h2>
    <el-button type="primary" @click="dialogVisible = true">发布帖子</el-button>
    <el-dialog v-model="dialogVisible" title="发布动态">
      <el-input v-model="newPost.content" type="textarea" />
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="publishPost">发布</el-button>
      </template>
    </el-dialog>
    <el-list :data="articleList" style="margin-top:20px">
      <el-list-item v-for="item in articleList" :key="item.id">
        {{ item.title }}
      </el-list-item>
    </el-list>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { getArticleList, postArticle } from '@/api/community'
import { ElMessage } from 'element-plus'

const dialogVisible = ref(false)
const newPost = ref({ content: '' })
const articleList = ref([])

onMounted(async () => {
  articleList.value = await getArticleList()
})

const publishPost = async () => {
  await postArticle(newPost.value)
  ElMessage.success('发布成功')
  dialogVisible.value = false
}
</script>
