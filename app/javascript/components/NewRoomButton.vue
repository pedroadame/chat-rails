<template lang='pug'>
  a.level-item.button.is-link(@click.prevent="launchModal") Nueva sala
</template>

<script>
export default {
  methods: {
    launchModal: function () {
      console.log("illorl")
    }
  }
}
</script>

<style>
</style>
