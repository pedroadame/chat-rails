class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    ActionCable.server.broadcast "rooms", message: 'illo'
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      # flash[:error] = "No se ha podido crear la sala de chat"
      render :new
    end
  end

  def show
    @messages = @room.messages.for_display
  end

  private
  def set_room
    @room = Room.find params[:id]
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
