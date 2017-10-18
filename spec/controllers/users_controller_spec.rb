require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context 'with correct params' do
      subject { post :create, params: { user: { name: "a_name" } } }
      it "returns http success with good params" do
        expect(subject).to have_http_status(:success)
      end

      it "redirects to rooms_path" do
        expect(subject).to redirect_to(rooms_path)
      end

      it "registers the user" do
        expect{ subject }.to change { User.count }.by(1)
      end
    end

    context 'without correct params' do
      subject { post :create, params: { user: { name: "" } } }

      it "renders :new" do
        expect(subject).to render_template("new")
      end

      it "doesn't register the user" do
        expect{ subject }.to_not change { User.count }
      end
    end
  end

end
