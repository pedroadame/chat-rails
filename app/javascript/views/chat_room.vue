<template>
  <div> Dentro del chat {{ chat }}</div>
</template>

<script>
export default {
  computed: {
    chat: function () {
      return this.$route.params.id
    }
  },
  created: function () {
    console.log("Se ha accedido a un chat")
  },
  watch: {
    '$route' (to, from) {
      console.log("Cambio de ruta!")
      if(from.params.id){
        console.log("Se ha cambiado de chat")
      }

    }
  }
}
</script>

