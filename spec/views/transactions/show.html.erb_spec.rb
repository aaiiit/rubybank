require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :sender_account_id => 1,
      :receiver_account_id => 2,
      :amount => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
