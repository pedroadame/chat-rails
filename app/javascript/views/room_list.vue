<template lang='pug'>
  section.section
    .container
      .level
        .level-left
        .level-right
          new-room-button

    .container
      .rooms
        p(v-if="rooms.length == 0") {{ message }}
        room(v-for="room in rooms" :key='room.id' v-bind="room")

</template>

<script>
import axios from 'axios'

import NewRoomButton from '../components/NewRoomButton.vue'
import Room from '../components/Room.vue'

export default {
  data: function () {
    return {
      rooms: [],
      message: 'Cargando...',
      cable: {}
    }
  },
  components: {
    NewRoomButton,
    Room
  },
  methods: {
    loadRooms: function () {
      const that = this
      axios.get('/rooms')
        .then(function (response) {
          that.rooms = response.data
          that.message = ''
        })
        .catch(function (error) {
          that.message = "Parece que hubo algun error. Intenta recargar la pagina."
        })
    },
    connectActionCable: function () {
      this.cable = App.cable.subscriptions.create({
        channel: "RoomListChannel"
      },{
        connected: () => {
          console.log("Cable connected")
        },
        received: (data) => {
          this.addRoom(data.room)
        }
      })
    },
    addRoom: function (room) {
      this.rooms.unshift(room)
    }
  },
  created: function () {
    this.loadRooms()
    this.connectActionCable()
  }
}
</script>

<style lang='sass' scoped>

</style>
