<template lang='pug'>
  #login
    h1 Chat!
    div.inputs
      form(v-on:submit.prevent='login')
        label Tu nombre:
        input(v-model='name')
        button(type="submit") Login
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
      this.$store.commit('username', this.name)
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
