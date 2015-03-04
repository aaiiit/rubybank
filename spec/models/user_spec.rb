require 'rails_helper'

RSpec.describe User, type: :model do

  it "should not be possible to create user without password" do
    user = User.new(login: 'satoshi')
    expect(user.save).to eq(false)
  end

  context "new valid user" do
    before do
      @user = User.new(login: 'satoshi',password: 'nakomoto',password_confirmation: 'nakomoto')
      @user.save
    end

    it "should be possible to create user with password" do
      expect(@user.persisted?).to eq(true)
    end

    it "should have created a crypted_password from the password" do
      expect(@user.crypted_password).not_to eq(nil)
    end

    it "should have created an accompanying account for user" do
      expect(@user.account).not_to eq(nil)
      expect(@user).to eq(@user.account.user)
    end

  end
end
