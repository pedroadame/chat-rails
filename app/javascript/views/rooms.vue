<template lang='pug'>
  .app-container
    app-bar
    router-view
</template>

<script>
import AppBar from '../components/AppBar.vue'

export default {
  components: {
    AppBar
  }
}

</script>

<style lang='sass'>
.app-container
  width: 100%
  height: 100%
</style>
