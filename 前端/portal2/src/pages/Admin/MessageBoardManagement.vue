<template>
  <div class="admin-message-board">
    <h1>后台留言板</h1>
    <el-form @submit.native.prevent="addMessage" :model="newMessage" ref="messageForm" :rules="messageFormRules" inline>
      <el-form-item label="名称:" prop="name">
        <el-input v-model="newMessage.name" required></el-input>
      </el-form-item>
      <el-form-item label="内容:" prop="content">
        <el-input v-model="newMessage.content" required></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" native-type="submit">添加留言</el-button>
      </el-form-item>
    </el-form>
    <el-table :data="messages" style="width: 100%" stripe>
      <el-table-column prop="id" label="ID"></el-table-column>
      <el-table-column prop="name" label="Name"></el-table-column>
      <el-table-column prop="content" label="Content"></el-table-column>
      <el-table-column label="Actions">
        <template slot-scope="scope">
          <el-button @click="editMessage(scope.row)" type="text">编辑</el-button>
          <el-button @click="deleteMessage(scope.row.id)" type="text">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="编辑留言" :visible="editDialogVisible" @close="closeEditDialog">
      <el-form :model="editedMessage" :rules="messageFormRules" ref="editMessageForm">
        <el-form-item label="名称:" prop="name">
          <el-input v-model="editedMessage.name" required></el-input>
        </el-form-item>
        <el-form-item label="内容:" prop="content">
          <el-input v-model="editedMessage.content" required></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="closeEditDialog">取消</el-button>
        <el-button type="primary" @click="updateMessage">保存</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'AdminMessageBoard',
  data() {
    return {
      messages: [],
      newMessage: {
        name: '',
        content: ''
      },
      editedMessage: {
        id: null,
        name: '',
        content: ''
      },
      messageFormRules: {
        name: [{ required: true, message: '请输入名称', trigger: 'blur' }],
        content: [{ required: true, message: '请输入内容', trigger: 'blur' }]
      },
      editDialogVisible: false
    };
  },
  mounted() {
    this.fetchMessages();
  },
  methods: {
    fetchMessages() {
      this.$axios.get('http://localhost:8081/api/messages')
        .then(response => {
          this.messages = response.data;
        })
        .catch(error => {
          console.error('Failed to fetch messages:', error);
        });
    },
    addMessage() {
      this.$refs.messageForm.validate(valid => {
        if (valid) {
          this.$axios.post('http://localhost:8081/api/messages', this.newMessage)
            .then(response => {
              this.messages.push(response.data);
              this.resetNewMessage();
            })
            .catch(error => {
              console.error('Failed to add message:', error);
            });
        }
      });
    },
    editMessage(message) {
      this.editedMessage.id = message.id;
      this.editedMessage.name = message.name;
      this.editedMessage.content = message.content;
      this.editDialogVisible = true;
    },
    updateMessage() {
      this.$refs.editMessageForm.validate(valid => {
        if (valid) {
          this.$axios.put(`http://localhost:8081/api/messages/${this.editedMessage.id}`, this.editedMessage)
            .then(response => {
              const updatedMessage = response.data;
              const index = this.messages.findIndex(message => message.id === updatedMessage.id);
              if (index !== -1) {
                this.messages.splice(index, 1, updatedMessage);
                this.closeEditDialog();
              }
            })
            .catch(error => {
              console.error('Failed to update message:', error);
            });
        }
      });
    },
    deleteMessage(messageId) {
      this.$axios.delete(`http://localhost:8081/api/messages/${messageId}`)
        .then(() => {
          this.messages = this.messages.filter(message => message.id !== messageId);
        })
        .catch(error => {
          console.error('Failed to delete message:', error);
        });
    },
    resetNewMessage() {
      this.$refs.messageForm.resetFields();
    },
    resetEditedMessage() {
      this.editedMessage.id = null;
      this.editedMessage.name = '';
      this.editedMessage.content = '';
    },
    closeEditDialog() {
      this.editDialogVisible = false;
      this.resetEditedMessage();
    }
  }
};
</script>

<style scoped>
.admin-message-board {
  padding: 20px;
}

.el-table__header th {
  background-color: #f0f0f0;
}

.el-table__row:nth-child(even) {
  background-color: #f9f9f9;
}
</style>
