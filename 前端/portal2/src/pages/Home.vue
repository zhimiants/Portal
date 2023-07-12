<template>
  <div class="home">
    <div class="content">
      <div class="carousel">
        <el-carousel :interval="5000">
          <el-carousel-item v-for="(item, index) in carouselItems" :key="index">
            <img :src="item.image" alt="carousel-image" class="carousel-image" />
          </el-carousel-item>
        </el-carousel>
      </div>
      <div class="announcement-news">
        <div class="announcement">
          <h3>公司公告</h3>
          <ul>
            <li v-for="(notice, index) in notices" :key="index">
              <a :href="notice.link" class="notice-link">{{ notice.title }}</a>
              <p class="notice-description">{{ notice.description }}</p>
            </li>
          </ul>
        </div>
        <div class="news">
          <h3>公司捷报</h3>
          <ul>
            <li v-for="(news, index) in companyNews" :key="index">
              <a :href="news.link" class="news-link">{{ news.title }}</a>
              <p class="news-description">{{ news.description }}</p>
            </li>
          </ul>
        </div>
      </div>
      <div class="additional-content">
        <div class="contacts">
          <h3>联系我们</h3>
          <ul>
            <li v-for="(contact, index) in contacts" :key="index">
              <i class="el-icon-phone contact-icon"></i>{{ contact.title }}
            </li>
          </ul>
        </div>
        <div class="partners">
          <h3>合作伙伴</h3>
          <div class="partner-list">
            <div v-for="(partner, index) in partners" :key="index" class="partner">
              <img :src="partner.image" alt="partner-logo" class="partner-logo" />
              <p>{{ partner.name }}</p>
            </div>
          </div>
        </div>
        <div class="social-media">
          <h3>社交媒体</h3>
          <ul class="media-list">
            <li v-for="(media, index) in socialMedia" :key="index">
              <a :href="media.link" class="media-link">
                <i :class="media.icon"></i>
                {{ media.name }}
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      carouselItems: [
        { image: require('@/assets/car1.jpg') },
        { image: require('@/assets/car2.jpg') },
        { image: require('@/assets/car3.jpg') },
      ],
      notices: [
        {
          title: '公司公告1',
          description: '这是公司公告1的描述。',
          link: 'https://example.com/notice1',
        },
        {
          title: '公司公告2',
          description: '这是公司公告2的描述。',
          link: 'https://example.com/notice2',
        },
        {
          title: '公司公告3',
          description: '这是公司公告3的描述。',
          link: 'https://example.com/notice3',
        },
      ],
      companyNews: [
        {
          title: '公司捷报1',
          description: '这是公司捷报1的描述。',
          link: 'https://example.com/news1',
        },
        {
          title: '公司捷报2',
          description: '这是公司捷报2的描述。',
          link: 'https://example.com/news2',
        },
        {
          title: '公司捷报3',
          description: '这是公司捷报3的描述。',
          link: 'https://example.com/news3',
        },
      ],
      contacts: [
        { title: '联系方式1:12345678' },
        { title: '联系方式2:12314145' },
        { title: '联系方式3:12412451' },
      ],
      partners: [
        { name: '合作伙伴1', image: require('@/assets/home2.png') },
        { name: '合作伙伴2', image: require('@/assets/home3.png') },
        { name: '合作伙伴3', image: require('@/assets/home3.png') },
        { name: '合作伙伴4', image: require('@/assets/home4.png') },
        { name: '合作伙伴5', image: require('@/assets/home5.png') },
      ],
      socialMedia: [
        { name: '微信', icon: 'fab fa-weixin', link: 'https://example.com/wechat' },
        { name: '微博', icon: 'fab fa-weibo', link: 'https://example.com/weibo' },
        { name: '抖音', icon: 'fab fa-tiktok', link: 'https://example.com/douyin' },
      ],
    };
  },
};
</script>

<style scoped>
.home {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  padding: 20px;
}

.content {
  width: 100%;
  max-width: 1200px;
}

.carousel-image {
  width: 100%;
  height: 100%;
}

.carousel {
  margin-bottom: 20px;
}

.announcement-news {
  display: flex;
  justify-content: space-between;
}

.announcement,
.news {
  width: 45%;
}

.notice-link,
.news-link {
  color: #337ab7;
  text-decoration: none;
  font-weight: bold;
}

.notice-description,
.news-description {
  margin-top: 4px;
}

.additional-content {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

.contacts,
.partners,
.social-media {
  width: 30%;
}

.contacts h3,
.partners h3,
.social-media h3 {
  text-align: center;
  margin-bottom: 10px;
}

.contact-icon {
  margin-right: 5px;
}

.partner-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.partner {
  width: 45%;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.partner-logo {
  width: 80px;
  height: 80px;
  margin-bottom: 10px;
}

.media-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.media-link {
  display: flex;
  align-items: center;
  color: #337ab7;
  text-decoration: none;
}

.media-link i {
  margin-right: 5px;
}
</style>
