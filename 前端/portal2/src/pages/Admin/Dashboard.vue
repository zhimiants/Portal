<template>
  <div class="dashboard">
    <div class="dashboard-header">
      <h1>管理员首页</h1>
      <div class="time-display">{{ currentTime }}</div>
    </div>
    <el-row class="dashboard-content">
      <el-col :span="8">
        <el-card class="welcome-card">
          <h2 class="welcome-title">欢迎回来，{{ adminName }}</h2>
          <p class="welcome-description">
            这是管理员控制面板。在这里，您可以管理留言和产品信息。
          </p>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card class="card">
          <h2 class="card-title">最新留言</h2>
          <div v-if="latestMessage">
            <h3 class="message-name">{{ latestMessage.name }}</h3>
            <p class="message-content">{{ latestMessage.content }}</p>
          </div>
          <div v-else>
            <p>暂无留言。</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card class="card">
          <h2 class="card-title">最新产品</h2>
          <div class="product-list" v-if="products.length > 0">
            <div class="product" v-for="product in products" :key="product.id">
              <img :src="product.image" class="product-image" alt="Product Image">
              <h3 class="product-name">{{ product.name }}</h3>
              <p class="product-description">{{ product.description }}</p>
            </div>
          </div>
          <div v-else>
            <p>暂无产品。</p>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Dashboard',
  data() {
    return {
      adminName: '管理员',
      latestMessage: null,
      products: [],
      currentTime: ''
    };
  },
  mounted() {
    this.fetchLatestMessage();
    this.fetchProducts();
    this.updateCurrentTime();
  },
  methods: {
    fetchLatestMessage() {
      axios.get('http://localhost:8081/api/messages/latest')
        .then(response => {
          this.latestMessage = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    fetchProducts() {
      axios.get('http://localhost:8081/api/products')
        .then(response => {
          this.products = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    updateCurrentTime() {
      setInterval(() => {
        const now = new Date();
        const hours = now.getHours().toString().padStart(2, '0');
        const minutes = now.getMinutes().toString().padStart(2, '0');
        const seconds = now.getSeconds().toString().padStart(2, '0');
        this.currentTime = `${hours}:${minutes}:${seconds}`;
      }, 1000);
    }
  }
};
</script>

<style scoped>
.dashboard {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
}

.dashboard-header {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.dashboard-header h1 {
  margin-right: 20px;
}

.time-display {
  font-size: 18px;
  color: #999;
}

.welcome-card {
  padding: 20px;
}

.welcome-title {
  font-size: 24px;
}

.welcome-description {
  margin-top: 10px;
  font-size: 16px;
  color: #666;
}

.card {
  margin-top: 20px;
  padding: 20px;
}

.card-title {
  font-size: 20px;
  margin-bottom: 10px;
}

.message-name {
  font-size: 16px;
  margin-bottom: 5px;
}

.message-content {
  font-size: 14px;
  color: #999;
}

.product-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.product {
  width: calc(33.33% - 10px);
  margin-bottom: 20px;
}

.product-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.product-name {
  margin-top: 10px;
  font-size: 16px;
}

.product-description {
  margin-top: 10px;
  font-size: 14px;
  color: #999;
}

.time-display {
  font-size: 36px;
  color: #835d5d;
}
</style>
