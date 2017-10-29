<template lang='pug'>
  .modal.new-room-modal.is-active
    .modal-background(@click='dismiss')
    .modal-card
      section.modal-card-head
        p.modal-card-title Nueva sala
      section.modal-card-body
        .field
          .room-errors.notification.is-danger(v-if='error.length > 0') {{ error }}
        .field
          input.input(name='name', placeholder='Nombre de la sala', v-model='name', @keyup.enter='createRoom')
      section.modal-card-foot
        button.button.is-success(@click='createRoom') Crear sala

</template>

<script>
import axios from 'axios'
let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

export default {
  data: function () {
    return {
      name: '',
      error: ''
    }
  },
  methods: {
    dismiss: function () {
      this.$emit('dismiss')
      this.name = ''
    },
    createRoom: function () {
      const that = this
      axios.post('/rooms', {
        room: {
          name: that.name
        }
      })
        .then(function (response) {
          that.$router.push('/rooms/'+response.data.id)
        })
        .catch(function (response) {
          if(that.name.length == 0){
            that.error = 'Escribe un nombre'
          } else {
            that.error = 'El nombre ya esta escogido'
          }
        })
    }
  }
}
</script>
