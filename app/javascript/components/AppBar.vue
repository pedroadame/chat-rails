<template lang="pug">
  nav.navbar.is-primary
    .navbar-brand
      .navbar-item.chat-logo
      .navbar-item Conectado como {{ username }}
      button.button.navbar-burger.is-primary
        span
        span
        span
    .navbar-menu
      .navbar-end
        button.button Salir

</template>

<script>
export default {
  computed: {
    username: function () {
      return this.$store.state.username
    }
  }
}

</script>

<style lang='sass'>

</style>
