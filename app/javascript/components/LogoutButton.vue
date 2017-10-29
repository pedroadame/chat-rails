<template lang='pug'>
  button.button.is-light(@click='logout') Salir
</template>

<script>
export default {
  methods: {
    logout: function () {
      if(window.confirm("Estas seguro de que deseas salir?")){
        this.$store.commit('logout')
        this.$router.push('/login')
      }
    }
  }

}
</script>

<style>
</style>
