$ ->
  room_list = $(".rooms")
  if room_list.length > 0
    App.chat = App.cable.subscriptions.create { channel: "RoomListChannel" },
      connected: () ->
        console.log("ActionCable connected to server.")

      received: (data) ->
        console.log "New room created" 
        $(room_list).append data['room']
