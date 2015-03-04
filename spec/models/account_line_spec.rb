require 'rails_helper'

RSpec.describe AccountLine, type: :model do
  it "should not be possible to create an AccountLine without account_id" do
    expect(AccountLine.create.persisted?).to eq(false)
  end
end
