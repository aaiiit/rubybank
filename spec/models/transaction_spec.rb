require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "should not be possible to create an empty transaction" do
    expect(Transaction.create.persisted?).to eq(false)
  end

  context "A Sender User with 100 starting credit" do
    before do
      @sender = User.create(login: 'Sender',password: '12345',password_confirmation: '12345')
      @receiver = User.create(login: 'Receiver',password: '12345',password_confirmation: '12345')
      @sender.account.add_credits 100
    end

    context "pays Receiver User 100" do
      let(:sender_balance) do
        @sender.account.balance
      end

      subject(:tx) do
        Transaction.new(sender_account_id: @sender.account.id,receiver_account_id: @receiver.account.id,amount: 100)
      end

      it "creates a transaction" do
        expect(tx.save).not_to eq(false)
      end

      it "Sender User has 0" do
        expect{ tx.save }.to change { User.find(@sender.id).account.balance }.to(0)
      end

      it "Receiver User has 100" do
        expect{ tx.save }.to change { User.find(@receiver.id).account.balance }.to(100)
      end

      it "should create 2 AccountLines" do
        expect{ tx.save }.to change { AccountLine.count }.by(2)
      end
    end

  end
end
