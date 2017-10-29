<template lang='pug'>
.card.room
  header.card-header
    router-link(v-bind:to="roomRoute", class="card-header-title") {{ name }}
</template>

<script>
export default {
  props: {
    id: {
      type: Number,
      required: true
    },
    name: {
      type: String,
      required: true
    }
  },
  computed: {
    roomRoute: function () {
      return "/rooms/" + this.id
    }
  }
}

</script>
