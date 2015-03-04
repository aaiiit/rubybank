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

    context "when given 100 credits" do
      subject(:account) do
        @user.account
      end
      before do
        account.add_credit 100
      end

      it "its balance should be 100" do
        expect(account.balance).to eq(100)
      end

      it "an accountline should be added" do
        expect{ account.add_credit 10 }.to change{ account.lines.count }.by(1)
      end

    end
  end
end
