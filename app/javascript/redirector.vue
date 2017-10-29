<template>
</template>

<script>

export default {
  created: function () {
    if(this.$store.state.isAuthenticated){
      this.$router.push('/rooms')
    } else {
      this.$router.push('/login')

    }
  }
}
</script>

<style>
</style>
