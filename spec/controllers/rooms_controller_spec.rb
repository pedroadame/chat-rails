require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  describe "GET #index" do
    context 'when logged in' do
      before do
        login!
      end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'when not logged in' do
      it "redirects to root path" do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end

  private
  def login!
    @user = create :user
    session[:user_id] = @user.id
  end
end
