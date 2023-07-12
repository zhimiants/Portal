// main.js
import Vue from 'vue';
import App from './App.vue';
import VueRouter from 'vue-router';
import Home from './pages/Home.vue';
import Product from './pages/Product.vue';
import MessageBoard from './pages/MessageBoard.vue';
import Login from './pages/Login.vue';
import AdminDashboard from './pages/Admin/Dashboard.vue';
import ProductManagement from './pages/Admin/ProductManagement.vue';
import MessageBoardManagement from './pages/Admin/MessageBoardManagement.vue';

import '@fortawesome/fontawesome-free/css/all.css';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import axios from 'axios'
//其他vue组件中就可以this.$axios调用使用
Vue.prototype.$axios = axios

Vue.use(ElementUI);

Vue.use(VueRouter);

const routes = [
  { path: '/', component: Home },
  { path: '/product', component: Product },
  { path: '/message-board', component: MessageBoard },
  { path: '/login', component: Login },
  { path: '/admin/dashboard',component: AdminDashboard},
  { path: '/admin/product-management', component: ProductManagement },
  { path: '/admin/message-board-management', component: MessageBoardManagement },

];

const router = new VueRouter({
  routes
});

router.beforeEach((to, from, next) => {
  const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';

  if (to.matched.some(record => record.meta.requiresAuth)) {
    // 需要登录的页面
    if (!isLoggedIn) {
      // 未登录则跳转到登录页面
      next('/login');
    } else {
      // 已登录则继续
      next();
    }
  } else {
    // 不需要登录的页面
    next();
  }
});

new Vue({
  router,
  render: h => h(App)
}).$mount('#app');

    // children: [
    //   { path: '', component: ProductManagement },
    //   { path: 'product-management', component: ProductManagement },
    //   { path: 'message-board-management', component: MessageBoardManagement }
    // ]