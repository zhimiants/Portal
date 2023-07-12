<template>
  <div class="admin-product-management">
    <h1>后台产品管理</h1>
    <div class="search-container">
      <el-input
        v-model="searchId"
        placeholder="请输入产品ID"
        class="search-input"
        clearable
      ></el-input>
      <el-button type="primary" @click="searchProduct" class="search-button">查询</el-button>
    </div>
    <el-table :data="pagedProducts" border>
      <el-table-column prop="id" label="ID" width="80"></el-table-column>
      <el-table-column prop="name" label="Name"></el-table-column>
      <el-table-column prop="price" label="Price"></el-table-column>
      <el-table-column prop="stock" label="Stock"></el-table-column>
      <el-table-column prop="image" label="Image">
        <template slot-scope="scope">
          <el-image :src="scope.row.image" alt="Product Image" class="product-image" fit="cover"></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="description" label="Description"></el-table-column>
      <el-table-column label="Actions" width="200">
        <template slot-scope="scope">
          <el-button type="danger" size="mini" @click="deleteProduct(scope.row.id)">删除</el-button>
          <el-button type="primary" size="mini" @click="editProduct(scope.row)">编辑</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-button type="primary" @click="showAddProductDialog" class="add-button">添加产品</el-button>

    <el-pagination
      class="pagination"
      :current-page="currentPage"
      :page-size="4"
      layout="prev, pager, next"
      :total="products.length"
      @current-change="handlePageChange"
    ></el-pagination>

    <el-dialog title="添加产品" :visible.sync="addProductDialogVisible" @close="resetAddProductForm">
      <el-form :model="addProductForm" label-width="80px">
        <el-form-item label="Name">
          <el-input v-model="addProductForm.name"></el-input>
        </el-form-item>
        <el-form-item label="Price">
          <el-input-number v-model="addProductForm.price"></el-input-number>
        </el-form-item>
        <el-form-item label="Stock">
          <el-input-number v-model="addProductForm.stock"></el-input-number>
        </el-form-item>
        <el-form-item label="Image">
          <el-input v-model="addProductForm.image"></el-input>
        </el-form-item>
        <el-form-item label="Description">
          <el-input type="textarea" v-model="addProductForm.description"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="addProductDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="addProduct">添加</el-button>
      </div>
    </el-dialog>

    <el-dialog title="编辑产品" :visible.sync="editProductDialogVisible" @close="resetEditProductForm">
      <el-form :model="editProductForm" label-width="80px">
        <el-form-item label="ID">
          <el-input v-model="editProductForm.id" disabled></el-input>
        </el-form-item>
        <el-form-item label="Name">
          <el-input v-model="editProductForm.name"></el-input>
        </el-form-item>
        <el-form-item label="Price">
          <el-input-number v-model="editProductForm.price"></el-input-number>
        </el-form-item>
        <el-form-item label="Stock">
          <el-input-number v-model="editProductForm.stock"></el-input-number>
        </el-form-item>
        <el-form-item label="Image">
          <el-input v-model="editProductForm.image"></el-input>
        </el-form-item>
        <el-form-item label="Description">
          <el-input type="textarea" v-model="editProductForm.description"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="editProductDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="updateProduct">保存</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'AdminProductManagement',
  data() {
    return {
      products: [], // 所有产品的列表
      searchId: '', // 查询的产品ID
      addProductDialogVisible: false, // 添加产品对话框的可见性
      addProductForm: {
        name: '默认',
        price: 0,
        stock: 0,
        image: 'http://tva1.sinaimg.cn/large/006W5DN5ly1hf1a98e4haj31hc0u0kd5.jpg',
        description: '这是一个产品',
      }, // 添加产品表单
      editProductDialogVisible: false, // 编辑产品对话框的可见性
      editProductForm: {
        id: '',
        name: '',
        price: 0,
        stock: 0,
        image: '',
        description: '',
      }, // 编辑产品表单
      currentPage: 1, // 当前页码
      
    };
  },
  computed: {
    pagedProducts() {
      const startIndex = (this.currentPage - 1) * 4; // 计算起始索引
      const endIndex = this.currentPage * 4; // 计算结束索引
      return this.products.slice(startIndex, endIndex); // 返回当前页的产品列表
    },
  },
  mounted() {
    this.fetchProducts();
  },
  methods: {
    fetchProducts() {
      // 发送请求获取产品管理的数据
      // 这里使用axios或其他HTTP库发送GET请求
      this.$axios
        .get('http://localhost:8081/api/products')
        .then((response) => {
          this.products = response.data; // 更新产品列表数据
        })
        .catch((error) => {
          console.error('Failed to fetch products:', error);
        });
    },
    addProduct() {
      // 发送请求添加产品
      // 这里使用axios或其他HTTP库发送POST请求
      this.$axios
        .post('http://localhost:8081/api/products', this.addProductForm)
        .then((response) => {
          this.addProductDialogVisible = false;
          this.resetAddProductForm();
          this.fetchProducts();
        })
        .catch((error) => {
          console.error('Failed to add product:', error);
        });
    },
    editProduct(product) {
      // 设置编辑产品表单的初始值
      this.editProductForm.id = product.id;
      this.editProductForm.name = product.name;
      this.editProductForm.price = product.price;
      this.editProductForm.stock = product.stock;
      this.editProductForm.image = product.image;
      this.editProductForm.description = product.description;
      this.editProductDialogVisible = true;
    },
    updateProduct() {
      // 发送请求更新产品
      // 这里使用axios或其他HTTP库发送PUT请求
      this.$axios
        .put(`http://localhost:8081/api/products/${this.editProductForm.id}`, this.editProductForm)
        .then((response) => {
          this.editProductDialogVisible = false;
          this.resetEditProductForm();
          this.fetchProducts();
        })
        .catch((error) => {
          console.error('Failed to update product:', error);
        });
    },
    deleteProduct(productId) {
      // 发送请求删除产品
      // 这里使用axios或其他HTTP库发送DELETE请求
      this.$axios
        .delete(`http://localhost:8081/api/products/${productId}`)
        .then((response) => {
          this.fetchProducts();
        })
        .catch((error) => {
          console.error('Failed to delete product:', error);
        });
    },
    searchProduct() {
      // 发送请求查询产品
      // 这里使用axios或其他HTTP库发送GET请求
      this.$axios
        .get(`http://localhost:8081/api/products?id=${this.searchId}`)
        .then((response) => {
          this.products = response.data; // 更新产品列表数据
        })
        .catch((error) => {
          console.error('Failed to search product:', error);
        });
    },
    handlePageChange(page) {
      // 处理分页变化
      this.currentPage = page;
    },
    showAddProductDialog() {
      // 显示添加产品对话框
      this.addProductDialogVisible = true;
    },
    resetAddProductForm() {
      // 重置添加产品表单
      this.addProductForm.name = '';
      this.addProductForm.price = 0;
      this.addProductForm.stock = 0;
      this.addProductForm.image = '';
      this.addProductForm.description = '';
    },
    resetEditProductForm() {
      // 重置编辑产品表单
      this.editProductForm.id = '';
      this.editProductForm.name = '';
      this.editProductForm.price = 0;
      this.editProductForm.stock = 0;
      this.editProductForm.image = '';
      this.editProductForm.description = '';
    },
  },
};
</script>

<style scoped>
.admin-product-management {
  margin: 20px;
}

.search-container {
  margin-bottom: 20px;
}

.search-input {
  width: 200px;
  margin-right: 10px;
}

.search-button {
  margin-left: 10px;
}

.product-image {
  width: 80px;
  height: 80px;
}

.pagination {
  margin-top: 2px;
  text-align: right;
}

.add-button {
  margin-top: 20px;
}
</style>
