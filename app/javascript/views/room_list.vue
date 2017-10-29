<template lang='pug'>
  section.section
    .container
      .level
        .level-left
        .level-right
          new-room-button

    .container
      .rooms
        room(v-for="room in rooms" :key='room.id' v-bind="room")

</template>

<script>
import NewRoomButton from '../components/NewRoomButton.vue'
import Room from '../components/Room.vue'

export default {
  data: function () {
    return {
      rooms: [
        { name: "illo", id: 1 },
        { name: "illo2", id: 2 },
        { name: "illo2", id: 3 },
      ]
    }
  },
  components: {
    NewRoomButton,
    Room
  }
}
</script>

<style lang='sass' scoped>

</style>
