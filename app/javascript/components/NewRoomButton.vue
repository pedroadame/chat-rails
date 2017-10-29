<template lang='pug'>
  div
    a.level-item.button.is-link(@click.prevent="launchModal") Nueva sala
    new-room-modal(v-if='shown', @dismiss='dismissModal')
</template>

<script>
import NewRoomModal from './NewRoomModal.vue'
export default {
  data: function () {
    return {
      shown: false
    }
  },
  methods: {
    launchModal: function () {
      this.shown = true
    },
    dismissModal: function () {
      this.shown = false
    }
  },
  components: {
    NewRoomModal
  }
}
</script>

<style>
</style>
