require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :sender_account_id => 1,
        :receiver_account_id => 2,
        :amount => 3
      ),
      Transaction.create!(
        :sender_account_id => 1,
        :receiver_account_id => 2,
        :amount => 3
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end