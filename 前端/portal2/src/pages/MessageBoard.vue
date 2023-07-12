 <template>
  <div class="message-board">
    <h1 class="page-title">留言板</h1>
    <div class="message-list-container">
      <ul class="message-list">
        <li v-for="message in messages" :key="message.id" class="message-item">
          <span class="message-name">{{ message.name }}</span>
          <p class="message-content">{{ message.content }}</p>
        </li>
      </ul>
    </div>
    <div class="button-container">
      <el-button type="primary" @click="showDialog">提交留言</el-button>
    </div>
    <el-dialog title="提交留言" :visible.sync="dialogVisible" width="30%">
      <el-form label-position="top">
        <el-form-item label="姓名">
          <el-input v-model="name"></el-input>
        </el-form-item>
        <el-form-item label="留言内容">
          <el-input type="textarea" v-model="message"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitMessage">提交</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'MessageBoard',
  data() {
    return {
      name: '',
      message: '',
      messages: [],
      dialogVisible: false
    };
  },
  mounted() {
    this.fetchMessages();
  },
  methods: {
    fetchMessages() {
      axios.get('http://localhost:8081/api/messages')
        .then(response => {
          this.messages = response.data;
          this.scrollToBottom();
        })
        .catch(error => {
          console.log(error);
        });
    },
    showDialog() {
      this.dialogVisible = true;
    },
    submitMessage() {
      if (this.name && this.message) {
        const newMessage = {
          name: this.name,
          content: this.message
        };

        axios.post('http://localhost:8081/api/messages', newMessage)
          .then(response => {
            this.messages.push(response.data);
            this.name = '';
            this.message = '';
            this.dialogVisible = false;
            this.scrollToBottom();
          })
          .catch(error => {
            console.log(error);
          });
      }
    },
    scrollToBottom() {
      this.$nextTick(() => {
        setTimeout(() => {
          const container = document.querySelector('.message-list-container');
          container.scrollTop = container.scrollHeight;
        }, 0);
      });
    }
  }
};
</script>

<style scoped>
.message-board {
  padding: 20px;
  text-align: center;
}

.page-title {
  font-size: 24px;
  margin-bottom: 20px;
}

.message-list-container {
  height: 400px;
  overflow-y: auto;
  border: 1px solid #ddd;
  padding: 10px;
}

.message-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.message-item {
  margin-top: 10px;
}

.message-name {
  font-weight: bold;
}

.message-content {
  margin-top: 5px;
  font-size: 14px;
  color: #555;
}

.button-container {
  margin-top: 20px;
}
</style>





