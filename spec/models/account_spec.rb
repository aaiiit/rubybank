require 'rails_helper'

RSpec.describe Account, type: :model do
  it "should not be possible to create an account without user_id" do
    expect(Account.create.persisted?).to eq(false)
  end

  context "A persisted user" do
    before do
      @user = User.create(login: 'satoshi',password: 'nakomoto',password_confirmation: 'nakomoto')
    end

    it "should have a start account balance of 0" do
      expect(@user.account.balance).to eq(0)
    end

    it "can be given credits" do
      @user.account.add_credits(100)
      expect(@user.account.balance).to eq(100)
    end

  end
end
