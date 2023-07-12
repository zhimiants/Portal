<template>
  <footer class="footer">
    <div class="footer-content">
      <p class="footer-text">版权所有 &copy; 2023 20软工5班 lxw</p>
      <div class="social-media">
        <a href="#" class="social-link">
          <i class="fab fa-weixin"></i>
        </a>
        <a href="#" class="social-link">
          <i class="fab fa-weibo"></i>
        </a>
        <a href="#" class="social-link">
          <i class="fab fa-tiktok"></i>
        </a>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.footer {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  max-height: 5%;
  background-color: #f5f5f5;
  padding: 20px;
}

.footer-content {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.footer-text {
  margin: 0;
  font-size: 14px;
  color: #999;
}

.social-media {
  display: flex;
  align-items: center;
}

.social-link {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 30px;
  height: 30px;
  margin: 0 5px;
  border-radius: 50%;
  background-color: #eee;
  color: #999;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.social-link:hover {
  background-color: #ccc;
}

.social-link i {
  font-size: 16px;
}
</style>
