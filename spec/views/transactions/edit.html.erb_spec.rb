require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :sender_account_id => 1,
      :receiver_account_id => 1,
      :amount => 1
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_sender_account_id[name=?]", "transaction[sender_account_id]"

      assert_select "input#transaction_receiver_account_id[name=?]", "transaction[receiver_account_id]"

      assert_select "input#transaction_amount[name=?]", "transaction[amount]"
    end
  end
end
