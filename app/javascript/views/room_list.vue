<template lang='pug'>
  section.section
    .container
      .level
        .level-left
        .level-right
          new-room-button

    .container
      .rooms
</template>

<script>
import NewRoomButton from '../components/NewRoomButton.vue'
export default {
  components: {
    NewRoomButton
  }
}
</script>

<style lang='sass' scoped>

</style>
