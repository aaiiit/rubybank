require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  context "A valid user is created and logged in" do
    before do
      @user = User.create(login: 'satoshi',password: 'nakomoto',password_confirmation: 'nakomoto')
      controller.stub(:current_user).and_return(@user)
    end

    describe "GET #show" do
      it "returns http success after login" do
        get :show, id: @user.account.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end
