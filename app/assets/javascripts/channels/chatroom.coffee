$ ->
  room = $("#room")
  if room.length > 0
    roomId = room.data("room-id")
    App.chat = App.cable.subscriptions.create { channel: "RoomsChannel", room_id: roomId },
      connected: () ->
        console.log("ActionCable connected to server.")
        $(".messages").scrollTop $('.messages')[0].scrollHeight

      received: (data) ->
        console.log "Mew message received." 
        line = @formatLine(data)
        $(".messages").append line
        $(".messages").scrollTop $('.messages')[0].scrollHeight

      formatLine: (data) ->
        """
        <div class="chat-message" id="message-#{data["message_id"]}">
          <p>#{data["username"]} > #{data["message"]}</p>
        </div>
        """

    $("#chat-box").on "keypress", (evt) ->
      if evt.keyCode is 13
        box = event.target
        App.chat.send
          message: box.value
          room_id: roomId

        box.value = ''
      evt.preventDefault
