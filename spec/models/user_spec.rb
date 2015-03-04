require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be possible to create user with password" do
    user = User.new(login: 'satoshi',password: 'nakomoto',password_confirmation: 'nakomoto')
    expect(user.save).to eq(true)
    expect(user.crypted_password).not_to eq(nil)
  end

  it "should not be possible to create user without password" do
    user = User.new(login: 'satoshi')
    expect(user.save).to eq(false)
  end
end
