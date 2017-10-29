class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.for_display
    render json: @rooms
  end

  def create
    @room = Room.new(room_params)
    @room.save
  end

  def show
    @messages = @room.messages.for_display
    render json: { room: @room, messages: @messages }
  end

  private
  def set_room
    @room = Room.find params[:id]
  end

  def room_params
    params.require(:room).permit(:name)
  end

  def render_room(room)
    render(partial: 'room', locals: { room: @room })
  end
end
