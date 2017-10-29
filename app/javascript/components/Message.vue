<template lang='pug'>
  .chat-message(:id='messageId')
    p {{ user}} > {{ content }}
</template>

<script>
export default {
  props: ['id', 'user', 'content'],
  computed: {
    messageId: function () {
      return 'message-'+this.id
    }
  }

}
</script>

<style>
</style>
