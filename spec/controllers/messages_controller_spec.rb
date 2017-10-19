require 'rails_helper'
require 'support/login_helper'

RSpec.describe MessagesController, type: :controller do
  include LoginHelper

  describe "POST #create" do
    context 'with good params' do
      before do
        login!
      end

      let!(:room) { create :room }

      subject { post :create, params: { id: room.id, message: { content: "Test message"} } }

      it "redirects to room" do
        expect(subject).to redirect_to(room_path(room))
      end

      it "saves the message for the user" do
        expect { subject }.to change { @user.reload.messages.count }.by(1)
      end
    end
  end

end
