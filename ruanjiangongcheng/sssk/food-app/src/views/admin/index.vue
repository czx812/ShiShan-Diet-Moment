<template>
  <div class="admin-page">
    <h2>后台管理</h2>
    <el-tabs>
      <el-tab-pane label="菜品管理">
        <el-button type="primary" @click="addDish">新增菜品</el-button>
        <el-table :data="dishList" style="margin-top:10px">
          <el-table-column label="名称" prop="name" />
          <el-table-column label="热量" prop="calorie" />
          <el-table-column label="操作">
            <template #default="{ row }">
              <el-button size="small" @click="editDish(row)">编辑</el-button>
              <el-button size="small" type="danger" @click="deleteDish(row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="用户管理">
        <el-table :data="userList">
          <el-table-column label="用户名" prop="username" />
          <el-table-column label="目标" prop="target" />
        </el-table>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { adminSaveDish, adminDeleteDish } from '@/api/admin'
import { getDishList } from '@/api/dish'
import { adminUserList } from '@/api/admin'
import { ElMessage } from 'element-plus'

const dishList = ref([])
const userList = ref([])

onMounted(async () => {
  dishList.value = await getDishList()
  userList.value = await adminUserList()
})

const addDish = () => {
  // 弹窗表单逻辑可自行扩展
}
const editDish = (row) => {
  // 编辑逻辑可自行扩展
}
const deleteDish = async (row) => {
  await adminDeleteDish(row.id)
  ElMessage.success('删除成功')
}
</script>
