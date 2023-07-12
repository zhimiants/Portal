<template>
  <div class="login">
    <div class="login-container">
      <h1 class="login-title">登录</h1>
      <el-form class="login-form" label-position="top">
        <el-form-item label="用户名">
          <el-input v-model="username" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="密码">
          <el-input type="password" v-model="password" placeholder="请输入密码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="login">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Login',
  data() {
    return {
      username: 'admin',
      password: 'admin'
    };
  },
  methods: {
    login() {
      // 模拟登录逻辑，校验用户名和密码
      if (this.username === 'admin' && this.password === 'admin') {
        // 登录成功后保存登录状态到localStorage
        localStorage.setItem('isLoggedIn', 'true');

        // 判断角色，普通用户跳转到首页，管理员用户跳转到后台管理界面
        if (this.username === 'admin') {
          this.$router.push('/admin/dashboard');
        } else {
          this.$router.push('/');
        }
        window.location.reload();
      } else {
        // 登录失败逻辑
        this.errorMessage = '用户名或密码错误'; // 显示错误提示信息
        this.username = ''; // 重置用户名字段
        this.password = ''; // 重置密码字段
      }
    }
  }
};
</script>

<style scoped>
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 80vh;
}

.login-container {
  padding: 20px;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  background-color: #fff;
}

.login-title {
  margin-bottom: 20px;
  text-align: center;
}

.login-form {
  width: 300px;
  margin: 0 auto;
}

.el-input {
  width: 100%;
}

.el-button {
  width: 100%;
}
</style>
