<template>
  <div class="product">
    <h1>产品信息</h1>
    <el-row>
      <el-col :span="8" v-for="product in products" :key="product.id">
        <el-card :body-style="{ padding: '20px' }">
          <img :src="product.image" class="product-image" alt="Product Image">
          <h2 class="product-name">{{ product.name }}</h2>
          <p class="product-description">{{ product.description }}</p>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Product',
  data() {
    return {
      products: []
    };
  },
  mounted() {
    this.fetchProducts();
  },
  methods: {
    fetchProducts() {
      this.$axios.get('http://localhost:8081/api/products')
        .then(response => {
          this.products = response.data;
        })
        .catch(error => {
          console.error(error);
        });
      
        // this.$axios.get('http://localhost:8081/api/products')
        // .then(response => {
        //   this.products = response.data.map(product => {
        //     // 使用相对路径拼接图片URL
        //     product.image = `D:\Vue\vueproject\portal2\src\assets${product.image}`;
        //     return product;
        //   });
        // })
        // .catch(error => {
        //   console.error(error);
        // });
    }
  }
}
</script>

<style scoped>
.product {
  padding: 20px;
}

.product-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.product-name {
  margin-top: 10px;
  font-size: 20px;
}

.product-description {
  margin-top: 10px;
  font-size: 14px;
  color: #999;
}
</style>
