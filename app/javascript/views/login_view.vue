<template lang='pug'>
  .login-container
    .chat-logo.chat-logo--big
    .new-user-form
      .field.has-addons
        .control
          input.input(v-model='name', placeholder='Nombre de usuario', @keyup.enter='login')
        .control
          button.button(@click='login') Entrar
</template>

<script>
export default {
  data: function () {
    return {
      name: ''
    }
  },
  methods: {
    login: function () {
      this.$store.commit('login', this.name)
      this.$router.push('/rooms')
    }
  }

}
</script>

<style lang='sass' scoped>
#app
  width: 100%
  height: 100%
  background-color: red
</style>
