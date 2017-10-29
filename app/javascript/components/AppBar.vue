<template lang="pug">
  nav.navbar.is-primary
    .navbar-brand
      .navbar-item.chat-logo
      .navbar-item Conectado como {{ username }}
      button.button.navbar-burger.is-primary(@click="showNavbarMenu" v-bind:class="{ 'is-active': menuOpened }")
        span
        span
        span
    .navbar-menu(v-bind:class="{ 'is-active': menuOpened }")
      .navbar-end
        .navbar-item
          button.button.is-light.logout-button Salir

</template>

<script>
export default {
  data: function () {
    return {
      menuOpened: false,
      username: ''
    }
  },
  created: function () {
    this.username =  this.$store.state.username
  },
  methods: {
    showNavbarMenu: function () {
      this.menuOpened = !this.menuOpened
    }
  }
}

</script>

<style lang='sass'>

</style>
