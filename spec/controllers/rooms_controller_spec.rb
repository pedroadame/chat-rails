require 'rails_helper'
require 'support/login_helper'

RSpec.describe RoomsController, type: :controller do
  include LoginHelper

  describe "GET #index" do
    before do
      login!
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    before do
      login!
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before do
      login!
    end

    subject do
      post :create, params: {
        room: { name: "Test room" }
      }
    end

    it "creates the room" do
      expect{ subject }.to change { Room.count}.by 1
    end

    it "redirects to the room" do
      expect(subject).to have_http_status(:found)
    end
  end

  describe "GET #show" do
    let!(:room) { create :room }
    before do
      login!
    end

    it "returns http success" do
      get :show, params: { id: room.id }
      expect(response).to have_http_status(:success)
    end
  end
end
