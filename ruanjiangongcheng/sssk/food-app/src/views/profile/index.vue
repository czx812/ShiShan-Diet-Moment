<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>个人中心</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/element-plus/dist/index.css">
  <style>
    #app{max-width:600px;margin:30px auto;padding:20px;}
    .form-item{margin:16px 0;}
    label{display:block;margin-bottom:6px;color:#333;}
    input,select{width:100%;padding:10px;border:1px solid #ddd;border-radius:6px;}
    .btn-group{margin-top:24px;display:flex;gap:12px;flex-wrap:wrap;}
    .save-btn{background:#409eff;color:white;border:none;padding:10px 20px;border-radius:6px;flex:1;}
    .pwd-btn{background:#67c23a;color:white;border:none;padding:10px 20px;border-radius:6px;flex:1;}
    .logout-btn{background:#e6a23c;color:white;border:none;padding:10px 20px;border-radius:6px;flex:1;}
    .del-btn{background:#f56c6c;color:white;border:none;padding:10px 20px;border-radius:6px;flex:1;}
    .pwd-box{border:1px solid #eee;padding:16px;border-radius:8px;margin:20px 0;}
    h3{margin:10px 0 16px 0;color:#222;}
  </style>
</head>
<body>
<div id="app">
  <h2>个人中心</h2>

  <div class="form-item">
    <label>身高</label>
    <input v-model="form.height" type="number" placeholder="请输入身高">
  </div>
  <div class="form-item">
    <label>体重</label>
    <input v-model="form.weight" type="number" placeholder="请输入体重">
  </div>
  <div class="form-item">
    <label>饮食目标</label>
    <select v-model="form.target">
      <option value="reduce">减脂塑形</option>
      <option value="gain">增肌健身</option>
      <option value="health">养生调理</option>
      <option value="exam">备考养胃</option>
      <option value="special">特殊体质</option>
    </select>
  </div>
  <div class="form-item">
    <label>忌口食材</label>
    <input v-model="form.allergy" placeholder="多个食材用逗号分隔">
  </div>

  <div class="pwd-box">
    <h3>修改登录密码</h3>
    <div class="form-item">
      <label>原密码</label>
      <input v-model="pwdForm.oldPwd" type="password" placeholder="请输入旧密码">
    </div>
    <div class="form-item">
      <label>新密码</label>
      <input v-model="pwdForm.newPwd" type="password" placeholder="请设置新密码">
    </div>
    <div class="form-item">
      <label>确认新密码</label>
      <input v-model="pwdForm.confirmPwd" type="password" placeholder="再次输入新密码">
    </div>
    <button class="pwd-btn" @click="changePwd">提交修改密码</button>
  </div>

  <div class="btn-group">
    <button class="save-btn" @click="saveInfo">保存个人档案</button>
    <button class="logout-btn" @click="logout">退出登录</button>
    <button class="del-btn" @click="cancelAccount">注销账号</button>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.prod.js"></script>
<script>
const { createApp } = Vue
createApp({
  data(){
    return {
      form:{ height:'', weight:'', target:'', allergy:'' },
      pwdForm:{ oldPwd:'', newPwd:'', confirmPwd:'' }
    }
  },
  mounted(){ this.getUserData() },
  methods:{
    async getUserData(){
      try{
        const res = await fetch('http://localhost:8080/api/user/profile')
        const data = await res.json()
        if(data.code === 200) this.form = data.data
      }catch(e){ console.log("未填写档案") }
    },
    async saveInfo(){
      if(!this.form.height||!this.form.weight||!this.form.target){
        alert("请填写完整信息")
        return
      }
      try{
        const res = await fetch('http://localhost:8080/api/user/update',{
          method:'PUT', headers:{'Content-Type':'application/json'},
          body:JSON.stringify(this.form)
        })
        const r = await res.json()
        alert(r.msg || "保存成功")
      }catch(e){ alert("保存失败") }
    },
    async changePwd(){
      const o = this.pwdForm
      if(!o.oldPwd||!o.newPwd||!o.confirmPwd){
        alert("请填写完整")
        return
      }
      if(o.newPwd!==o.confirmPwd){
        alert("两次密码不一致")
        return
      }
      try{
        const res = await fetch('http://localhost:8080/api/user/modifyPwd',{
          method:'POST', headers:{'Content-Type':'application/json'},
          body:JSON.stringify({oldPwd:o.oldPwd, newPwd:o.newPwd})
        })
        const r = await res.json()
        alert(r.msg)
        if(r.code===200) location.href="login.html"
      }catch(e){ alert("修改失败") }
    },
    async logout(){
      if(!confirm("确定退出？")) return
      await fetch('http://localhost:8080/api/user/logout')
      alert("已退出")
      location.href="login.html"
    },
    async cancelAccount(){
      if(!confirm("注销后无法恢复，确定？")) return
      if(!confirm("再次确认注销")) return
      const res = await fetch('http://localhost:8080/api/user/cancel',{method:'DELETE'})
      const r = await res.json()
      alert(r.msg)
      location.href="login.html"
    }
  }
}).mount('#app')
</script>
</body>
</html>