<template lang='pug'>
  .login-container
    .chat-logo.chat-logo--big
    .new-user-form
      .field.has-addons
        .control
          input.input.login-input(v-model='name', placeholder='Nombre de usuario', @keyup.enter='login', name='username')
        .control
          button.button(@click='login') Entrar
      .field(v-if='error.length > 0')
        p {{ error }}
</template>

<script>
export default {
  data: function () {
    return {
      name: '',
      error: ''
    }
  },
  methods: {
    login: function () {
      if(this.name.length > 3){

        this.$store.commit('login', this.name)
        this.$router.push('/rooms')
      } else {
        this.error = 'El nombre es demasiado corto'
      }
    }
  }

}
</script>

<style lang='sass' scoped>
</style>
