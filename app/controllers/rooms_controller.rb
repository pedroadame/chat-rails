class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, except: [:index]

  def index
    @rooms = Room.all
  end

  def show
    @messages = @room.messages.for_display
  end

  private
  def set_room
    @room = Room.find params[:id]
  end
end
