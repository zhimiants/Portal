<template>
  <header class="header">
    <div class="logo">
      <img src="@/assets/1.jpg" alt="Company Logo" class="logo-image">
      <span class="company-name">Mecedes</span>
    </div>
    <nav class="navigation">
      <el-menu class="nav-list" mode="horizontal">
        <el-menu-item index="/" @click="navigate('/')">首页</el-menu-item>
        <el-menu-item index="/product" @click="navigate('/product')">产品</el-menu-item>
        <el-menu-item index="/message-board" @click="navigate('/message-board')">留言板</el-menu-item>
        <el-menu-item v-if="isLoggedIn" index="/admin/dashboard" @click="navigate('/admin/dashboard')">首页管理</el-menu-item>
        <el-menu-item v-if="isLoggedIn" index="/admin/product-management" @click="navigate('/admin/product-management')">产品管理</el-menu-item>
        <el-menu-item v-if="isLoggedIn" index="/admin/message-board-management" @click="navigate('/admin/message-board-management')">留言板管理</el-menu-item>
        <el-menu-item v-if="isLoggedIn" index="/" @click="logout">退出</el-menu-item>
        <el-menu-item v-else index="/login" @click="navigate('/login')">登录</el-menu-item>
      </el-menu>
    </nav>
    <div class="user-profile">
      <div class="avatar">
        <img src="@/assets/home1.png" alt="User Avatar" class="avatar-image">
      </div>
      <div class="user-info">
        <span class="username">{{ isLoggedIn ? username : '普通用户' }}</span>
        <span class="role">{{ isLoggedIn ? '管理员' : '' }}</span>
      </div>
      <el-dropdown trigger="click" @command="handleDropdownCommand">
        <span class="dropdown-toggle">
          <i class="el-icon-arrow-down"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command="profile">个人资料</el-dropdown-item>
          <el-dropdown-item command="settings">设置</el-dropdown-item>
          <el-dropdown-item divided command="logout">退出</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header',
  computed: {
    isLoggedIn() {
      return localStorage.getItem('isLoggedIn') === 'true';
    },
    username() {
      // 获取当前用户的用户名
      return this.isLoggedIn ? localStorage.getItem('username') : '';
    }
  },
  methods: {
    navigate(route) {
      this.$router.push(route);
    },
    handleDropdownCommand(command) {
      if (command === 'profile') {
        // 处理个人资料菜单项的点击事件
        // 可以跳转到个人资料页面或显示个人资料的弹窗
      } else if (command === 'settings') {
        // 处理设置菜单项的点击事件
        // 可以跳转到设置页面或显示设置的弹窗
      } else if (command === 'logout') {
        // 处理退出菜单项的点击事件
        this.logout();
      }
    },
    logout() {
      // 清空本地localStorage
      localStorage.removeItem('isLoggedIn');
      localStorage.removeItem('username');
      localStorage.setItem('isLoggedIn', 'false');

      location.reload();
    }
  }
}
</script>

<style scoped>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
}

.logo .logo-image {
  width: 50px;
  height: 50px;
  object-fit: cover;
  margin-right: 10px;
}

.logo .company-name {
  font-size: 18px;
  font-weight: bold;
}

.navigation .nav-list {
  margin: 0;
}

.navigation .el-menu-item {
  cursor: pointer;
}

.user-profile {
  display: flex;
  align-items: center;
}

.user-profile .avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  overflow: hidden;
  margin-right: 10px;
}

.user-profile .avatar-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.user-profile .user-info {
  display: flex;
  flex-direction: column;
}

.user-profile .username {
  font-size: 14px;
  font-weight: bold;
}

.user-profile .role {
  font-size: 12px;
  color: #888;
}

.user-profile .dropdown-toggle {
  cursor: pointer;
  margin-left: 10px;
}

.user-profile .dropdown-toggle i {
  font-size: 12px;
}
</style>
