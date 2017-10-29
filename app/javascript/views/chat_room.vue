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
</template>

<script>
import axios from 'axios'

import Message from '../components/Message.vue'
// import ChatBox from '../components/ChatBox.vue'

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
        })
        .catch(function (response) {
          that.$router.push('/rooms')
        })
    }
  }, watch: {
    '$route' (to, from) {
      if(from.params.id){
        this.loadMessages()
      }

    }
  },
  components: {
    Message
  }
}
</script>

