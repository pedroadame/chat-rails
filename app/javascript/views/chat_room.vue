<template lang='pug'>
  section.section.chatroom-section
    .container.chatroom-container
      .level
        .level-left
          p.title(id='room') {{ roomName }}
        .level-right
          div#back
            router-link(to='/rooms') Salir de la sala
      .chatroom
        .messages
          p(v-if="messages.length == 0") {{ message }}
          message(v-for="message in messages" :key='message.id' v-bind='message')
        chat-box(@send='sendMessage')
</template>

<script>
import axios from 'axios'

import Message from '../components/Message.vue'
import ChatBox from '../components/ChatBox.vue'

export default {
  data: function () {
    return {
      roomName: '',
      messages: [],
      message: 'Cargando...',
      cable: {}
    }
  },
  props: {
    id: {
      type: String,
      required: true
    }
  },
  created: function () {
    this.loadMessages()
    this.connectActionCable()
  },
  methods: {
    loadMessages: function () {
      var that = this
      axios.get('/rooms/'+this.id, {
        params: {
          id: this.id
        }
      }).then(function (response) {
          that.roomName = response.data.room.name
          that.messages = response.data.messages
          that.message = ''
        })
        .catch(function (response) {
          that.$router.push('/rooms')
        })
    },
    connectActionCable: function () {
      var that = this
      this.cable = App.cable.subscriptions.create({
        channel: "RoomsChannel", room_id: that.id, username: that.$store.state.username
      },{
        connected: () => {
          console.log("Cable connected")
        },
        received: (data) => {
          this.addMessage(data)
          this.scrollBottom()
        }
      })
    },
    addMessage: function (data) {
      this.messages.push({ content: data.message,
      user: data.user,
        id: data.message_id})
    },
    scrollBottom: function () {
      this.$nextTick(() => {
        const list = this.$el.querySelector('.messages')
        list.scrollTop = list.scrollHeight
      })
    },
    sendMessage: function (message) {
      this.cable.send({
        message: message
      })
    }
  }, watch: {
    '$route' (to, from) {
      if(from.params.id){
        this.loadMessages()
        this.cable.unsubscribe()
        this.connectActionCable()
      }

    }
  },
  components: {
    Message,
    ChatBox
  }
}
</script>

