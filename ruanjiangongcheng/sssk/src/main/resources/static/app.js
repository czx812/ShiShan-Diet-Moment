const API = "http://localhost:8080";
let user = null;
let activeTab = "dishes";
let currentCateId = "";

// 请求工具
async function req(url, opt = {}) {
    try {
        let res = await fetch(API + url, {
            headers: { "Content-Type": "application/json" },
            ...opt
        });
        let data = await res.json();
        return data.data || data;
    } catch (e) {
        alert("请求失败");
    }
}

// 提示
function toast(msg) {
    let t = document.getElementById("toast");
    t.textContent = msg;
    t.style.opacity = 1;
    setTimeout(() => t.style.opacity = 0, 2000);
}

// 启动
init();
function init() {
    user = JSON.parse(localStorage.getItem("user"));
    render();
}

// 渲染主界面
function render() {
    if (!user) return renderAuth();
    renderMain();
}

// ==========================
// 登录页面
// ==========================
function renderAuth() {
    document.getElementById("app").innerHTML = `
    <div class="auth-card">
        <h2>登录</h2>
        <input id="username" placeholder="账号">
        <input id="password" placeholder="密码" type="password">
        <button class="btn" onclick="login()">登录</button>
    </div>`;
}

async function login() {
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    let data = await req("/user/login?username=" + username + "&password=" + password, { method: "POST" });
    user = { userId: data.userId, username: data.username };
    localStorage.setItem("user", JSON.stringify(user));
    render();
}

// ==========================
// 主界面
// ==========================
function renderMain() {
    document.getElementById("app").innerHTML = `
    <div class="tab-bar">
        <div class="tab ${activeTab === 'dishes' ? 'active' : ''}" onclick="go('dishes')">菜品</div>
        <div class="tab ${activeTab === 'health' ? 'active' : ''}" onclick="go('health')">健康数据</div>
        <div class="tab ${activeTab === 'profile' ? 'active' : ''}" onclick="go('profile')">我的档案</div>
    </div>
    <div id="page"></div>`;
    loadPage();
}

function go(tab) {
    activeTab = tab;
    renderMain();
}

async function loadPage() {
    let p = document.getElementById("page");
    if (activeTab === "dishes") await renderDishes(p);
    if (activeTab === "health") await renderHealth(p);
    if (activeTab === "profile") await renderProfile(p);
}

// ==========================
// 菜品页面（你原有功能）
// ==========================
async function renderDishes(p) {
    p.innerHTML = `<div>菜品功能正常</div>`;
}

// ==========================
// 【健康数据 —— 体重图表】
// ==========================
async function renderHealth(p) {
    p.innerHTML = `
    <div class="card">
        <h3>体重变化趋势</h3>
        <div id="weightChart"></div>
    </div>`;

    let list = await req("/weight/history?userId=" + user.userId);
    let dates = list.map(i => i.recordDate.slice(0, 10));
    let weights = list.map(i => Number(i.weight));

    let chart = echarts.init(document.getElementById("weightChart"));
    chart.setOption({
        xAxis: { data: dates },
        yAxis: {},
        series: [{ type: "line", smooth: true, data: weights }]
    });
}

// ==========================
// 【我的档案 —— 体重记录】
// ==========================
async function renderProfile(p) {
    let info = await req("/userProfile/" + user.userId);

    p.innerHTML = `
    <div class="card">
        <h3>我的档案</h3>
        <input placeholder="年龄" value="${info.age || ''}" id="age"><br>
        <input placeholder="身高" value="${info.height || ''}" id="height"><br>
        <input placeholder="目标体重" value="${info.weight || ''}" id="weight"><br>
        <button class="btn" onclick="saveProfile()">保存档案</button>
    </div>

    <div class="card">
        <h3>记录体重</h3>
        <input type="number" step="0.1" placeholder="输入当前体重" id="newWeight">
        <button class="btn" onclick="saveWeight()">保存体重</button>
        <div id="weightHistory"></div>
    </div>`;

    loadWeightHistory();
}

// 保存档案
async function saveProfile() {
    let data = {
        userId: user.userId,
        age: document.getElementById("age").value,
        height: document.getElementById("height").value,
        weight: document.getElementById("weight").value
    };
    await req("/userProfile/save", { method: "POST", body: JSON.stringify(data) });
    toast("保存成功");
}

// 保存体重
async function saveWeight() {
    let w = document.getElementById("newWeight").value;
    if (!w) return toast("请输入体重");
    await req("/weight/save", {
        method: "POST",
        body: JSON.stringify({ userId: user.userId, weight: w })
    });
    toast("保存成功");
    loadWeightHistory();
}

// 加载体重历史
async function loadWeightHistory() {
    let list = await req("/weight/history?userId=" + user.userId);
    let dom = document.getElementById("weightHistory");
    dom.innerHTML = list.map(i => `<div>${i.recordDate.slice(0,10)} — ${i.weight}kg</div>`).join("");
}

// ==========================
// 弹窗功能（你原有）
// ==========================
function closeCommentModal() {}
function submitComment() {}
function openPostModal() {}
function closePostModal() {}
function submitPost() {}