class MessagesController < ApplicationController
  before_action :set_room

  def create
    
    message = @room.messages.build(user: @current_user)
    message.content = params[:message][:content]
    message.save
    redirect_to @room
  end

  private
  def set_room
    @room = Room.find params[:id]
  end
end
