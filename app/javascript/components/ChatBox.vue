<template lang='pug'>
  .new-message-box.control
    textarea.textarea(name='content', id='chat-box', placeholder='Escribe aqui' @keyup.enter="sendMessage" v-model="message")
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      message: ''
    }
  },
  methods: {
    sendMessage: function () {
      this.$emit('send', this.message)
      this.message = ''
    }
  }
}
</script>

<style>
</style>
