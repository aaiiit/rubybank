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

    context "when given credits" do
      @count = 0

      before do
        @count = @user.account.lines.count
        @user.account.add_credits(100)
      end

      it "its balance should be changed" do
        expect(@user.account.balance).to eq(100)
      end

      it "an accountline should be added" do
        expect(@user.account.lines.count).to eq(@user.account.lines.count)
      end

    end
  end
end
