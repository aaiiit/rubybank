require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :sender_account_id => 1,
      :receiver_account_id => 1,
      :amount => 1
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_sender_account_id[name=?]", "transaction[sender_account_id]"

      assert_select "input#transaction_receiver_account_id[name=?]", "transaction[receiver_account_id]"

      assert_select "input#transaction_amount[name=?]", "transaction[amount]"
    end
  end
end
